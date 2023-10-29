%%%%%%%%%%  Rotations and Trasformations  %%%%%%%%%%%

clear % Clear all the variables without clearing the sceen
clc % Clears the screen without clearing the variables

% Setting up few angles, matrices and vrectors: 
R=[0.7 -0.4 0.6; 0.7 0.2 -0.7; 0.2 0.9 0.4] % 3x3 rotation matrix
T=[R [0;0;0] ; 0 0 0 1] % 4x4 transformation matrix
ang1=pi/2
ang2=pi/3
ang3=pi/4
xvec=[1;0;0]
yvec=[0;1;0]
zvec=[0;0;1]

% Robotics Toolbox Commands for conversions: 

Rx=rotx(ang2) % 3x3 rotation matrix about x-axis
Ry=roty(ang2) % 3x3 rotation matrix about y-axis
Rz=rotz(ang2) % 3x3 rotation matrix about z-axis
Tx=trotx(ang2) % 4x4 transformation matrix about x-axis
Ty=troty(ang2) % 4x4 transformation matrix about y-axis
Tz=trotz(ang2) % 4x4 transformation matrix about z-axis
Tt=transl(10,20,30) % 4x4 transformation matrix along x, y, z axes
Tn=r2t(R) % convert from 3x3 rotation matrix to 4x4 transformation matrix
Rn=t2r(T) % convert from 4x4 transformation matrix to 3x3 rotation matrix
Ra=angvec2r(ang2,xvec) % convert from single angle-vector to 3x3 rotation matrix
Ta=angvec2tr(ang2,xvec) % convert from single angle-vector to 4x4 transformation matrix
[A,V]=tr2angvec(Ta) % convert from single angle-vector to 4x4 transformation matrix
Re=eul2r(ang1,ang2,ang3) % convert from Euler angles to 3x3 rotation matrix
Te=eul2tr(ang1,ang2,ang3) % convert from Euler angles to 4x4 transformation matrix
E=tr2eul(T) % convert from 4x4 transformation matrix to Euler angles
