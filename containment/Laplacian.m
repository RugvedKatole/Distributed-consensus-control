function [L] = Laplacian(graph_type,no_agents)
%LAPLACIAN Summary of this function goes here
%   Detailed explanation goes here
if strcmp(graph_type,'connected')
    L=eye(no_agents)*(no_agents)-ones(no_agents);
elseif strcmp(graph_type,'bipartite')
    A1=triu(randi([-1,1],no_agents/2,no_agents/2),1);
    A2=triu(randi([-1,1],no_agents/2,no_agents/2),1);
    A=[abs(A1),A2;A2,abs(A1)];
    A=A+A';
    D=eye(no_agents).*[sum(abs(A),2)];
    L=D-A;
    L(1:no_agents/2,no_agents/2+1:end)=abs(L(1:no_agents/2,no_agents/2+1:end));
    L(no_agents/2+1:end,1:no_agents/2)=abs(L(no_agents/2+1:end,1:no_agents/2));
elseif strcmp(graph_type,'contain1')
    L =[0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
     0     2     0    -2     0     0     0     0     0     0     0     0     0     0     0     0
     0    -1     1     0     0     0     0     0     0     0     0     0     0     0     0     0
     0     0     3     3     0     0     0     0     0     0     0     0     0     0     0     0
     0     0     0     0     5     5     0     0     0     0     0     0     0     0     0     0
     0     0     0     0     0     6     6     0     0     0     0     0     0     0     0     0
     0     0     0     0    -4     0     4     0     0     0     0     0     0     0     0     0
     0     0     0     0     0     1     0     1     0     0     0     0     0     0     0     0
     0     0     0    -2     0     0     0     3     5     0     0     0     0     0     0     0
    -4     0     0     0     0     0     0     0     0     9     5     0     0     0     0     0
     0    -6     0     0     0     0     0     0     0     7    13     0     0     0     0     0
     0     0     0     0     0     0     0     0     0    -8     0     8     0     0     0     0
     0     0     0     0    -1     0     0     0     0     0     0     0     3     2     0     0
     0     0     0     0     0     0     0     0     0     0     0     0     0     5     0    -5
     0     0     3     0     0     0     0     0     0     0     0     0     0     4     7     0
     0     0     0     0     0     0     0     0     0     0     0     0     0     0     6     6];
elseif strcmp(graph_type,'contain2')
    L=[4,-1,-1,-1,-1;-1,3,1,0,1;-1,1,3,1,0;-1,0,1,3,1;-1,1,0,1,3];
end

