#!/bin/sh
export VOLK_GENERIC=1
export GR_DONT_LOAD_PREFS=1
export srcdir=/home/anplus/Documents/gnuradio-file/gr-sendfile/lib
export PATH=/home/anplus/Documents/gnuradio-file/gr-sendfile/build/lib:$PATH
export LD_LIBRARY_PATH=/home/anplus/Documents/gnuradio-file/gr-sendfile/build/lib:$LD_LIBRARY_PATH
export PYTHONPATH=$PYTHONPATH
test-sendfile 
