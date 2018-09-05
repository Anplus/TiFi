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


#ifndef INCLUDED_SENDFILE_FILE_SENDER_H
#define INCLUDED_SENDFILE_FILE_SENDER_H

#include <sendfile/api.h>
#include <gnuradio/sync_block.h>
#include <gnuradio/blocks/file_sink_base.h>

namespace gr {
    namespace sendfile {

        /*!
         * \brief <+description of block+>
         * \ingroup sendfile
         *
         */
    class SENDFILE_API file_sender : virtual public gr::sync_block, virtual public gr::blocks::file_sink_base {
        public:
            typedef boost::shared_ptr<file_sender> sptr;

            /*!
             * \brief Return a shared_ptr to a new instance of sendfile::file_sender.
             *
             * To avoid accidental use of raw pointers, sendfile::file_sender's
             * constructor is in a private implementation
             * class. sendfile::file_sender::make is the public interface for
             * creating new instances.
             */
            static sptr make(size_t itemsize);
        };

    } // namespace sendfile
} // namespace gr

#endif /* INCLUDED_SENDFILE_FILE_SENDER_H */

