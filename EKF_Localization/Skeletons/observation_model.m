% This function is the implementation of the measurement model.
% The bearing should be in the interval [-pi,pi)
% Inputs:
%           x(t)                           3X1
%           j                              1X1
% Outputs:  
%           h                              2X1
function z_j = measurement_model(x, j)

    global map % map | 2Xn for n landmarks 2x10

    % YOUR IMPLEMENTATION %
    
    h = zeros(2,1);
    h(1) = sqrt((map(1,j) - x(1))^(2)+(map(2,j)-x(2))^(2));
    h(2) = mod(atan2(map(2,j)-x(2), map(1,j) - x(1)) - x(3)+pi,2*pi)-pi;
    
    z_j = h;
%     size(map)
%     j;
%     map(:,3)

end