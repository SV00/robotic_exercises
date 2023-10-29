%%%%%%%%%%%%%%%%%%% Introduction to Matlab %%%%%%%%%%%%%%%%%%%%%%

clear % Clears all the variables without clearing the screen
clc % Clears the screen without clearing the variables

% Assign a name to a scalar
n=7

% Scalar operations: 
L=5*cos(pi)/2*n-5-n

% Assign a name to a matrix: 
A=[1 2 3; 4 5 6; 7 8 9]

% Assign a name to a vector:
B=[5;6;7]

% Matrix dot product: 
C=A*B

% matrix cross product: 
D=cross(B, C)

% Transpose of a matrix: 
E=transpose(A)
%or
E=A'

% Determinant of a matrix:
F=det(A)

% Inverse of a matrix: 
G=inv(A)

% Define symbolic characters: 
syms a b c d e f g h i j k l real

% Define a matrix that carries symbolic parameters:
H=[a b c; d e f; g h i]

% Make the answer look preattier without simplification: 
pretty(A*H)

% Simplify the answer: 
simplify(A*H)

% Loop statements: 
for i=1:1:12
    x(i)=i*2+1
end

% Conditional statements: 
if x(3)==7
    x(3)=7+1
elseif x(3)<=8
    x(3)=8+1
else
    x(3)=0
end

% Creating a function: create -m file and name it as the function's name.
% Inside thta file, type: function [x,y,z]=ML1_mult(x,y), z=2*x+3*y; end

% Recalling the created function
[L,M,N]=ML1_mult(21, 30)

% Plotting and simulation comands: 
q1=[0; 1; 2; 3; 4; 5]
q2=[10; 11; 12; 13; 14; 15]
q3=[20; 21; 22; 23; 24; 25]
time=[0; 0.1; 0.2; 0.3; 0.4; 0.5]

% Assigning figure number: 
figure(9)

% PLotting several lines: 
MyPlot=plot(time,q1,'-r',time,q2,':.g',time,q3,'--+b','LineWidth',3)

% Turn the plot grid on:
grid on

% Assign a title to the plot: 
title('My Graph')

% Assign x-axis label: 
xlabel('time, (sec)')

% Assign y-axis label:
ylabel('Variable 1, (unit)')

% Include a lengend
legend('theta_1', 'theta_2', 'theta_3', 'Location', 'northeastoutside')

% Assign fixed range for plot axes
axis([-1 1 0 30])

% Plot other lines on the same plot: 
My1=plot(time, q1)
hold on
my2=plot(time, q2)
hold off

% Plot in 3D
myA=plot3(time,q1,q2,'-r',time,q1,q3,':.g','LineWidth',3)

% Change view angle of the plot
view(2) % 2D view
view(3) % 3D view
view(40,15) % Specify the azimuth and elevation of the view point
view([10,15,20]) % Specify the view angle in Cartedian coordinates

% Change curve values in the plot (for simulation):
set(myA(1),'XData',2*time,'YData',q1,'ZData',q3)

% Pause the program: 
pause(2.0)

% Redraw a plot
drawnow

% Closing plot window 
close(figure(1)), close([figure(2),figure(3)])
% or: 
close all
