%% Clear

clc
clear all
close all

%% Setting

baud_rate = 115200;
com_port = "COM15";
buffer_size = 2000;

%% Serial Init

sObject = serialport(com_port, baud_rate);

%% Read

while 1
    raw_values = read(sObject, buffer_size, "uint8");
    
    final_values = raw_values(1:2:buffer_size) + raw_values(2:2:buffer_size) * 256;
    
    subplot(1, 2, 1)
    plot(final_values);
    grid on
    title("Time domain");
    ylabel("Voltage");
    xlabel("Time");
    ylim([0 4095]);

    subplot(1, 2, 2)
    plot(abs(fftshift(fft(final_values))), 'r');
    grid on
    title("Frequency domain");
    ylabel("Amp")
    xlabel("Freq");
    
    drawnow
end







