function [ v_posterior,Psi_posterior ] = InvwishUpd( MU,X )
%InvwishUpd Inverse Wishart distribution parameters updating
%   First, set the conjugate prior hyperparameters
v_prior=5; Psi_prior=[1 0; 0 1]; % This should be re-considered!
% v is a scalar greater than or equal to d
% Psi is a d-by-d symmetric positive definite matrix;
v_posterior=v_prior+length(X);
Psi_posterior=Psi_prior;
% Again, be careful of the dimensions of MU and X;
% It assumed that MU is of 1-by-d
% And, X is of n-by-d;
MU=MU';X=X';
for i=1:length(X)
    Psi_posterior=Psi_posterior+(X(:,i)-MU)*(X(:,i)-MU)';
end
end