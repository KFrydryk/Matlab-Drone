function [out] = linear_model(in)
%LINEAR_MODEL Summary of this function goes here
%   Detailed explanation goes here
%   Using small oscillations method we can substitute
%   cos = 1 and sin(a) = a

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



phi_p = p + r*th + q*phi*th;
th_p = q-r*phi;
psi_p = r+q*phi;

p_p = ((Iy-Iz)/Ix)*r*q+((Tx+Twx)/Ix);
q_p = ((Iz-Ix)/Iy)*p*r+((Ty+Twy)/Iy);
r_p = ((Ix-Iy)/Iz)*p*q+((Tz-Twz)/Iz);

u_p = r*v-q*w-g*th+fwx/m;
v_p = p*w-r*u+g*phi+fwy/m;
w_p = q*u - p*v + g + (fwz-ft)/m;

x_p = w*(phi*psi+th)-v*(psi-phi*th)+u;
y_p = v*(1+phi*psi*th)-w*(phi-psi*th)+u*psi;
z_p = w-u*th+v*phi;

out = [ x_p y_p z_p phi_p th_p psi_p u_p v_p w_p p_p q_p r_p];
end
