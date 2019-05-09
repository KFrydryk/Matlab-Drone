function [out] = kinematics(in)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
rot = in(4:6);
vb = in(7:9);
wb = in(10:12);
phi = rot(1);
th = rot(2);
psi = rot(3);
u = vb(1);
v = vb(2);
w = vb(3);
p = wb(1);
q = wb(2);
r = wb(3);

x_p = w*(sin(phi)*sin(psi)+cos(phi)*cos(psi)*sin(th))-v*(cos(phi)*sin(psi)-cos(psi)*sin(phi)*sin(th))+u*(cos(psi)*cos(th));
y_p = v*(cos(phi)*cos(psi)+sin(phi)*sin(psi)*sin(th))-w*(cos(psi)*sin(phi)-cos(phi)*sin(psi)*sin(th))+u*(cos(phi)*sin(psi));
z_p = w*(cos(phi)*cos(th))-u*(sin(th))+v*(cos(th)*sin(phi));
phi_p = p + r*(cos(phi*tan(th))) + q*(sin(phi)*tan(th));
th_p = q*(cos(phi))-r*(sin(phi));
psi_p = r*(cos(phi)/cos(th))+q*(sin(phi)/cos(th));
out = [x_p y_p z_p phi_p th_p psi_p];
end

