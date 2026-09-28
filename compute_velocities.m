%Computes the theta derivatives of each vertex coordinate for the Jansen linkage
%INPUTS:
%vertex_coords: a column vector containing the (x,y) coordinates of every vertex
%               these are assumed to satisfy the linkage constraints
%leg_params: a struct containing the parameters that describe the linkage
%theta: the current angle of the crank
%OUTPUTS:
%dVdtheta: a column vector containing the theta derivatives of each vertex coord
function dVdtheta = compute_velocities(vertex_coords, leg_params, theta)
    coords = column_to_matrix(vertex_coords);
    num_coords = 2*leg_params.num_vertices;

    %compute the Jacobian of the link length error function
    J = zeros(leg_params.num_linkages,num_coords);
    for linkage_index = 1:leg_params.num_linkages
        vertex_a = leg_params.link_to_vertex_list(linkage_index,1);
        vertex_b = leg_params.link_to_vertex_list(linkage_index,2);

        delta = coords(vertex_b,:)-coords(vertex_a,:);
        J(linkage_index,2*vertex_a-1:2*vertex_a) = -2*delta;
        J(linkage_index,2*vertex_b-1:2*vertex_b) = 2*delta;
    end

    %combine the fixed coordinate and link length derivative constraints
    M = [eye(4),zeros(4,num_coords-4);J];
    B = zeros(num_coords,1);
    B(1:2) = leg_params.crank_length*[-sin(theta);cos(theta)];

    dVdtheta = M\B;
end