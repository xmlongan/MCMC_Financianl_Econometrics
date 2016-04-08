%% MCMC example
% Learn the algorithm of MCMC

%% MCMC for Geometric Brownian Motion
% Using MCMC method to estimate parameters of Geometric Brownian Motion
% prior: variance $\sigma^2 \sim InverseGamma(2,1)$, var;
%            mean $\mu \sim N(0,1)$ , mu;
%
% Prepare sample data Y(1:100);
clear
Y=random('Normal',0.1,0.2,200,1);
%%
% $\mu^{*}=0.1, \sigma^{*2}=0.04$
%
% set the initial variance
var=1;
smpl=zeros(1000,2);
for i=1:1000
    [mu_posterior,var_posterior]=NormUpd(var,Y);
    mu=random('Normal',mu_posterior,sqrt(var_posterior));
    
    [shape_posterior,scale_posterior]=InvGmaUpd(mu,Y);
    var=1/random('Gamma',shape_posterior,1/scale_posterior);
    %store the parameter samples
    smpl(i,:)=[mu,var];
end
% estimate the true parameter mu and variance
mu_estmt=mean(smpl(500:end,1));
var_estmt=mean(smpl(500:end,2));
%display the estimation
display(0.1); display(mu_estmt)
display(0.04); display(var_estmt)
%% Trace of the Monte Carlo Markov Chain
% plot the trace of the MCMC
plot(smpl(:,1),'magenta')
hold on
plot(smpl(:,2),'cyan')
title('trace of the MCMC')
legend('mu','variance')

