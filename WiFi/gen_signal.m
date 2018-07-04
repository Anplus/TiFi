%% Generate WLAN Waveforms
% Generate DMG, S1G, VHT, HT-mixed, and non-HT format waveforms. Vary
% configuration parameters and plot the waveforms to highlight differences
% in waveforms and sample rates.
%%
% In each section of this example, you:
%
% * Create a format-specific configuration object.
% * Create a vector of information bits for the packet data payload.
% Internally, the |wlanWaveformGeneration| function loops through the bits
% vector as many times as needed to generate the specified number of
% packets.
% * Generate the format-specific waveform and plot it. For plotting,
% because no filtering is applied to the waveform and the oversampling rate
% is 1, set the sampling rate equal to the channel bandwidth.


%%
% The plot shows five HT format packets, with 30 microseconds of idle time
% separating each packet.

%% Generate Non-HT Format DSSS Waveform
% Create a non-HT configuration object and generate a non-HT format DSSS
% waveform with a 2 Mbps data rate. Using |Name,Value| pairs, specify 2
% packets and 5 microseconds of idle time. Display the configuration object
% and inspect its properties and settings.
nht = wlanNonHTConfig('Modulation','DSSS','DataRate','2Mbps')
bits = int8(mpduBits);
nhtDSSSWaveform = wlanWaveformGenerator(bits,nht, ...
    'NumPackets',2,'IdleTime',5e-6);
%%
% Plot the non-HT Format DSSS waveform, scaling the _x-axis_ relative to
% the channel bandwidth. As specified in IEEE 802.11-2012, Section 17.1.1,
% the channel bandwidth is 11 MHz for DSSS.
fs = 11e6; % Set sampling frequency equal to the channel bandwidth
time = ([0:length(nhtDSSSWaveform)-1]/fs)*1e6;
plot(time,real(nhtDSSSWaveform),'.')
xlabel ('Time (microseconds)');
ylabel('Re[nhtDSSSWaveform]');
% axis([8190,8200,-1.1,1.1])
%%
% Sample values in DSSS modulation are &ndash;1 or 1. The plot shows the
% real values for a section of the waveform that includes the tail end of
% the first packet, the 5 microsecond idle period, and the beginning of the
% second packet for the non-HT format DSSS modulated waveform.