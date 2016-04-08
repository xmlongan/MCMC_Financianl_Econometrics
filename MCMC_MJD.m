%% MCMC, Multivariate Jump-Diffusion Models
% First, generating samples from Multivariate Jump-Diffusion Models
clear
mu1=0.1417; mu2=0.0839;
sigma1=1.2073; sigma2=0.7236;
rho=0.6509;
covar=[sigma1^2 rho*sigma1*sigma2; rho*sigma2*sigma1 sigma2^2];
Y=mvnrnd([mu1 mu2],covar,100);

lambda=0.0799;
mu_1j=-0.5747; mu_2j=-0.3460;
sigma_1j=2.9666; sigma_2j=2.5873;
rho_j=0.5190;
covar_j=[sigma_1j^2 rho_j*sigma_1j*sigma_2j; rho_j*sigma_2j*sigma_1j sigma_2j^2];
J=binornd(1,lambda,100,1);
Jsize=mvnrnd([mu_1j mu_2j],covar_j,100);

Y(:,1)=Y(:,1)+J.*Jsize(:,1);
Y(:,2)=Y(:,2)+J.*Jsize(:,2);
clearvars -except Y
%% 



