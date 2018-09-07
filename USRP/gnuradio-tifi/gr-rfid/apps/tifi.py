#!/usr/bin/env python2
# -*- coding: utf-8 -*-
##################################################
# GNU Radio Python Flow Graph
# Title: Tifi
# Author: Zhenlin AN
# Generated: Fri Sep  7 11:12:03 2018
##################################################

if __name__ == '__main__':
    import ctypes
    import sys
    if sys.platform.startswith('linux'):
        try:
            x11 = ctypes.cdll.LoadLibrary('libX11.so')
            x11.XInitThreads()
        except:
            print "Warning: failed to XInitThreads()"

from PyQt4 import Qt
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
import sendfile
import sys
import time
from gnuradio import qtgui


class tifi(gr.top_block, Qt.QWidget):

    def __init__(self):
        gr.top_block.__init__(self, "Tifi")
        Qt.QWidget.__init__(self)
        self.setWindowTitle("Tifi")
        qtgui.util.check_set_qss()
        try:
            self.setWindowIcon(Qt.QIcon.fromTheme('gnuradio-grc'))
        except:
            pass
        self.top_scroll_layout = Qt.QVBoxLayout()
        self.setLayout(self.top_scroll_layout)
        self.top_scroll = Qt.QScrollArea()
        self.top_scroll.setFrameStyle(Qt.QFrame.NoFrame)
        self.top_scroll_layout.addWidget(self.top_scroll)
        self.top_scroll.setWidgetResizable(True)
        self.top_widget = Qt.QWidget()
        self.top_scroll.setWidget(self.top_widget)
        self.top_layout = Qt.QVBoxLayout(self.top_widget)
        self.top_grid_layout = Qt.QGridLayout()
        self.top_layout.addLayout(self.top_grid_layout)

        self.settings = Qt.QSettings("GNU Radio", "tifi")
        self.restoreGeometry(self.settings.value("geometry").toByteArray())

        ##################################################
        # Variables
        ##################################################
        self.samp_rate = samp_rate = int(2e6)
        self.dac_rate = dac_rate = int(1e6)

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
        self.uhd_usrp_source_rfid.set_samp_rate(samp_rate)
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
        self.uhd_usrp_sink_rfid.set_samp_rate(dac_rate)
        self.uhd_usrp_sink_rfid.set_center_freq(920e6, 0)
        self.uhd_usrp_sink_rfid.set_gain(0, 0)
        self.uhd_usrp_sink_rfid.set_antenna('TX/RX', 0)
        self.uhd_usrp_sink_0 = uhd.usrp_sink(
        	",".join(("192.168.20.5", "")),
        	uhd.stream_args(
        		cpu_format="fc32",
        		channels=range(1),
        	),
        )
        self.uhd_usrp_sink_0.set_samp_rate(samp_rate)
        self.uhd_usrp_sink_0.set_center_freq(804e6, 0)
        self.uhd_usrp_sink_0.set_gain(0, 0)
        self.sendfile_sendfile_wifi_0 = sendfile.sendfile_wifi(gr.sizeof_gr_complex)
        self.rfid_tag_decoder_0 = rfid.tag_decoder(samp_rate)
        self.rfid_reader_0 = Template error: rfid.reader($samp_rate,$dac_rate)
            cannot find 'samp_rate'
        self.rfid_gate_0 = rfid.gate(samp_rate)
        self.interp_fir_filter_xxx_0 = filter.interp_fir_filter_ccc(5, (25, ))
        self.interp_fir_filter_xxx_0.declare_sample_delay(0)
        self.blocks_multiply_xx_0 = blocks.multiply_vff(1)
        self.blocks_float_to_complex_0 = blocks.float_to_complex(1)
        self.analog_const_source_x_0_0 = analog.sig_source_f(0, analog.GR_CONST_WAVE, 0, 0, 0)
        self.analog_const_source_x_0 = analog.sig_source_f(0, analog.GR_CONST_WAVE, 0, 0, 0.1)

        ##################################################
        # Connections
        ##################################################
        self.connect((self.analog_const_source_x_0, 0), (self.blocks_multiply_xx_0, 1))
        self.connect((self.analog_const_source_x_0_0, 0), (self.blocks_float_to_complex_0, 1))
        self.connect((self.blocks_float_to_complex_0, 0), (self.uhd_usrp_sink_rfid, 0))
        self.connect((self.blocks_multiply_xx_0, 0), (self.blocks_float_to_complex_0, 0))
        self.connect((self.interp_fir_filter_xxx_0, 0), (self.rfid_gate_0, 0))
        self.connect((self.rfid_gate_0, 0), (self.rfid_tag_decoder_0, 0))
        self.connect((self.rfid_reader_0, 0), (self.blocks_multiply_xx_0, 0))
        self.connect((self.rfid_tag_decoder_0, 0), (self.rfid_reader_0, 0))
        self.connect((self.sendfile_sendfile_wifi_0, 0), (self.uhd_usrp_sink_0, 0))
        self.connect((self.uhd_usrp_source_rfid, 0), (self.interp_fir_filter_xxx_0, 0))

    def closeEvent(self, event):
        self.settings = Qt.QSettings("GNU Radio", "tifi")
        self.settings.setValue("geometry", self.saveGeometry())
        event.accept()

    def get_samp_rate(self):
        return self.samp_rate

    def set_samp_rate(self, samp_rate):
        self.samp_rate = samp_rate
        self.uhd_usrp_source_rfid.set_samp_rate(self.samp_rate)
        self.uhd_usrp_sink_0.set_samp_rate(self.samp_rate)

    def get_dac_rate(self):
        return self.dac_rate

    def set_dac_rate(self, dac_rate):
        self.dac_rate = dac_rate
        self.uhd_usrp_sink_rfid.set_samp_rate(self.dac_rate)


def main(top_block_cls=tifi, options=None):

    from distutils.version import StrictVersion
    if StrictVersion(Qt.qVersion()) >= StrictVersion("4.5.0"):
        style = gr.prefs().get_string('qtgui', 'style', 'raster')
        Qt.QApplication.setGraphicsSystem(style)
    qapp = Qt.QApplication(sys.argv)

    tb = top_block_cls()
    tb.start()
    tb.show()

    def quitting():
        tb.stop()
        tb.wait()
    qapp.connect(qapp, Qt.SIGNAL("aboutToQuit()"), quitting)
    qapp.exec_()


if __name__ == '__main__':
    main()
