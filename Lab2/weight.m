% This function calcultes the weights for each particle based on the
% observation likelihood
%           S_bar(t)            4XM
%           outlier             1Xn
%           Psi(t)              1XnXM
% Outputs: 
%           S_bar(t)            4XM
function S_bar = weight(S_bar, Psi, outlier)

    % YOUR IMPLEMENTATION
    %nonOutlier = Psi(:, outlier<1,:); %
    weights=prod(Psi(:,outlier<1,:),2); % product

    
    w_sum = sum(weights);
    weights = weights/w_sum;
    S_bar(4,:) = weights;
    

    
end
