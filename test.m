clc
clear all
tcpipClient = tcpip('192.168.142.1',55001,'NetworkRole','Client');
set(tcpipClient,'Timeout',30);
fopen(tcpipClient);
% a=[50,40,30,40,50,60;7,79,9,10,111,45;0,0,0,0,0,0;46,23,124,65,16,0;0,0,0,0,0,0];
% b=intstr(a);
b="Hello World!";
fwrite(tcpipClient,b);
fclose(tcpipClient);