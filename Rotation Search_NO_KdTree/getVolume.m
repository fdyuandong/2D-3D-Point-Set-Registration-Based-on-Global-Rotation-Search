function [V] = getVolume(branch)
%GETVOLUME calculate remaining volume
%
%   branch£ºinput branches
%   V£ºVolume


k=branch(4:6,:)-branch(1:3,:);
V=sum(k(1,:).*k(2,:).*k(3,:));


end

