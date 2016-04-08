function [ Ct ] = BS( sigma,St )
%BS Black-Scholes Option Pricing Formula
%   setting K r T t
K=10;r=0.05;T=61;%t=10;
% set day as time unit, so the risk-neutral interest rate should also be
% set as r=log(1.05)/200
r=log(1+r)/200;
if length(St)>=61
    error('The length of S should not exceeds 60!')
end
if length(St)==1
    t=10;
else
    t=1:length(St);
    t=t';
end
 
d1=(log(St./K)+(r+0.5*sigma^2).*(T-t))./(sigma.*sqrt(T-t));
Ct=St.*normcdf(d1)-exp(-r.*(T-t)).*K.*normcdf(d1-sigma.*sqrt(T-t));
end

