/* -*- c++ -*- */

#define RFID_API

%include "gnuradio.i"			// the common stuff

//load generated python docstrings
%include "rfid_swig_doc.i"

%{
#include "rfid/reader.h"
#include "rfid/gate.h"
#include "rfid/tag_decoder.h"
#include "rfid/wifi_control.h"
%}

%include "rfid/reader.h"
GR_SWIG_BLOCK_MAGIC2(rfid, reader);


%include "rfid/gate.h"
GR_SWIG_BLOCK_MAGIC2(rfid, gate);
%include "rfid/tag_decoder.h"
GR_SWIG_BLOCK_MAGIC2(rfid, tag_decoder);
%include "rfid/wifi_control.h"
GR_SWIG_BLOCK_MAGIC2(rfid, wifi_control);
