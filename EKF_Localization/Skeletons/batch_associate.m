% This function performs the maximum likelihood association and outlier detection.
% Note that the bearing error lies in the interval [-pi,pi)
%           mu_bar(t)           3X1
%           sigma_bar(t)        3X3
%           z(t)                2Xn
% Outputs: 
%           c(t)                1Xn
%           outlier             1Xn
%           nu_bar(t)           2nX1
%           H_bar(t)            2nX3
function [c, outlier, nu_bar, H_bar] = batch_associate(mu_bar, sigma_bar, z)
        
        % YOUR IMPLEMENTATION %
%         global Q % measurement covariance matrix | 1X1    
%         global lambda_m % outlier detection threshold on mahalanobis distance | 1X1
%         global map % map | 2Xn
        
        obs = size(z, 2);
%         N = size(map,2); % no landmarks
        outlier = zeros(1,obs);
        c = zeros(1,obs);
        nu_bar=[];
        H_bar=[];
        

        
        
        for i=1:obs
            %new matrices for every observation
%             H = zeros(2,3,N);
%             S = zeros(2,2,N);
%             nu = zeros(2,N);
%             psi = zeros(1,N);
%             for j=1:N
                %same as in associate.m
            [mI, outlier_landmark, nu, ~, H] = associate(mu_bar, sigma_bar, z(:,i));
%                 z_j = observation_model(mu_bar, j);
%                 H(:,:,j) = jacobian_observation_model(mu_bar, j, z_j);
%                 S(:,:,j) = H(:,:,j)*sigma_bar*H(:,:,j)' + Q;
%                 nu(:,j) = z(:,i) - z_j;
%                 z(:, i)
%                 nu(2,j) = mod(nu(2,j) + pi, 2*pi) - pi;
%                 psi(j) = det(2*pi*S(:,:,j))^(-1/2)*exp(-(1/2)*nu(:,j)'*inv(S(:,:,j))*nu(:,j));
%             end
            
            %[~, mI] = max(psi);
            c(i) = mI;
            %outlier(i) = nu(:,mI)'*inv(S(:,:,mI))*nu(:,mI) >= lambda_m;
            outlier(i) = outlier_landmark;

            nu_bar= [nu_bar; nu(:,mI)];
            H_bar = [H_bar; H(:,:,mI)];
            
         
        end
                  
          
end