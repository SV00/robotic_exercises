%%%%%%%%%%  3R Robotic Arm Inverse Kinematics  %%%%%%%%%%

clc;clear % This crears the screen and workspace in Matlab Kinematics enviroment.

% Take L1=2 and L2=5 for this example:
L1=2, L2=5

% Write the DH parameters in this order: theta, d, a, alpha
DH=[0 0 0 0;0 0 L1 0;0 0 L2 0]

% Creating the robot links:
L(1)=Link(DH(1,1:4),'modified')
L(2)=Link(DH(2,1:4),'modified')
L(3)=Link(DH(3,1:4),'modified')

% Creating the robot object: 
My3R=SerialLink(L,'name','This is my forst 3R Arm')

% Initial Cartesian pose: 
Ti=[0.6293 -0.7771 0 -3.83;0.7771 0.6293 0 0.438;0 0 1 0;0 0 0 1]
% Desired Cartesian pose:
Td=[0.7934 -0.6088 0 1.195;0.6088 0.7434 0 4.192;0 0 1 0;0 0 0 1]

% A mask vector specifying the active Cartesian gripper coordinates:
% # of joints == # of actove coordinates. 0==inactive, 1==active
% The order in the mask vector is: M=[X Y Z Rx Ry Rz]
M=[1 1 0 0 0 1] % This Mask vector activates X, Y, Rz

% To find the initial joint angles using inverse kinematics: 
qi=ikine(My3R,Ti,'mask',M)
% To find the desired joint angles using inverse kinematics:
qd=ikine(My3R,Td,'mask',M)

% To plot each one of these position, use the command: 
plot(My3R,qi), view(2) % set plot view to 2D
plot(My3R,qd), view(2) % set plot view to 2D

clc;clear % This crears the screen and workspace in Matlab Kinematics enviroment.

% Load the robot model "puma560akb"
mdl_puma560akb

% The four items created with this robots model are: 
% The robot object:
p560m
% Joint angles at zero position:
qz
% Joint angles at ready position:
qr
% Joint angles at the stretched position:
qstretch

% Inital Cartesian pose:
Ti=[-0.8040 -0.5211 0.2865 0.235;0.1027 0.3528 0.9300 0.7072;-0.5857 0.7771 -0.2302 -0.2175;0 0 0 1]
% Desired Cartesian pose:
Td=[0.8554 0.3673 -0.3653 0.5952;0.4938 -0.3653 0.7791 0.517;0.1564 -0.8554 -0.4938 -0.1660;0 0 0 1]

% A mask vector specifying the active Cartesian gripper coordinates:
% # of joints == # of actove coordinates. 0==inactive, 1==active
% The order in the mask vector is: M=[X Y Z Rx Ry Rz]
M=[1 1 1 1 1 1] % This Mask vector activates all siz Cartesian variables.

% To find the initial joint angles using inverse kinematics: 
qi=ikine(p560m,Ti,'mask',M)
% To find the desired joint angles using inverse kinematics:
qd=ikine(p560m,Td,'mask',M)

% To plot each one of these position, use the command: 
plot(p560m,qi), view(80,60) % set the Azimuth and Elevation of plot view
plot(p560m,qd), view(80,60) % set the Azimuth and Elevation of plot view
