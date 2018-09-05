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

#ifndef INCLUDED_SENDFILE_FILE_SENDER_IMPL_H
#define INCLUDED_SENDFILE_FILE_SENDER_IMPL_H

#include <sendfile/file_sender.h>
#include <boost/thread/mutex.hpp>

namespace gr {
    namespace sendfile {

        class file_sender_impl : public file_sender {
        private:
            // Nothing to declare in this block.
            size_t d_itemsize;
            char *filename;
            FILE *d_fp;
            FILE *d_new_fp;
            bool d_repeat;
            bool d_updated;
            boost::mutex fp_mutex;

            void do_update();

        public:
            file_sender_impl(size_t itemsize);

            ~file_sender_impl();

            bool seek(long seek_point, int whence);

            void open(const char *filename, bool repeat);

            void close();

            // Where all the action really happens
            int work(int noutput_items,
                     gr_vector_const_void_star &input_items,
                     gr_vector_void_star &output_items);
        };

    } // namespace sendfile
} // namespace gr

#endif /* INCLUDED_SENDFILE_FILE_SENDER_IMPL_H */

