clc;clear;close all;
%% beacon generate
SSID = 'TiFi_000005'; % Network SSID
beaconInterval = 10; % In Time units (TU)
band = 2.4;             % Band, 5 or 2.4 GHz
chNum = 1;           % Channel number, corresponds to 5260MHz
% Generate Beacon frame
[mpduBits,fc] = helperGenerateBeaconFrame(chNum, band, beaconInterval, SSID);

%% Create IEEE 802.11 Beacon Packet
% A beacon packet is synthesized using <matlab:doc('wlanWaveformGenerator')
% wlanWaveformGenerator> with a non-HT format configuration object. In this
% example an object is configured to generate a beacon packet of 20 MHz
% bandwidth, 1 transmit antenna and BPSK rate 1/2 (MCS 1).

% Create a wlanNonHTConfig object
cfgNonHT = wlanNonHTConfig;   
cfgNonHT.Modulation = 'DSSS';
cfgNonHT.DataRate = '1Mbps';
cfgNonHT.Preamble = 'Long';
cfgNonHT.PSDULength = numel(mpduBits)/8; % Set the PSDU length in bits

% The idle time is the length in seconds of an idle period after each
% generated packet. The idle time is set to the beacon interval.
txWaveform = wlanWaveformGenerator(mpduBits, cfgNonHT, 'IdleTime', beaconInterval*1024e-6);
% txWaveform = resample(txWaveform,125,110);
txWaveform = resample(txWaveform,125,110,0);
Rs = wlanSampleRate(cfgNonHT); 
wifispec(txWaveform(1:1e4),12.5e6,2412e6);
%%
figure;
subplot(3,1,1);
plot(real(txWaveform),imag(txWaveform),'o');
axis([-1 1 -1 1]);
subplot(3,1,2);
plot(phase(txWaveform));
subplot(3,1,3);
plot(abs(txWaveform));
%% send file
data = [real(txWaveform)';imag(txWaveform)'];
f = fopen('send_TiFi_000008.dat','w');
fwrite(f,data,'float');