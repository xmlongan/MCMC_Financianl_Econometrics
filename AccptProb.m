function [ prob ] = AccptProb( var1,var0,C,S )
%AccptProb Calculate the accept probability
%   Detailed explanation goes here
Z0=(C-BS(sqrt(var0),S))./(var0^2);
Z1=(C-BS(sqrt(var1),S))./(var1^2);
% prob_var0=prod(exp(-1/2.*Z0.^2));
% prob_var1=prod(exp(-1/2.*Z1.^2));
ratio=exp(sum(-1/2.*Z0.^2)-sum(-1/2.*Z1.^2));
prob=min(ratio,1);
end

