function [out] = statespace_model(in)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%possible bug with 0*g in w calculations!!

global I m g
Ix = I(1,1);
Iy = I(2,2);
Iz = I(3,3);

rot = in(4:6);
vb = in(7:9);
wb = in(10:12);
torques = in(13:16);
windforces = in(17:19);
windtorques = in(20:22);


phi = rot(1);
th = rot(2);
psi = rot(3);
u = vb(1);
v = vb(2);
w = vb(3);
p = wb(1);
q = wb(2);
r = wb(3);
ft = torques(1);
Tx = torques(2);
Ty = torques(3);
Tz = torques(4);
fwx = windforces(1);
fwy = windforces(2);
fwz = windforces(3);
Twx = windtorques(1);
Twy = windtorques(2);
Twz = windtorques(3);


phi_p = p + r*(cos(phi)*tan(th)) + q*(sin(phi)*tan(th));
th_p = q*(cos(phi))-r*(sin(phi));
psi_p = r*(cos(phi)/cos(th))+q*(sin(phi)/cos(th));

p_p = ((Iy-Iz)/Ix)*r*q+((Tx+Twx)/Ix);
q_p = ((Iz-Ix)/Iy)*p*r+((Ty+Twy)/Iy);
r_p = ((Ix-Iy)/Iz)*p*q+((Tz-Twz)/Iz);

u_p = r*v-q*w-g*(sin(th))+fwx/m;
v_p = p*w-r*u+g*(sin(phi)*cos(th))+fwy/m;
w_p = q*u - p*v + 0*g*(cos(th)*cos(phi)) + (fwz-ft)/m;

x_p = w*(sin(phi)*sin(psi)+cos(phi)*cos(psi)*sin(th))-v*(cos(phi)*sin(psi)-cos(psi)*sin(phi)*sin(th))+u*(cos(psi)*cos(th));
y_p = v*(cos(phi)*cos(psi)+sin(phi)*sin(psi)*sin(th))-w*(cos(psi)*sin(phi)-cos(phi)*sin(psi)*sin(th))+u*(cos(phi)*sin(psi));
z_p = w*(cos(phi)*cos(th))-u*(sin(th))+v*(cos(th)*sin(phi));

out = [ x_p y_p z_p phi_p th_p psi_p u_p v_p w_p p_p q_p r_p];
end

