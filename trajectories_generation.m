%%%%%%%%%  Trajectories Generation  %%%%%%%%%%

clc;clear % This crears the screen and workspace in Matlab Kinematics enviroment.77

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

%%%%%%%%%%  If Joint Control is Used: 

% Inital joint angles: 
qi=[pi/3 pi/4 pi/5]
% Desired joint angles: 
qd=[2*pi/3 2*pi/4 2*pi/5]
% Generate joint trajectory with n=10 steps: 
qt=jtraj(qi, qd, 100)

% Plot the simulation to go from qi to qd:
% plot(My3R,qt)

%%%%%%%%%%%  If Cartesian Control is Used:

% Initial Cartesian pose:
Ti=[-0.7771 -0.6293 0 -0.2941;0.6293 -0.7771 0 6.562;0 0 1 0;0 0 0 1]
% Desired Cartesian pose: 
Td=[0.2079 0.9781 0 -5.33;-0.9781 0.2079 0 -0.7679;0 0 1 0;0 0 0 1]
% Generate Cartesian trajectory with n=10 steps:
Tt=ctraj(Ti, Td, 100)
% Find the corresponding joint trajectory using inverse Kinematics
qt=My3R.ikine(Tt,'mask',[1 1 0 0 0 1])

% Plot the simulation to go from Ti to Td:
plot(My3R, qt)
