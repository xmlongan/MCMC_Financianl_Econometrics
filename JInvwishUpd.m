function [ Jv_posterior,JPsi_posterior ] = JInvwishUpd( J_MU,J_X )
%JInvwishUpd Inverse Wishart distribution parameters updating
%   First, set the conjugate prior hyperparameters
v_prior=5; Psi_prior=[1 0; 0 1]; % This should be re-considered!
% v is a scalar greater than or equal to d
% Psi is a d-by-d symmetric positive definite matrix;
Jv_posterior=v_prior+length(J_X);
JPsi_posterior=Psi_prior;
% Again, be careful of the dimensions of MU and X;
% It assumed that MU is of 1-by-d
% And, X is of n-by-d;
J_MU=J_MU';J_X=J_X';
for i=1:length(J_X)
    JPsi_posterior=JPsi_posterior+(J_X(:,i)-J_MU)*(J_X(:,i)-J_MU)';
end
end