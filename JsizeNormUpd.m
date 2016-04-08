function [ m,V ] = JsizeNormUpd( Covar,J_Covar,MU,J_MU,j_t,y_t )
%JsizeNormUpd The posterior of the state, jump size, is normally distributed 
%   Update the posterior parameters
V=(j_t*Covar^(-1)+J_Covar^(-1))^(-1);
m=V*(j_t*Covar^(-1)*(y_t-MU)+J_Covar^(-1)*J_MU);
end

