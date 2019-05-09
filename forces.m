function [out] = forces(in)
%FORCES Summary of this function goes here
%   Detailed explanation goes here

global m I

vb = in(1:3);
wb = in(4:6);
vb_p = in(7:9);
wb_p = in(10:12);
u = vb(1);
v = vb(2);
w = vb(3);
p = wb(1);
q = wb(2);
r = wb(3);

u_p = vb_p(1);
v_p = vb_p(2);
w_p = vb_p(3);
p_p = wb_p(1);
q_p = wb_p(2);
r_p = wb_p(3);

Ix = I(1,1);
Iy = I(2,2);
Iz = I(3,3);

fx = m*(u_p+q*w-r*v);
fy = m*(v_p-p*w+r*u);
fz = m*(w_p+p*v-q*u);
mx = p_p*Ix-q*r*Iy+q*r*Iz;
my = q_p*Iy+p*r*Ix-p*r*Iz;
mz = r_p*Iz-p*q*Ix+p*q*Iy;
out = [fx fy fz mx my mz];
end

