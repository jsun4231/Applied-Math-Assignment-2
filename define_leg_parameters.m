%Defines a struct that contains the constants for Strandbeest leg
%OUTPUTS:
%leg_params: a struct with the following fields
%leg_params.num_vertices: number of vertices in linkage
%leg_params.num_linkages: number of links in linkage
%leg_params.link_lengths: list of lengths for each link in the leg mechanism
%leg_params.crank_length: length of crank shaft
%leg_params.vertex_pos0: fixed position coords of vertex 0
%leg_params.vertex_pos2: fixed position coords of vertex 2
function leg_params = define_leg_parameters()
    %initialize leg_params structure
    leg_params = struct();
    
    %number of vertices in linkage
    leg_params.num_vertices = 7;
    
    %number of links in linkage
    leg_params.num_linkages = 10;
    
    %matrix relating links to vertices
    leg_params.link_to_vertex_list = ...
        [ 1, 3;... %link 1  adjacency
          3, 4;... %link 2  adjacency
          2, 3;... %link 3  adjacency
          2, 4;... %link 4  adjacency
          4, 5;... %link 5  adjacency
          2, 6;... %link 6  adjacency
          1, 6;... %link 7  adjacency
          5, 6;... %link 8  adjacency
          5, 7;... %link 9  adjacency
          6, 7 ... %link 10 adjacency
          ];
    
    %list of lengths for each link
    %in the leg mechanism
    leg_params.link_lengths = ...
        [   50.0,... %link 1  length
            55.8,... %link 2  length
            41.5,... %link 3  length
            40.1,... %link 4  length
            39.4,... %link 5  length
            39.3,... %link 6  length
            61.9,... %link 7  length
            36.7,... %link 8  length
            65.7,... %link 9  length
            49.0 ... %link 10 length
            ];   

    %length of crank shaft
    leg_params.crank_length = 15.0;
    
    %fixed position coords of vertex 0
    leg_params.vertex_pos0 = [0;0];
    
    %fixed position coords of vertex 2
    leg_params.vertex_pos2 = [-38.0;-7.8]; 
end