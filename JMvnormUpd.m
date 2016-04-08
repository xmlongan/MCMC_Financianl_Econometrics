function [ J_MU_posterior,J_Covar_posterior] = JMvnormUpd( J_covar,J_X )
%JMvnormUpd Summary of this function goes here
%   First, set the multivariate norm J_MU prior
J_MU_prior=[0 0]; J_Covar_prior=[sqrt(1000) 0; 0 sqrt(1000)];
% Then, update the hyperparameters
J_Covar_posterior=(J_Covar_prior^(-1)+length(J_X)*J_covar^(-1))^(-1);
J_MU_posterior=J_Covar_posterior*(J_Covar_prior^(-1)*J_MU_prior'+n*J_covar^(-1)*mean(J_X)');
% be careful of the dimension of X, X is a matrix of size n-by-2!
J_MU_posterior=J_MU_posterior';
end