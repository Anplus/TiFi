#!/usr/bin/env python2
# -*- coding: utf-8 -*-
##################################################
# GNU Radio Python Flow Graph
# Title: Tifi
# Author: Zhenlin An
# Generated: Tue Sep  4 14:35:53 2018
##################################################

from gnuradio import analog
from gnuradio import blocks
from gnuradio import eng_notation
from gnuradio import filter
from gnuradio import gr
from gnuradio import uhd
from gnuradio.eng_option import eng_option
from gnuradio.filter import firdes
from optparse import OptionParser
import rfid
import time


class tifi(gr.top_block):

    def __init__(self):
        gr.top_block.__init__(self, "Tifi")

        ##################################################
        # Variables
        ##################################################
        self.wifi_samp_rate_sender = wifi_samp_rate_sender = 25e6
        self.rfid_samp_rate_sender = rfid_samp_rate_sender = int(1e6)
        self.rfid_samp_rate_reciever = rfid_samp_rate_reciever = int(2e6)

        ##################################################
        # Blocks
        ##################################################
        self.uhd_usrp_source_rfid = uhd.usrp_source(
        	",".join(("192.168.20.10", "")),
        	uhd.stream_args(
        		cpu_format="fc32",
        		channels=range(1),
        	),
        )
        self.uhd_usrp_source_rfid.set_samp_rate(rfid_samp_rate_reciever)
        self.uhd_usrp_source_rfid.set_center_freq(920e6, 0)
        self.uhd_usrp_source_rfid.set_gain(0, 0)
        self.uhd_usrp_source_rfid.set_antenna('RX2', 0)
        self.uhd_usrp_sink_rfid = uhd.usrp_sink(
        	",".join(("192.168.20.10", "")),
        	uhd.stream_args(
        		cpu_format="fc32",
        		channels=range(1),
        	),
        )
        self.uhd_usrp_sink_rfid.set_samp_rate(rfid_samp_rate_sender)
        self.uhd_usrp_sink_rfid.set_center_freq(920e6, 0)
        self.uhd_usrp_sink_rfid.set_gain(0, 0)
        self.uhd_usrp_sink_rfid.set_antenna('TX/RX', 0)
        self.rfid_tag_decoder_0 = rfid.tag_decoder()
        self.rfid_reader_0 = rfid.reader()
        self.rfid_global_vars_0 = rfid.global_vars()
        self.rfid_gate_0 = rfid.gate()
        self.interp_fir_filter_xxx_0 = filter.interp_fir_filter_ccc(5, (25, ))
        self.interp_fir_filter_xxx_0.declare_sample_delay(0)
        self.blocks_multiply_xx_0 = blocks.multiply_vcc(1)
        self.analog_const_source_x_0 = analog.sig_source_c(0, analog.GR_CONST_WAVE, 0, 0, 0.1)

        ##################################################
        # Connections
        ##################################################
        self.connect((self.analog_const_source_x_0, 0), (self.blocks_multiply_xx_0, 1))
        self.connect((self.blocks_multiply_xx_0, 0), (self.uhd_usrp_sink_rfid, 0))
        self.connect((self.interp_fir_filter_xxx_0, 0), (self.rfid_gate_0, 0))
        self.connect((self.rfid_gate_0, 0), (self.rfid_tag_decoder_0, 0))
        self.connect((self.rfid_reader_0, 0), (self.blocks_multiply_xx_0, 0))
        self.connect((self.rfid_tag_decoder_0, 0), (self.rfid_reader_0, 0))
        self.connect((self.uhd_usrp_source_rfid, 0), (self.interp_fir_filter_xxx_0, 0))

    def get_wifi_samp_rate_sender(self):
        return self.wifi_samp_rate_sender

    def set_wifi_samp_rate_sender(self, wifi_samp_rate_sender):
        self.wifi_samp_rate_sender = wifi_samp_rate_sender

    def get_rfid_samp_rate_sender(self):
        return self.rfid_samp_rate_sender

    def set_rfid_samp_rate_sender(self, rfid_samp_rate_sender):
        self.rfid_samp_rate_sender = rfid_samp_rate_sender
        self.uhd_usrp_sink_rfid.set_samp_rate(self.rfid_samp_rate_sender)

    def get_rfid_samp_rate_reciever(self):
        return self.rfid_samp_rate_reciever

    def set_rfid_samp_rate_reciever(self, rfid_samp_rate_reciever):
        self.rfid_samp_rate_reciever = rfid_samp_rate_reciever
        self.uhd_usrp_source_rfid.set_samp_rate(self.rfid_samp_rate_reciever)


def main(top_block_cls=tifi, options=None):
    if gr.enable_realtime_scheduling() != gr.RT_OK:
        print "Error: failed to enable real-time scheduling."

    tb = top_block_cls()
    tb.start()
    try:
        raw_input('Press Enter to quit: ')
    except EOFError:
        pass
    tb.stop()
    tb.wait()


if __name__ == '__main__':
    main()
