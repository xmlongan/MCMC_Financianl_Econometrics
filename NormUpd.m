function [ mu_posterior,var_posterior ] = NormUpd( var,X )
%NormUpd NormUpd update the conjugate Normal parameters
%   Detailed explanation goes here

% set the hyperparameter for conjugate norm
mu_prior=0; var_prior=1;
n=length(X);
var_posterior=1/(1/var_prior+n/var);
mu_posterior=(mu_prior/var_prior+sum(X)/var)*var_posterior;
end

