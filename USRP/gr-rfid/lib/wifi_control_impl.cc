/* -*- c++ -*- */
/* 
 * Copyright 2018 <+YOU OR YOUR COMPANY+>.
 * 
 * This is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3, or (at your option)
 * any later version.
 * 
 * This software is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this software; see the file COPYING.  If not, write to
 * the Free Software Foundation, Inc., 51 Franklin Street,
 * Boston, MA 02110-1301, USA.
 */

#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include <gnuradio/io_signature.h>
#include "wifi_control_impl.h"
#include <stdexcept>


namespace gr {
    namespace rfid {

        wifi_control::sptr
        wifi_control::make() {
            return gnuradio::get_initial_sptr
                    (new wifi_control_impl(sample_rate));
        }

        /*
         * The private constructor
         */
        wifi_control_impl::wifi_control_impl()
                : gr::sync_block("wifi_control",
                                 gr::io_signature::make(1, 1,typeof(sizeof(float))),
                                 gr::io_signature::make(0, 0, 0)){
    }

    /*
     * Our virtual destructor.
     */
    wifi_control_impl::~wifi_control_impl() {
    }

    bool
    file_source_impl::seek(long seek_point, int whence)
    {
        return fseek((FILE*)d_fp, seek_point *d_itemsize, whence) == 0;
    }


    void
    file_source_impl::open(const char *filename, bool repeat)
    {
        // obtain exclusive access for duration of this function
        gr::thread::scoped_lock lock(fp_mutex);

        int fd;

        // we use "open" to use to the O_LARGEFILE flag
        if((fd = ::open(filename, O_RDONLY | OUR_O_LARGEFILE | OUR_O_BINARY)) < 0) {
            perror(filename);
            throw std::runtime_error("can't open file");
        }

        if(d_new_fp) {
            fclose(d_new_fp);
            d_new_fp = 0;
        }

        if((d_new_fp = fdopen (fd, "rb")) == NULL) {
            perror(filename);
            ::close(fd);	// don't leak file descriptor if fdopen fails
            throw std::runtime_error("can't open file");
        }

        //Check to ensure the file will be consumed according to item size
        fseek(d_new_fp, 0, SEEK_END);
        int file_size = ftell(d_new_fp);
        rewind (d_new_fp);

        //Warn the user if part of the file will not be consumed.
        if(file_size % d_itemsize){
            GR_LOG_WARN(d_logger, "WARNING: File will not be fully consumed with the current output type");
        }

        d_updated = true;
        d_repeat = repeat;
    }

    void
    file_source_impl::close()
    {
        // obtain exclusive access for duration of this function
        gr::thread::scoped_lock lock(fp_mutex);

        if(d_new_fp != NULL) {
            fclose(d_new_fp);
            d_new_fp = NULL;
        }
        d_updated = true;
    }

    void
    file_source_impl::do_update()
    {
        if(d_updated) {
            gr::thread::scoped_lock lock(fp_mutex); // hold while in scope

            if(d_fp)
                fclose(d_fp);

            d_fp = d_new_fp;    // install new file pointer
            d_new_fp = 0;
            d_updated = false;
        }
    }

    int
    wifi_control_impl::work(int noutput_items,
                            gr_vector_const_void_star &input_items,
                            gr_vector_void_star &output_items) {
        char *inbuf = (char *) input_items[0];
        int nwritten = 0;
        do_update();                    // update d_fp is reqd

        if (!d_fp)
            return noutput_items;         // drop output on the floor

        while (nwritten < noutput_items) {
            int count = fwrite(inbuf, d_itemsize, noutput_items - nwritten, d_fp);
            if (count == 0) {
                if (ferror(d_fp)) {
                    std::stringstream s;
                    s << "file_sink write failed with error " << fileno(d_fp) << std::endl;
                    throw std::runtime_error(s.str());
                } else { // is EOF
                    break;
                }
            }
            nwritten += count;
            inbuf += count * d_itemsize;
        }

        if (d_unbuffered)
            fflush(d_fp);

        return nwritten;
    }

} /* namespace rfid */
} /* namespace gr */
