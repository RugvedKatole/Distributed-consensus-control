function [X1,Y1] = formation(X1,Y1,NPoints,formation)
%FORMATION Summary of this function goes here
%   Detailed explanation goes here

if strcmp(formation,'pyramid')
    [tx,ty]=Translate(NPoints,0.5,0);
    X1=X1+tx;
    Y1=Y1+ty;
elseif strcmp(formation,'bipyramid')
    [tx,ty]=Translate(NPoints/2,0.5,0);
    X1=X1+[tx,tx];
    Y1=Y1+[ty,ty];
elseif strcmp(formation,'circle')
    [~,N]=size(X1);
    theta=360/N;
    X1=X1+tx;
    Y1=Y1+ty;
end
end

