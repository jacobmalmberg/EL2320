% This function performs the ML data association
%           S_bar(t)                 4XM
%           z(t)                     2Xn
%           association_ground_truth 1Xn | ground truth landmark ID for
%           every measurement
% Outputs: 
%           outlier                  1Xn
%           Psi(t)                   1XnXM
function [outlier, Psi, c] = associate(S_bar, z, association_ground_truth)
    if nargin < 3
        association_ground_truth = [];
    end

    global DATA_ASSOCIATION % wheter to perform data association or use ground truth
    global lambda_psi % threshold on average likelihood for outlier detection
    global Q % covariance matrix of the measurement model
    global M % number of particles
    global N % number of landmarks
    global landmark_ids % unique landmark IDs
    %Q=Q*0.001;
    
   
    n = size(z,2);
    %nu = zeros(size(z));
    %phi = zeros(N,M);
    Psi=zeros(1,n,M);
    c=zeros(1,n,M);
    z_mat= zeros(2,M,N);
    %nu = zeros(2,M,N);
    
    z_tensor=repmat(z, [1 1 N]); %reshape to tensor
    
    
    for k=1:N
        z_mat(:,:,k) = observation_model(S_bar, k);
    end
    
    zhat_tensor=repmat(z_mat, [1 1 1 n]); %reshape to tensor
    z2= repmat(z,[1 1 M N]);
    z2=permute(z2,[1 3 4 2]);

 
    nu=z2-zhat_tensor;
    nu(2,:,:,:) = mod(nu(2,:,:,:) + pi, 2*pi) - pi;
    
    phi = det(2*pi*Q)^(-1/2)*exp(-0.5*(nu(1,:,:,:).^(2)./Q(1,1) + nu(2,:,:,:).^(2)./Q(2,2)));
    
    [m, cI] = max(phi,[],[3]);

    Psi(1,:,:) = squeeze(m)';
    c(1,:,:) = squeeze(cI)';
    
    outlier=mean(Psi,3)<=lambda_psi;
    
    
    


end