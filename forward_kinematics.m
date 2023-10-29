%%%%%%%%%%  3R Robotics Arm Forward Knimatics  %%%%%%%%%

clc;clear % this clears the screen and the workspace in Matlab enviroment.

% Take L1=2 and L2=5 for this example: 
L1=2, L2=5

% Write the DH parameters in this order: theta, d, a, alpha.
DH=[0 0 0 0; 0 0 L1 0; 0 0 L2 0]

% Creating the robot links: 
L(1)=Link(DH(1,1:4),'modified')
L(2)=Link(DH(2,1:4),'modified')
L(3)=Link(DH(3,1:4),'modified')

% Creating the robot object:
My3R=SerialLink(L,'name','This is my first 3R Arm')

% Initial joint angles:
qi=[pi/3 pi/4 pi/5]
% Desired joint angles:
qd=[2*pi/3 2*pi/4 2*pi/5]

% To find the inital Cartesian pose using forward Kinematics:
Ti=fkine(My3R,qi)
% To find the desired Cartesian pose using forward Kinematics:
Td=fkine(My3R,qd)

% To plot each one of these position, use the command:
plot(My3R,qi), view(2) % set plot view to 2D
plot(My3R,qd), view(2) % set plot view to 2D

clc;clear % this clears the screen and the workspace in Matlab enviroment.

%%%%%%%%%%  RPR Robotic Arm Forward Kinematics  %%%%%%%%%%

% Take L2=5 for the example: 
L2=5

% Write the Dh parameters in this order: theta, d, a, alpha
DH=[0 0 0 0;0 0 0 pi/2;0 L2 0 0]

% Creating the robot links (another method of creating the links)
L(1)=Link('revolute','d',DH(1,2),'a',DH(1,3),'alpha',DH(1,4),'modified')
L(2)=Link('prismatic','theta',DH(2,1),'a',DH(2,3),'alpha',DH(2,4),'modified')
L(3)=Link('revolute','d',DH(3,2),'a',DH(3,3),'alpha',DH(3,4),'modified')

% Creating the robot object:
MyRPR=SerialLink(L,'name','This is my first RPR Arm')

% Initial joint values:
qi=[pi/4 7 pi/2]

% Desired joint values:
qd=[pi/8 2 pi/4]

% To find the inital Cartesian pose using forward Kinematics:
Ti=fkine(MyRPR,qi)
% To find the desired Cartesian pose using forward Kinematics:
Td=fkine(MyRPR,qd)


% To plot each one of these position, use the command:
% Note, when robot include a prismatic joint, "workspace" option must be
% specified.
MyRPR.plot(qi,'workspace',[-10,10,-10,10,-10,10])
MyRPR.plot(qd,'workspace',[-10,10,-10,10,-10,10])

clc;clear % this clears the screen and the workspace in Matlab enviroment.

%%%%%%%%%%  PUMA 560 Robotic Arm Forward Kinematics  %%%%%%%%%%

% Load the robot model "puma560akb": This creates four items:
mdl_puma560akb

% The four items created with this robotc model are:
p560m % The robot object
qz % Joint angles at zero position
qr % Joint angles at ready position
qstretch % Joint angles at stretched position

% Initial joint angles: 
qi=[pi pi/2 pi/3 pi/4 pi/5 pi/6]
% Desired joint angles: 
qd=[pi/8 pi/7 pi/6 pi/5 pi/4 pi/3]

% To find the inital Cartesian pose using forward Kinematics: 
Ti=fkine(p560m,qi)
% To find the desired Cartesian pose using forward Kinematics:
Td=fkine(p560m,qd)

% To plot each one of those position, use the command:
plot(p560m,qi), view(50,40) % set the Azimuth and Elevation of plot view
plot(p560m,qd), view(50,40) % set the Azimuth and Elevation of plot view
