function [ MU_posterior, Covar_posterior ] = MvnormUpd( covar,X )
%UNTITLED2 Summary of this function goes here
%   First, set the multivariate norm MU prior
MU_prior=[0 0]; Covar_prior=[sqrt(1000) 0; 0 sqrt(1000)];
% Then, update the hyperparameters
Covar_posterior=(Covar_prior^(-1)+length(X)*covar^(-1))^(-1);
MU_posterior=Covar_posterior*(Covar_prior^(-1)*MU_prior'+n*covar^(-1)*mean(X)');
% be careful of the dimension of X, X is a matrix of size n-by-2!
MU_posterior=MU_posterior';
end

