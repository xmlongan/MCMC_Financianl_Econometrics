function [ shape_posterior,scale_posterior ] = InvGmaUpd( mu,X )
% InvGmaUpd  InvGmaUpd update the conjugate inverse gamma distribution hyperparameters 
%   Detailed explanation goes here

% set the hyperparameter for conjugate inverse gamma distribution
shape_prior=2; scale_prior=1;
shape_posterior=shape_prior+length(X)/2;
scale_posterior=scale_prior+sum((X-mu).^2)./2;
end

