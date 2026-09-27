%Converts from the matrix form of the coordinates back to the
%original column vector form
%INPUTS:
%coords_in = [x1,y1;x2,y2;...;xn,yn] (n x 2 matrix)
%OUTPUTS:
%coords_out = [x1;y1;x2;y2;...;xn;yn] (2n x 1 column vector)
function coords_out = matrix_to_column(coords_in)
    num_coords = 2*size(coords_in,1);
    coords_out = zeros(num_coords,1);
    coords_out(1:2:(num_coords-1)) = coords_in(:,1);
    coords_out(2:2:num_coords) = coords_in(:,2);
end