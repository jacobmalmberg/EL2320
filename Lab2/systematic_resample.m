% This function performs systematic re-sampling
% Inputs:   
%           S_bar(t):       4XM
% Outputs:
%           S(t):           4XM
function S = systematic_resample(S_bar)
	
    global M % number of particles 
    
    % YOUR IMPLEMENTATION
    S = zeros(4,M);
    
    weight=1/M;
    r_0 = 0 + (weight-0)*rand;
    CDF = cumsum(S_bar(4, :));

    for m=1:M
        argmin = find(CDF>=(r_0 + (m-1)/M),1);
        S(:,m) = [S_bar(1:3,argmin); weight];
    end
    

end