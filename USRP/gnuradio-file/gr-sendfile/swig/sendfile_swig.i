/* -*- c++ -*- */

#define SENDFILE_API

%include "gnuradio.i"			// the common stuff

//load generated python docstrings
%include "sendfile_swig_doc.i"

%{
#include "sendfile/file_sender.h"
%}


%include "sendfile/file_sender.h"
GR_SWIG_BLOCK_MAGIC2(sendfile, file_sender);
