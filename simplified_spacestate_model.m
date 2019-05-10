function [out] = simplified_spacestate_model(in)
%SIMPLIFIED_SPACESTATE_MODEL Summary of this function goes here
%   Detailed explanation goes here
%   simplification is made by substituting 
%   x=[phi theta psi p q r u v w x y z] with
%   x=[x y z psi theta phi x' y' z' p q r]
%   what stands true for small angles of movement

global I m g
Ix = I(1,1);
Iy = I(2,2);
Iz = I(3,3);

rot = in(4:7);
pos_p = in(7:9);
wb = in(10:12);

phi = rot(1);
th = rot(2);
psi = rot(3);
p = wb(1);
q = wb(2);
r = wb(3);

torques = in(13:16);
ft = torques(1);
Tx = torques(2);
Ty = torques(3);
Tz = torques(4);

x_p = pos_p(1);
y_p = pos_p(2);
z_p = pos_p(3);
f_psi_p = q*(sin(phi)/cos(th))+r*(cos(phi)/cos(th));
f_th_p = q*(cos(phi))-r*(sin(phi));
f_phi_p = p + q*(sin(phi)*tan(th))+r*(cos(phi)*(tan(th)));
f_x_pp = 0;
f_y_pp = 0;
f_z_pp = g;
f_p_p = ((Iy-Iz)/Ix)*q*r;
f_q_p = ((Iz-Ix)/Iy)*p*r;
f_r_p = ((Ix-Iy)/Iz)*p*q;
g_x_pp = -(1/m)*(sin(phi)*sin(psi) + cos(phi)*cos(psi)*sin(th))*ft;
g_y_pp = -(1/m)*(cos(psi)*sin(phi) - cos(phi)*sin(psi)*sin(th))*ft;
g_z_pp = -(1/m)*(cos(phi)*cos(th))*ft;
g_p_p = (1/Ix)*Tx;
g_q_p = (1/Iy)*Ty;
g_r_p = (1/Iz)*Tz;

psi_p = f_psi_p;
th_p = f_th_p;
phi_p = f_phi_p;
x_pp = f_x_pp + g_x_pp;
y_pp = f_y_pp + g_y_pp;
z_pp = f_z_pp + g_z_pp;
p_p = f_p_p + g_p_p;
q_p = f_q_p + g_q_p;
r_p = f_r_p + g_r_p;

out = [x_p y_p z_p phi_p th_p psi_p x_pp y_pp z_pp p_p q_p r_p];

end

