function [ e_posterior,E_posterior ] = BetaUpd( J )
%BetaUpd Update the conjugate Beta distribution parameters
%   First, set the prior parameters
e=2;E=3; % this is set by random, it should be verified later.
e_posterior=e+sum(J);
E_posterior=length(J)-sum(J)+E;
end

