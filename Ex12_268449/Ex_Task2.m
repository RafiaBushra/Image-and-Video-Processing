%SGN-12007 Ex12T02 268449
clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
imtool close all;  % Close all imtool figures.
clear;  % Erase all existing variables.

optical_flow('echo1.avi', 0.005);
optical_flow_filt('echo1.avi', 0.005);
optical_flow('echo2.avi', 0.005);
optical_flow_filt('echo2.avi', 0.005);
