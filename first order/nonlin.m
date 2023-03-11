function dy = nonlin(t,y,L)
[~,S]=size(L)
dy = zeros(2*S,1);
dy(1:S) = y(S+1:2*S);
% [r, c] = size(y(S+1:2*S))
dy(S+1:2*S) = -L*y(1:S)-0.8*y(S+1:2*S);
end

