%% 802.11 OFDM Beacon Frame Generation
% This example shows how to generate packets containing MAC beacon frames
% suitable for baseband simulation or over-the-air transmission using an
% SDR platform. 

% Copyright 2016-2017 The MathWorks, Inc.

%% Introduction
% This example creates an IEEE(R) 802.11(TM) beacon frame as described in
% section 8.3.3.2 of [ <#13 1> ]. A WiFi device can be used to view the
% beacon packet transmitted using SDR hardware as shown in the figure
% below.

%%
% <<BeaconFrameGenerationRx.png>>
%
% The beacon frame is a type of management frame, it identifies a basic
% service set (BSS) formed by a number of 802.11 devices. The access point
% of a BSS periodically transmits the beacon frame to establish and
% maintain the network.  The beacon frame consists of a MAC header, a
% beacon frame body and a valid frame check sequence (FCS). The beacon
% frame body contains the information fields which allows stations to
% associate with the network as shown in the figure below. A WLAN beacon
% packet is created using the 
% <matlab:doc('wlanWaveformGenerator') wlanWaveformGenerator> function.
% This function consumes MAC information bits and processes them to form a
% baseband beacon packet. In this example the generated waveform can be:
%
% * Stored in a baseband file format. The file format can be used with the
% example <NonHTBeaconReceiverExample.html 802.11 OFDM Beacon Receiver with
% Live Data>, which performs beacon packet decoding and describes the
% receiver processing.
% * Transmitted over-the-air. The beacon packet is upconverted for RF
% transmission using Xilinx(R) Zynq-Based Radio SDR hardware. The radio
% hardware allows a waveform to be transmitted over-the-air.

%%
% <<BeaconFrameGeneration.png>>
%
% To transmit the beacon over-the-air, the Xilinx Zynq-based radio support
% package is required. This can be installed using the
% <matlab:supportPackageInstaller Add-On Explorer>. More information about
% SDR platforms can be found
% <https://www.mathworks.com/hardware-support.html?fq=product:CM here>.

%% Example Setup
% The beacon packet can be written to a baseband file and transmitted using
% an SDR platform. To transmit the beacon using the SDR platform set
% |useSDR| to true. To write to a baseband file set |saveToFile| to true.
useSDR = false;
saveToFile = true;

%% Create IEEE 802.11 Beacon Frame
% The beacon packets are periodically transmitted as specified by the
% Target Beacon Transmission Time (TBTT) in the beacon interval field. The
% beacon interval represents the number of Time Units (TUs) between TBTT,
% where 1 TU represents 1024 microseconds. A beacon interval of 100 TU
% results in a 102.4 milliseconds time interval between successive beacons.
% The MAC frame bits for the beacon frames are generated using the helper
% function |helperGenerateBeaconFrame|.

SSID = 'RFID_test'; % Network SSID
beaconInterval = 100; % In Time units (TU)
band = 2.4;             % Band, 5 or 2.4 GHz
chNum = 14;           % Channel number, corresponds to 5260MHz

% Generate Beacon frame
[mpduBits,fc] = helperGenerateBeaconFrame(chNum, band, beaconInterval, SSID);

%% Create IEEE 802.11 Beacon Packet
% A beacon packet is synthesized using <matlab:doc('wlanWaveformGenerator')
% wlanWaveformGenerator> with a non-HT format configuration object. In this
% example an object is configured to generate a beacon packet of 20 MHz
% bandwidth, 1 transmit antenna and BPSK rate 1/2 (MCS 1).

cfgNonHT = wlanNonHTConfig;              % Create a wlanNonHTConfig object
cfgNonHT.PSDULength = numel(mpduBits)/8; % Set the PSDU length in bits

% The idle time is the length in seconds of an idle period after each
% generated packet. The idle time is set to the beacon interval.
txWaveform = wlanWaveformGenerator(mpduBits, cfgNonHT, 'IdleTime', beaconInterval*1024e-6);
Rs = wlanSampleRate(cfgNonHT);           % Get the input sampling rate

%% Save Waveform to File
% This section saves the waveform in a baseband file using 
% <matlab:doc('comm.BasebandFileWriter') BasebandFileWriter>.

if saveToFile
    % The waveform is stored in a baseband file
    BBW = comm.BasebandFileWriter('nonHTBeaconPacket.bb', Rs, fc); %#ok<UNRCH>
    BBW(txWaveform);
    release(BBW);
end
%%
% For information about automatically detecting and synchronizing the
% waveform stored in the baseband file format see
% <NonHTBeaconReceiverExample.html 802.11 OFDM Beacon Receiver with Live
% Data>.

%% Transmission with an SDR Device
% This section demonstrates the transmission of the beacon packet using an
% SDR device. The modulated signal is sent over-the-air using an SDR
% platform. By default, the example is configured to run with ZedBoard(TM)
% and ADI FMCOMMS2/3/4 hardware. You can replace the named hardware
% |'ZedBoard and FMCOMMS2/3/4'| with |'ZC706 and FMCOMMS2/3/4'| or
% |'PicoZed SDR'| in the SDR transmit object, |tx|, to run with ZC706 and
% ADI FMCOMMS2, FMCOMMS3, FMCOMMS4 hardware or PicoZed(TM) SDR.

if useSDR
    tx = sdrtx('ZedBoard and FMCOMMS2/3/4'); %#ok<UNRCH>
    tx.ShowAdvancedProperties = true;
    tx.BypassUserLogic = true;
    osf = 2; % OverSampling factor
    tx.BasebandSampleRate = Rs*osf;
    % The center frequency is set to the corresponding channel number
    tx.CenterFrequency = fc;
end

%%
% The transmitter gain |tx.Gain| parameter drives the power amplifier in 
% |'ZedBoard and FMCOMMS2/3/4'| radio. This parameter is used to impair the
% quality of the waveform, you can change this parameter to reduce
% transmission quality, and impair the signal. These are suggested values,
% depending on your antenna configuration, you may have to tweak these
% values. The suggested values are:
%
% # Set to 0 for increased gain (0dB)
% # Set to -10 for default gain (-10dB)
% # Set to -20 for reduced gain (-20dB)
%
% The |transmitRepeat| function transfers the baseband waveform to the SDR
% platform, and stores the signal samples in hardware memory. The example
% then repeatedly transmits this waveform over-the-air until the release
% method of the transmit object is called. Messages are displayed in the
% command window to confirm that transmission has started successfully.
 
if useSDR
    % Set transmit gain
    tx.Gain = 0;  %#ok<UNRCH>
    % Resample transmit waveform
    txWaveform = resample(txWaveform, osf, 1);
    % Transmit over-the-air
    transmitRepeat(tx, txWaveform);
end

%% Conclusion and Further Exploration
% This example has demonstrated how to generate a beacon packet for the
% IEEE 802.11 standard. A WiFi device can be used to view the beacon packet
% transmitted using SDR hardware. Alternatively, the stored baseband beacon
% packet can be processed to recover the transmitted information using the
% example <NonHTBeaconReceiverExample.html 802.11 OFDM Beacon Receiver with
% Live Data>.

%% Appendix
% This example uses the following helper functions:
%
% * <matlab:edit('helperGenerateBeaconFrame.m') helperGenerateBeaconFrame.m>
% * <matlab:edit('helperWLANChannelFrequency.m') helperWLANChannelFrequency.m>

%% Selected Bibliography
% # IEEE Std 802.11ac(TM)-2013 IEEE Standard for Information technology -
% Telecommunications and information exchange between systems - Local and
% metropolitan area networks - Specific requirements - Part 11: Wireless
% LAN Medium Access Control (MAC) and Physical Layer (PHY) Specifications -
% Amendment 4: Enhancements for Very High Throughput for Operation in Bands
% below 6 GHz.

displayEndOfDemoMessage(mfilename)