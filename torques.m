function [out] = torques(W)
%TORQUES Summary of this function goes here
%   Detailed explanation goes here
%assumption: values are proportional to squared speeds of rotors
global b l d

ft = b*(W'*W);
Tx = b*l*(W(3)^2 - W(1)^2);
Ty = b*l*(W(4)^2 - W(2)^2);
Tz = d*(W(2)^2+W(4)^2-W(1)^2-W(3)^2);
out = [ft Tx Ty Tz]
end

