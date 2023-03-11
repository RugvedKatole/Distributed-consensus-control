clear all;
close all;
clc
NPoints=input("no. of Agents ");
%% Setting up our plot window
xlim([-5,5]);
ylim([-5,5]);
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
[t,y]=Dynamics('unicycle',NPoints,X,Y);
% animating ploting of x1 y1
vidObj = VideoWriter('MAS_unicycle1.1.avi');
open(vidObj);
h_fig = figure;
axis([-5 5 -5 5])
axis  manual
set(gca,'nextplot','replacechildren');
hold on
grid on
title "State animation"
for i=0:NPoints-1
    X1(:,i+1)=y(:,2*i+1);
    Y1(:,i+1)=y(:,2*(i+1));
end
X=[y(:,1),y(:,3),y(:,5),y(:,7)];
Y=[y(:,2),y(:,4),y(:,6),y(:,8)];
for j=2:length(y)
%     tmp_h = plot(X1(j,:),Y1(j,:),'or','MarkerSize',4,'MarkerFaceColor','r');
    tmp_h=plotdir(j,y,NPoints);
    currFrame = getframe(h_fig);
    writeVideo(vidObj,currFrame);
    pause(.05)
        delete(tmp_h)
end
hold off
close(vidObj);
%% ploting x1 y1 first n states
figure(2)
grid on
title("Position states")
for i=1:2:2*NPoints
    plot(y(:,i),y(:,i+1),'-')
    hold on
end
%% ploting t,v  first 1:n:2n states
figure(3)
grid on
title("time vs Position")
for i=1:2*NPoints
    plot(t,y(:,i),'-');
    hold on
end
hold off
figure(4)
grid on
title("time vs theta")
for i=3*NPoints+1:4*NPoints
    plot(t,y(:,i),'-');
    hold on
end
hold off