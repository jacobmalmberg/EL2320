% This function performs the maximum likelihood association and outlier detection given a single measurement.
% Note that the bearing error lies in the interval [-pi,pi)
%           mu_bar(t)           3X1
%           sigma_bar(t)        3X3
%           z_i(t)              2X1
% Outputs: 
%           c(t)                1X1
%           outlier             1X1
%           nu^i(t)             2XN
%           S^i(t)              2X2XN
%           H^i(t)              2X3XN
function [c, outlier, nu, S, H] = associate(mu_bar, sigma_bar, z_i)

    % Import global variables
    global Q % measurement covariance matrix | 1X1
    global lambda_m % outlier detection threshold on mahalanobis distance | 1X1
    global map % map | 2Xn
    
    % YOUR IMPLEMENTATION %
    
    N = size(map,2); % no landmarks
    H = zeros(2,3,N);
    S = zeros(2,2,N);
    nu = zeros(2,N);
    psi = zeros(1,N);
    
    N;
    for j=1:N
        z_j = observation_model(mu_bar, j);
        H(:,:,j) = jacobian_observation_model(mu_bar, j, z_j);
        S(:,:,j) = H(:,:,j)*sigma_bar*H(:,:,j)' + Q;
        nu(:,j) = z_i - z_j;
        nu(2,j) = mod(nu(2,j) + pi, 2*pi) - pi;
        psi(j) = det(2*pi*S(:,:,j))^(-1/2)*exp(-(1/2)*nu(:,j)'*inv(S(:,:,j))*nu(:,j));
    end
    [~, c] = max(psi);
    
    %outlier = nu(:,j)'*inv(S(:,:,j))*nu(:,j) >= lambda_m;
    %check if Mahahahahlobis distance is higher than threshold
    outlier = nu(:,c)'*inv(S(:,:,c))*nu(:,c) >= lambda_m;
    
    
end