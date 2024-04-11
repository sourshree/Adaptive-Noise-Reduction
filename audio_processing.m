clc
clear all
close all
[y,Fs]= audioread("noisy.mp3");

fc = 50
if fc > 20
    fp = fc+5;
    fs = fc/(Fs/2);
    fp = fp/(Fs/2);
    [n wn] = buttord(fp,fs,0.5,80);
    [b, a] = butter(5,wn,'High');
    channel_2 = filtfilt(b,a,y(:,2));
else
    channel_2 = y(:,2);
end

background = y(:,1) - channel_2;

audiowrite('noiseless.wav',background,Fs);
