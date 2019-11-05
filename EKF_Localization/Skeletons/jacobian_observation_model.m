% This function is the implementation of the jacobian measurement model
% required for the update of the covariance function after incorporating
% the measurements
% Inputs:
%           x(t)        3X1
%           j           1X1 which landmark (map column)
%           z_j         2X1
% Outputs:  
%           H           2X3
function H = jacobian_measurement_model(x, j, z_j)

    global map % map | 2Xn for n landmarks

    % YOUR IMPLEMENTATION %

end
