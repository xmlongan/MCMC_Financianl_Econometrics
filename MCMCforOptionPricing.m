%% MCMC for option pricing
% assume annual return rate =0.08, then daily return rate solve
% e^(mu*200)=1.08
clear
mu=log(1.08)/200;
% how to set the yearly volatility?
sigma=0.1;
Y=mu+sigma.*randn(60,1);
S0=10;
S=exp(cumsum(Y))*S0;
figure
plot(S,'m*')
C=BS(sigma,S)+random('Normal',0,0.7,60,1);
hold on
plot(C,'cp')
legend('S','C+err')
clearvars -except Y S C

% set the initial variance
var=0.1;
smpl=zeros(1000,3);
for i=1:1000
    [mu_posterior,var_posterior]=NormUpd(var,Y);
    mu=random('Normal',mu_posterior,sqrt(var_posterior));
    
    [shape_posterior,scale_posterior]=InvGmaUpd(mu,Y);
    var1=1/random('Gamma',shape_posterior,1/scale_posterior);
    prob=AccptProb( var1,var,C,S );
    if rand<prob
        var=var1;
    end
    %store the parameter samples
    smpl(i,:)=[mu,var,prob];
end
% estimate the true parameter mu and variance
mu_estmt=mean(smpl(500:end,1));
var_estmt=mean(smpl(500:end,2));
%display the estimation
display(log(1.08)/200); display(mu_estmt)
display(0.1*0.1); display(var_estmt)
%% Trace of the Monte Carlo Markov Chain
% plot the trace of the MCMC
figure
plot(smpl(:,1),'magenta')
hold on
plot(smpl(:,2),'cyan')
plot(smpl(:,3),'blue')
title('trace of the MCMC')
legend('mu','variance','Accept Probability')