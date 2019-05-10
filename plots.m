close all
figure('Name', 'model');
x = simout.data(:,1);
y = simout.data(:,2);
z = simout.data(:,3);
phi = simout.data(:,4);
th = simout.data(:,5);
psi = simout.data(:,6);
plot3(x, y, z);
hold on
x = simout1.data(:,1);
y = simout1.data(:,2);
z = simout1.data(:,3);
phi = simout1.data(:,4);
th = simout1.data(:,5);
psi = simout1.data(:,6);
plot3(x, y, z, '-r');
hold off