clear all;
clc 
NPoints=input("no. of Agents ");
%% Setting up our plot window
xlim([-2,2]);
ylim([-2,2]);
hold on;
line([0,0],[-10,10]);
line([-10,10],[0,0]);
grid on
%% getting our initial states by graphical input
for index=1:NPoints
[X(index),Y(index)]=ginput(1);
plot(X,Y,'o','MarkerFaceColor','red');
end
%% getting dynamics solved by ODE45
[t,y]=Dynamics('non_linear',NPoints,X,Y);
%% ploting x1,y1 from y
for i=1:2:2*NPoints
    plot(y(:,i),y(:,i+1),'-')
    hold on
end
hold off
figure(2)
for i=2*NPoints+1:4*NPoints
    plot(t,y(:,i),'-');
    hold on
end
hold off