function [out] = linearised_model(in)
%LINEAR_MODEL Summary of this function goes here
%   Detailed explanation goes here
%   assuming equilibrium point 
%   xe = [0 0 0 0 0 0 0 0 0 xe ye ze] 
%   we can find equilibrium constant input
%   u=[mg 0 0 0]

%possible bug with 0*g in w calculations
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



A = [0 0 0 0 0 0 1 0 0 0 0 0;...
    0 0 0 0 0 0 0 1 0 0 0 0;...
    0 0 0 0 0 0 0 0 1 0 0 0;...
    0 0 0 0 0 0 0 0 0 1 0 0;...
    0 0 0 0 0 0 0 0 0 0 1 0;...
    0 0 0 0 0 0 0 0 0 0 0 1;...
    0 0 0 0 -g 0 0 0 0 0 0 0;...
    0 0 0 g 0 0 0 0 0 0 0 0;...
    0 0 0 0 0 0 0 0 0 0 0 0;...
    0 0 0 0 0 0 0 0 0 0 0 0;...
    0 0 0 0 0 0 0 0 0 0 0 0;...
    0 0 0 0 0 0 0 0 0 0 0 0];

B = [0 0 0 0;...
    0 0 0 0;...
    0 0 0 0;...
    0 1/Ix 0 0;...
    0 0 1/Iy 0;...
    0 0 0 1/Iz;...
    0 0 0 0;...
    0 0 0 0;...
    1/m 0 0 0;...
    0 0 0 0;...
    0 0 0 0;...
    0 0 0 0];

D = [0 0 0 0 0 0;...
    0 0 0 0 0 0;...
    0 0 0 0 0 0;...
    0 0 0 1/Ix 0 0;...
    0 0 0 0 1/Iy 0;...
    0 0 0 0 0 1/Iz;...
    1/m 0 0 0 0 0;...
    0 1/m 0 0 0 0;...
    0 0 1/m 0 0 0;...
    0 0 0 0 0 0;...
    0 0 0 0 0 0;...
    0 0 0 0 0 0];

phi_p = p;
th_p = q;
psi_p = r;
p_p = (Tx+Twx)/Ix;
q_p = (Ty+Twy)/Iy;
r_p = (Tz+Twz)/Iz;
u_p = -g*th + (fwx/m);
v_p = g*phi + (fwy/m);
w_p = 0*g+(fwz-ft)/m;
x_p = u;
y_p = v;
z_p = w;

out = [ x_p y_p z_p phi_p th_p psi_p u_p v_p w_p p_p q_p r_p];
end

