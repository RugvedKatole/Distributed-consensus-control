function dy = second(t,y,L,L1,d)
[~,S]=size(L);
dy = zeros(2*S,1);
dy(1:S) = y(S+1:2*S)+L*d;
% [r, c] = size(y(S+1:2*S))
dy(S+1:2*S) = -L1*y(1:S)-L1*y(S+1:2*S);
end

