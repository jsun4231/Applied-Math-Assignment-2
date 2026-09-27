%Computes the vertex coordinates that describe a legal linkage configuration
%INPUTS:
%vertex_coords_guess: a column vector containing the (x,y) coordinates of every vertex
%                      these coords are just a GUESS! It's used to seed Newton's method
%leg_params: a struct containing the parameters that describe the linkage
%theta: the desired angle of the crank
%OUTPUTS:
%vertex_coords_root: a column vector containing the (x,y) coordinates of every vertex
%                    these coords satisfy all the kinematic constraints!
function vertex_coords_root = compute_coords(vertex_coords_guess, leg_params, theta)
    %your code here

    %you will likely need to make a wrapper function of linkage_error_func
    %so that it is only a function of vertex_coords 
    %(and not leg_params or theta, which should be set beforehand)
    %you can then pass this wrapper function to your multidimensional Newton
    %solver, along with vertex_coords_guess to find the vertex coordinates
    %corresponding to the legal configuration of the linkage, 
    %given the values set for leg_params and theta
end

%Error function that encodes all necessary linkage constraints
%INPUTS:
%vertex_coords: a column vector containing the (x,y) coordinates of every vertex
%leg_params: a struct containing the parameters that describe the linkage
%theta: the current angle of the crank
%OUTPUTS:
%error_vec: a vector describing each constraint on the linkage
%           when error_vec is all zeros, the constraints are satisfied
function error_vec = linkage_error_func(vertex_coords, leg_params, theta)
    distance_errors = link_length_error_func(vertex_coords, leg_params);
    coord_errors = fixed_coord_error_func(vertex_coords, leg_params, theta);
    error_vec = [distance_errors;coord_errors];
end

%Error function that encodes the link length constraints
%INPUTS:
%vertex_coords: a column vector containing the (x,y) coordinates of every vertex
%             in the linkage. There are two ways that I would recommend stacking
%             the coordinates. You could alternate between x and y coordinates:
%             i.e. vertex_coords = [x1;y1;x2;y2;...;xn;y_n], or alternatively
%             you could do all the x's first followed by all of the y's
%             i.e. vertex_coords = [x1;x2;...xn;y1;y2;...;yn]. You could also do
%             something else entirely, the choice is up to you.
%leg_params: a struct containing the parameters that describe the linkage
%          importantly, leg_params.link_lengths is a list of linakge lengths
%          and leg_params.link_to_vertex_list is a two column matrix where
%          leg_params.link_to_vertex_list(i,1) and
%          leg_params.link_to_vertex_list(i,2) are the pair of vertices connected 
%          by the ith link in the mechanism
%OUTPUTS:
%length_errors: a column vector describing the current distance error of the ith 
%               link specifically, length_errors(i) = (xb-xa)^2 + (yb-ya)^2 - d_i^2
%               where (xa,ya) and (xb,yb) are the coordinates of the vertices that
%               are connected by the ith link, and d_i is the length of the ith link
function length_errors = link_length_error_func(vertex_coords, leg_params)
    %your code here
end

%Error function that encodes the fixed vertex constraints
%INPUTS:
%vertex_coords: a column vector containing the (x,y) coordinates of every vertex
%               same input as link_length_error_func
%leg_params: a struct containing the parameters that describe the linkage
%            importantly, leg_params.crank_length is the length of the crank
%            and leg_params.vertex_pos0 and leg_params.vertex_pos2 are the
%            fixed positions of the crank rotation center and vertex 2.
%theta: the current angle of the crank
%OUTPUTS:
%coord_errors:  a column vector of height four corresponding to the differences
%               between the current values of (x1,y1),(x2,y2) and 
%               the fixed values that they should be
function coord_errors = fixed_coord_error_func(vertex_coords, leg_params, theta)
    %your code here
end