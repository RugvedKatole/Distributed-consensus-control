function [t,y] = GUI(NPoints=4)
%GUI Summary of this function goes here
%   Detailed explanation goes here
    xlim([-2,2]);
    ylim([-2,2]);
    hold on;
    line([0,0],[-10,10]);
    line([-10,10],[0,0]);
    grid on;
    for index=1:NPoints
    [x(index),Y(index)]=ginput(1);
    plot(x,Y,'o','MarkerFaceColor','red');
    end
    A=ones(4,4);
    for i=1:4
        A(i,i)=-3;
    end
    I=eye(2);
    A=kron(A,I);
    Points=[x;Y];
    Points=reshape(Points,[8,1])
    [t,y]=ode45(@(t,y) A*y, [0,5],Points);
    for i=1:2:8
        plot(y(:,i),y(:,i+1),'-')
        hold on
    end
end

