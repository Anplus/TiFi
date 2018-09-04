/* -*- c++ -*- */
/* 
 * Copyright 2018 zhenlin an.
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


#ifndef INCLUDED_RFID_WIFI_CONTROL_H
#define INCLUDED_RFID_WIFI_CONTROL_H

#include <rfid/api.h>
#include <gnuradio/sync_block.h>
#include <gnuradio/blocks/file_sink_base.h>

namespace gr {
    namespace rfid {

        /*!
         * \brief <+description of block+>
         * \ingroup rfid
         *
         */
    class RFID_API wifi_control : virtual public gr::sync_block, virtual public gr::blocks::file_sink_base {
        public:
            typedef boost::shared_ptr<wifi_control> sptr;

            /*!
             * \brief Return a shared_ptr to a new instance of rfid::wifi_control.
             *
             * To avoid accidental use of raw pointers, rfid::wifi_control's
             * constructor is in a private implementation
             * class. rfid::wifi_control::make is the public interface for
             * creating new instances.
             */
            static sptr make();
        };

    } // namespace rfid
} // namespace gr

#endif /* INCLUDED_RFID_WIFI_CONTROL_H */

