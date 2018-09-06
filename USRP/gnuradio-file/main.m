clc;clear;close all;
%%
to_usrp = [randn(1,10000)];
%%
figure;
plot(to_usrp);
axis([1 length(to_usrp) -0.1 1.1]);
write_file(to_usrp);