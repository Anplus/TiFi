
/*
 * This file was automatically generated using swig_doc.py.
 *
 * Any changes to it will be lost next time it is regenerated.
 */




%feature("docstring") gr::rfid::gate "The block is responsible for identifying a reader's command.

The samples related to a reader's command are blocked and consumed. Samples that belong to a Tag's message (RN16-EPC) are forwarded to the next block for further processing."

%feature("docstring") gr::rfid::gate::make "Return a shared_ptr to a new instance of rfid::gate.

To avoid accidental use of raw pointers, rfid::gate's constructor is in a private implementation class. rfid::gate::make is the public interface for creating new instances.

Params: (sample_rate)"

%feature("docstring") gr::rfid::reader "The block is responsible for sending commands for transmission.

It moves between the following states."

%feature("docstring") gr::rfid::reader::print_results "

Params: (NONE)"

%feature("docstring") gr::rfid::reader::make "Return a shared_ptr to a new instance of rfid::reader.

To avoid accidental use of raw pointers, rfid::reader's constructor is in a private implementation class. rfid::reader::make is the public interface for creating new instances.

Params: (sample_rate, dac_rate)"

%feature("docstring") gr::rfid::tag_decoder "<+description of block+>"

%feature("docstring") gr::rfid::tag_decoder::make "Return a shared_ptr to a new instance of rfid::tag_decoder.

To avoid accidental use of raw pointers, rfid::tag_decoder's constructor is in a private implementation class. rfid::tag_decoder::make is the public interface for creating new instances.

Params: (sample_rate)"