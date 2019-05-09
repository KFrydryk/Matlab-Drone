close all

x = simout.data(:,1);
y = simout.data(:,2);
z = simout.data(:,3);
phi = simout.data(:,4);
th = simout.data(:,5);
psi = simout.data(:,6);
plot3(x, y, z);