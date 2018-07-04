function [] = wifispec(signal, Fs, Fc)
%%
figure;
nfft=length(signal);
Y = fftshift(abs(fft(signal)/nfft));
F = 0:2*Fs/nfft:Fs*2-1;
F = F+Fc-mean(F);
plot(F/1e6,10*log10(Y)-50);
xlabel('Frequency (MHz)');
ylabel('Power Spectrum (dBm)');
axis tight;
grid on;
end