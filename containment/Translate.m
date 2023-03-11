function [Tx,Ty] = Translate(N,distance,theta)
%TRANSLATE Summary of this function goes here
%   Detailed explanation goes here
N=roots([1,1,-2*N]);
N=N(N>0);
j=0;
R=[cosd(theta) -sind(theta); sind(theta) cosd(theta)];
for i=0:N-1
    Ty(i*(i+1)/2+1:(i+1)*(i+2)/2)=ones(1,i+1)*(N-i-1);
    Tx(i*(i+1)/2+1:(i+1)*(i+2)/2)=(N-1)/2-j:(N-1)/2+j;
    rot=R*[Tx;Ty];
    Tx=rot(1,:);
    Ty=rot(2,:);
    Tx=flip(Tx,2);
    Ty=flip(Ty,2);
    
    
    j=j+distance;
end
end

