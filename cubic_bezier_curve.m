%#ok<*SAGROW> %#ok<*NBRAK2>
clear; clc;

% Define the control points for the curve
P0 = [0 2];                        
P1 = [1 7];                         
P2 = [0.6 0];
P3 = [2 6];

x_Coords = [P0(1), P1(1), P2(1), P3(1)];  
y_Coords = [P0(2), P1(2), P2(2), P3(2)];

t = 0:0.01:1;

Q1 = zeros(length(t),2);
Q2 = zeros(length(t),2);
Q3 = zeros(length(t),2);

R1 = zeros(length(t),2);
R2 = zeros(length(t),2);

for i = 1:length(t)     % P Q R S T U V ...
 
    Q1(i,1) = (1-t(i))*x_Coords(1)+t(i)*x_Coords(2); 
    Q1(i,2) = (1-t(i))*y_Coords(1)+t(i)*y_Coords(2); 

    Q2(i,1) = (1-t(i))*x_Coords(2)+t(i)*x_Coords(3); 
    Q2(i,2) = (1-t(i))*y_Coords(2)+t(i)*y_Coords(3); 

    Q3(i,1) = (1-t(i))*x_Coords(3)+t(i)*x_Coords(4); 
    Q3(i,2) = (1-t(i))*y_Coords(3)+t(i)*y_Coords(4); 

    R1(i,1) = (1-t(i))*Q1(i,1)+t(i)*Q2(i,1); 
    R1(i,2) = (1-t(i))*Q1(i,2)+t(i)*Q2(i,2);

    R2(i,1) = (1-t(i))*Q2(i,1)+t(i)*Q3(i,1); 
    R2(i,2) = (1-t(i))*Q2(i,2)+t(i)*Q3(i,2);


    S_x(i,1) = (1-t(i))*R1(i,1)+t(i)*R2(i,1);
    S_y(i,1) = (1-t(i))*R1(i,2)+t(i)*R2(i,2);
end
plot(x_Coords, y_Coords,S_x, S_y)



