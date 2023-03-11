function [t,y] = Dynamics(type,no_agents,X,Y)
%DYNAMICS Summary of this function goes here
%   This function creates the lapacian(L) for a particular dynamics and
%   further solves it using ode45
%% creating the lapacian for linear dynamics dy=L*y
L=eye(no_agents)*(no_agents)-ones(no_agents);
% L=[2,-1,0,-1;-1,2,-1,0;0,-1,2,-1;-1,0,-1,2]           %ring graph for 4
% nodes
L=kron(L,eye(2));
%% resizing initail conditions in a flat vector

Points=reshape([X;Y],[no_agents*2,1]);

%% selecting the dynamics and solving ODE45
if strcmp(type,'non_linear')
    V=zeros(2*no_agents,1);
    Points=reshape([Points;V],[no_agents*4,1]);
    [t,y]=ode45(@(t,y) nonlin(t,y,L), [0,20],Points);
end
if strcmp(type,'linear')
    
    [t,y]=ode45(@(t,y) lin(t,y,L), [0,10],Points);
end

