%Converts from the column vector form of the coordinates to a
%friendlier matrix form
%INPUTS:
%coords_in = [x1;y1;x2;y2;...;xn;yn] (2n x 1 column vector)
%OUTPUTS:
%coords_out = [x1,y1;x2,y2;...;xn,yn] (n x 2 matrix)
function coords_out = column_to_matrix(coords_in)
    num_coords = length(coords_in);
    coords_out = [coords_in(1:2:(num_coords-1)),coords_in(2:2:num_coords)];
end