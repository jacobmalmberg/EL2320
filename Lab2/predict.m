% This function performs the prediction step.
% Inputs:
%           S(t-1)            4XN
%           v                 1X1
%           omega             1X1
% Outputs:   
%           S_bar(t)          4XN
function [S_bar] = predict(S, v, omega, delta_t)

    % Comment out any S_bar(3, :) = mod(S_bar(3,:)+pi,2*pi) - pi before
    % running the test script as it will cause a conflict with the test
    % function. If your function passes, uncomment again for the
    % simulation.

    global R % covariance matrix of motion model | shape 3X3
    global M % number of particles
    %N =M
    N=3;
    S_bar=zeros(size(S));
    
    u = delta_t*v*[cos(S(3, :));sin(S(3, :))]; 
    u3 = ones(1, M)*omega*delta_t;
    
    S_bar(1:2,:) = S(1:2,:) +u;
    S_bar(3,:) = S(3,:)+ u3;
    
    S_bar(1:3,:) = S_bar(1:3,:) + mvnrnd(zeros(1,3), R,M)';
    
    %S_bar(3, :) = mod(S_bar(3,:)+pi,2*pi) - pi;
    
    S_bar(4,:) = S(4,:);
    
    

    % YOUR IMPLEMENTATION

    
end