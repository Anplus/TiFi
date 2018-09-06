/* -*- c++ -*- */

#define SENDFILE_API

%include "gnuradio.i"			// the common stuff

//load generated python docstrings
%include "sendfile_swig_doc.i"

%{
#include "sendfile/sendfile_wifi.h"
%}


%include "sendfile/sendfile_wifi.h"
GR_SWIG_BLOCK_MAGIC2(sendfile, sendfile_wifi);
