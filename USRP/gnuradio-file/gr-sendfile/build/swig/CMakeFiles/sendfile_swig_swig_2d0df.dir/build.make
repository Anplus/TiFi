# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/anplus/Documents/gnuradio-file/gr-sendfile

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/anplus/Documents/gnuradio-file/gr-sendfile/build

# Include any dependencies generated for this target.
include swig/CMakeFiles/sendfile_swig_swig_2d0df.dir/depend.make

# Include the progress variables for this target.
include swig/CMakeFiles/sendfile_swig_swig_2d0df.dir/progress.make

# Include the compile flags for this target's objects.
include swig/CMakeFiles/sendfile_swig_swig_2d0df.dir/flags.make

swig/sendfile_swig_swig_2d0df.cpp: ../swig/sendfile_swig.i
swig/sendfile_swig_swig_2d0df.cpp: /usr/local/include/gnuradio/swig/tagged_stream_block.i
swig/sendfile_swig_swig_2d0df.cpp: /usr/local/include/gnuradio/swig/gnuradio.i
swig/sendfile_swig_swig_2d0df.cpp: /usr/local/include/gnuradio/swig/realtime.i
swig/sendfile_swig_swig_2d0df.cpp: /usr/local/include/gnuradio/swig/block.i
swig/sendfile_swig_swig_2d0df.cpp: /usr/local/include/gnuradio/swig/block_detail.i
swig/sendfile_swig_swig_2d0df.cpp: /usr/local/include/gnuradio/swig/constants.i
swig/sendfile_swig_swig_2d0df.cpp: /usr/local/include/gnuradio/swig/sync_block.i
swig/sendfile_swig_swig_2d0df.cpp: swig/sendfile_swig_doc.i
swig/sendfile_swig_swig_2d0df.cpp: /usr/local/include/gnuradio/swig/gr_shared_ptr.i
swig/sendfile_swig_swig_2d0df.cpp: /usr/local/include/gnuradio/swig/block_gateway.i
swig/sendfile_swig_swig_2d0df.cpp: /usr/local/include/gnuradio/swig/sync_interpolator.i
swig/sendfile_swig_swig_2d0df.cpp: /usr/local/include/gnuradio/swig/gr_types.i
swig/sendfile_swig_swig_2d0df.cpp: /usr/local/include/gnuradio/swig/basic_block.i
swig/sendfile_swig_swig_2d0df.cpp: /usr/local/include/gnuradio/swig/gr_ctrlport.i
swig/sendfile_swig_swig_2d0df.cpp: /usr/local/include/gnuradio/swig/io_signature.i
swig/sendfile_swig_swig_2d0df.cpp: /usr/local/include/gnuradio/swig/top_block.i
swig/sendfile_swig_swig_2d0df.cpp: /usr/local/include/gnuradio/swig/gr_extras.i
swig/sendfile_swig_swig_2d0df.cpp: /usr/local/include/gnuradio/swig/message.i
swig/sendfile_swig_swig_2d0df.cpp: /usr/local/include/gnuradio/swig/tags.i
swig/sendfile_swig_swig_2d0df.cpp: /usr/local/include/gnuradio/swig/msg_handler.i
swig/sendfile_swig_swig_2d0df.cpp: /usr/local/include/gnuradio/swig/runtime_swig.i
swig/sendfile_swig_swig_2d0df.cpp: /usr/local/include/gnuradio/swig/msg_queue.i
swig/sendfile_swig_swig_2d0df.cpp: /usr/local/include/gnuradio/swig/buffer.i
swig/sendfile_swig_swig_2d0df.cpp: /usr/local/include/gnuradio/swig/gr_swig_block_magic.i
swig/sendfile_swig_swig_2d0df.cpp: ../swig/sendfile_swig.i
swig/sendfile_swig_swig_2d0df.cpp: /usr/local/include/gnuradio/swig/hier_block2.i
swig/sendfile_swig_swig_2d0df.cpp: /usr/local/include/gnuradio/swig/runtime_swig_doc.i
swig/sendfile_swig_swig_2d0df.cpp: /usr/local/include/gnuradio/swig/feval.i
swig/sendfile_swig_swig_2d0df.cpp: /usr/local/include/gnuradio/swig/sync_decimator.i
swig/sendfile_swig_swig_2d0df.cpp: /usr/local/include/gnuradio/swig/gr_logger.i
swig/sendfile_swig_swig_2d0df.cpp: /usr/local/include/gnuradio/swig/prefs.i
swig/sendfile_swig_swig_2d0df.cpp: swig/sendfile_swig.tag
	cd /home/anplus/Documents/gnuradio-file/gr-sendfile/build/swig && /usr/bin/cmake -E copy /home/anplus/Documents/gnuradio-file/gr-sendfile/build/swig/sendfile_swig_swig_2d0df.cpp.in /home/anplus/Documents/gnuradio-file/gr-sendfile/build/swig/sendfile_swig_swig_2d0df.cpp

