% This function performs the prediction step.
% Inputs:
%           mu(t-1)           3X1   
%           sigma(t-1)        3X3
%           u(t)              3X1
% Outputs:   
%           mu_bar(t)         3X1
%           sigma_bar(t)      3X3
function [mu_bar, sigma_bar] = predict(mu, sigma, u)
    
    global R % covariance matrix of motion model | shape 3X3

    % YOUR IMPLEMENTATION %

end