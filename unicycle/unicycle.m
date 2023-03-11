function dy = unicycle(t,y,L)
%UNICYCLE Summary of this function goes here
%   Detailed explanation goes here
[~,s]=size(L);
s=2*s;
dy = zeros(2*s,1);
dy(1:2:s) = y(s+1:3*s/2).*cosd(y(3*s/2+1:2*s));
dy(2:2:s) = y(s+1:3*s/2).*sind(y(3*s/2+1:2*s));
dy(s+1:3*s/2)=0;
% z=(min([y(3*s/2+1)-y(3*s/2+1:2*s)],(360-max(ones(size(y(3*s/2+1:2*s)))*y(3*s/2+1),y(3*s/2+1:2*s))+min(ones(size(y(3*s/2+1:2*s)))*y(3*s/2+1),y(3*s/2+1:2*s)))));
% z=-sum([y(3*s/2+1)-y(3*s/2+1:2*s)]);
dy(3*s/2+1:end)=-L*y(3*s/2+1:2*s);

% for i=1:s/2
%     dy(i)=unicycleKinematics("VehicleSpeedHeadingRate");
% end
end