swig/sendfile_swig_doc.i: swig/sendfile_swig_doc_swig_docs/xml/index.xml
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/anplus/Documents/gnuradio-file/gr-sendfile/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating python docstrings for sendfile_swig_doc"
	cd /home/anplus/Documents/gnuradio-file/gr-sendfile/docs/doxygen && /usr/bin/python2 -B /home/anplus/Documents/gnuradio-file/gr-sendfile/docs/doxygen/swig_doc.py /home/anplus/Documents/gnuradio-file/gr-sendfile/build/swig/sendfile_swig_doc_swig_docs/xml /home/anplus/Documents/gnuradio-file/gr-sendfile/build/swig/sendfile_swig_doc.i

swig/sendfile_swig.tag: swig/_sendfile_swig_swig_tag
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/anplus/Documents/gnuradio-file/gr-sendfile/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating sendfile_swig.tag"
	cd /home/anplus/Documents/gnuradio-file/gr-sendfile/build/swig && ./_sendfile_swig_swig_tag
	cd /home/anplus/Documents/gnuradio-file/gr-sendfile/build/swig && /usr/bin/cmake -E touch /home/anplus/Documents/gnuradio-file/gr-sendfile/build/swig/sendfile_swig.tag

swig/sendfile_swig_doc_swig_docs/xml/index.xml: swig/_sendfile_swig_doc_tag
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/anplus/Documents/gnuradio-file/gr-sendfile/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Generating doxygen xml for sendfile_swig_doc docs"
	cd /home/anplus/Documents/gnuradio-file/gr-sendfile/build/swig && ./_sendfile_swig_doc_tag
	cd /home/anplus/Documents/gnuradio-file/gr-sendfile/build/swig && /usr/bin/doxygen /home/anplus/Documents/gnuradio-file/gr-sendfile/build/swig/sendfile_swig_doc_swig_docs/Doxyfile

swig/CMakeFiles/sendfile_swig_swig_2d0df.dir/sendfile_swig_swig_2d0df.cpp.o: swig/CMakeFiles/sendfile_swig_swig_2d0df.dir/flags.make
swig/CMakeFiles/sendfile_swig_swig_2d0df.dir/sendfile_swig_swig_2d0df.cpp.o: swig/sendfile_swig_swig_2d0df.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/anplus/Documents/gnuradio-file/gr-sendfile/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object swig/CMakeFiles/sendfile_swig_swig_2d0df.dir/sendfile_swig_swig_2d0df.cpp.o"
	cd /home/anplus/Documents/gnuradio-file/gr-sendfile/build/swig && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/sendfile_swig_swig_2d0df.dir/sendfile_swig_swig_2d0df.cpp.o -c /home/anplus/Documents/gnuradio-file/gr-sendfile/build/swig/sendfile_swig_swig_2d0df.cpp

swig/CMakeFiles/sendfile_swig_swig_2d0df.dir/sendfile_swig_swig_2d0df.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/sendfile_swig_swig_2d0df.dir/sendfile_swig_swig_2d0df.cpp.i"
	cd /home/anplus/Documents/gnuradio-file/gr-sendfile/build/swig && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/anplus/Documents/gnuradio-file/gr-sendfile/build/swig/sendfile_swig_swig_2d0df.cpp > CMakeFiles/sendfile_swig_swig_2d0df.dir/sendfile_swig_swig_2d0df.cpp.i

swig/CMakeFiles/sendfile_swig_swig_2d0df.dir/sendfile_swig_swig_2d0df.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/sendfile_swig_swig_2d0df.dir/sendfile_swig_swig_2d0df.cpp.s"
	cd /home/anplus/Documents/gnuradio-file/gr-sendfile/build/swig && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/anplus/Documents/gnuradio-file/gr-sendfile/build/swig/sendfile_swig_swig_2d0df.cpp -o CMakeFiles/sendfile_swig_swig_2d0df.dir/sendfile_swig_swig_2d0df.cpp.s

swig/CMakeFiles/sendfile_swig_swig_2d0df.dir/sendfile_swig_swig_2d0df.cpp.o.requires:

.PHONY : swig/CMakeFiles/sendfile_swig_swig_2d0df.dir/sendfile_swig_swig_2d0df.cpp.o.requires

swig/CMakeFiles/sendfile_swig_swig_2d0df.dir/sendfile_swig_swig_2d0df.cpp.o.provides: swig/CMakeFiles/sendfile_swig_swig_2d0df.dir/sendfile_swig_swig_2d0df.cpp.o.requires
	$(MAKE) -f swig/CMakeFiles/sendfile_swig_swig_2d0df.dir/build.make swig/CMakeFiles/sendfile_swig_swig_2d0df.dir/sendfile_swig_swig_2d0df.cpp.o.provides.build
.PHONY : swig/CMakeFiles/sendfile_swig_swig_2d0df.dir/sendfile_swig_swig_2d0df.cpp.o.provides

swig/CMakeFiles/sendfile_swig_swig_2d0df.dir/sendfile_swig_swig_2d0df.cpp.o.provides.build: swig/CMakeFiles/sendfile_swig_swig_2d0df.dir/sendfile_swig_swig_2d0df.cpp.o


# Object files for target sendfile_swig_swig_2d0df
sendfile_swig_swig_2d0df_OBJECTS = \
"CMakeFiles/sendfile_swig_swig_2d0df.dir/sendfile_swig_swig_2d0df.cpp.o"

# External object files for target sendfile_swig_swig_2d0df
sendfile_swig_swig_2d0df_EXTERNAL_OBJECTS =

swig/sendfile_swig_swig_2d0df: swig/CMakeFiles/sendfile_swig_swig_2d0df.dir/sendfile_swig_swig_2d0df.cpp.o
swig/sendfile_swig_swig_2d0df: swig/CMakeFiles/sendfile_swig_swig_2d0df.dir/build.make
swig/sendfile_swig_swig_2d0df: swig/CMakeFiles/sendfile_swig_swig_2d0df.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/anplus/Documents/gnuradio-file/gr-sendfile/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX executable sendfile_swig_swig_2d0df"
	cd /home/anplus/Documents/gnuradio-file/gr-sendfile/build/swig && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/sendfile_swig_swig_2d0df.dir/link.txt --verbose=$(VERBOSE)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Swig source"
	cd /home/anplus/Documents/gnuradio-file/gr-sendfile/build/swig && /usr/bin/cmake -E make_directory /home/anplus/Documents/gnuradio-file/gr-sendfile/build/swig
	cd /home/anplus/Documents/gnuradio-file/gr-sendfile/build/swig && /usr/bin/swig3.0 -python -fvirtual -modern -keyword -w511 -module sendfile_swig -I/home/anplus/Documents/gnuradio-file/gr-sendfile/build/swig -I/home/anplus/Documents/gnuradio-file/gr-sendfile/swig -I/usr/local/include/gnuradio/swig -I/usr/include/python2.7 -I/usr/include/python2.7 -outdir /home/anplus/Documents/gnuradio-file/gr-sendfile/build/swig -c++ -I/home/anplus/Documents/gnuradio-file/gr-sendfile/lib -I/home/anplus/Documents/gnuradio-file/gr-sendfile/include -I/home/anplus/Documents/gnuradio-file/gr-sendfile/build/lib -I/home/anplus/Documents/gnuradio-file/gr-sendfile/build/include -I/usr/include -I/usr/include -I/usr/local/include -I/home/anplus/Documents/gnuradio-file/gr-sendfile/build/swig -I/home/anplus/Documents/gnuradio-file/gr-sendfile/swig -I/usr/local/include/gnuradio/swig -I/usr/include/python2.7 -I/usr/include/python2.7 -o /home/anplus/Documents/gnuradio-file/gr-sendfile/build/swig/sendfile_swigPYTHON_wrap.cxx /home/anplus/Documents/gnuradio-file/gr-sendfile/swig/sendfile_swig.i

# Rule to build all files generated by this target.
swig/CMakeFiles/sendfile_swig_swig_2d0df.dir/build: swig/sendfile_swig_swig_2d0df

.PHONY : swig/CMakeFiles/sendfile_swig_swig_2d0df.dir/build

swig/CMakeFiles/sendfile_swig_swig_2d0df.dir/requires: swig/CMakeFiles/sendfile_swig_swig_2d0df.dir/sendfile_swig_swig_2d0df.cpp.o.requires

.PHONY : swig/CMakeFiles/sendfile_swig_swig_2d0df.dir/requires

swig/CMakeFiles/sendfile_swig_swig_2d0df.dir/clean:
	cd /home/anplus/Documents/gnuradio-file/gr-sendfile/build/swig && $(CMAKE_COMMAND) -P CMakeFiles/sendfile_swig_swig_2d0df.dir/cmake_clean.cmake
.PHONY : swig/CMakeFiles/sendfile_swig_swig_2d0df.dir/clean

swig/CMakeFiles/sendfile_swig_swig_2d0df.dir/depend: swig/sendfile_swig_swig_2d0df.cpp
swig/CMakeFiles/sendfile_swig_swig_2d0df.dir/depend: swig/sendfile_swig_doc.i
swig/CMakeFiles/sendfile_swig_swig_2d0df.dir/depend: swig/sendfile_swig.tag
swig/CMakeFiles/sendfile_swig_swig_2d0df.dir/depend: swig/sendfile_swig_doc_swig_docs/xml/index.xml
	cd /home/anplus/Documents/gnuradio-file/gr-sendfile/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/anplus/Documents/gnuradio-file/gr-sendfile /home/anplus/Documents/gnuradio-file/gr-sendfile/swig /home/anplus/Documents/gnuradio-file/gr-sendfile/build /home/anplus/Documents/gnuradio-file/gr-sendfile/build/swig /home/anplus/Documents/gnuradio-file/gr-sendfile/build/swig/CMakeFiles/sendfile_swig_swig_2d0df.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : swig/CMakeFiles/sendfile_swig_swig_2d0df.dir/depend

