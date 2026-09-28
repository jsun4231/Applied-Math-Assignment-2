%Updates the plot objects that visualize the leg linkage
%for the current leg configuration
%INPUTS:
%complete_vertex_coords: a column vector containing the (x,y) coordinates of every vertex
%leg_drawing: a struct containing all the plotting objects for the linkage
%       leg_drawing.linkages is a cell array, where each element corresponds
%       to a plot of a single link (excluding the crank)
%       leg_drawing.crank is a plot of the crank link
%       leg_drawing.vertices is a cell array, where each element corresponds
%       to a plot of one of the vertices in the linkage
function update_leg_drawing(complete_vertex_coords, leg_drawing, leg_params)
    coords = column_to_matrix(complete_vertex_coords);

    %iterate through each link, and update corresponding link plot
    for linkage_index = 1:leg_params.num_linkages

        %linkage_index is the label of the current link
        vertex_a = leg_params.link_to_vertex_list(linkage_index,1);
        vertex_b = leg_params.link_to_vertex_list(linkage_index,2);

        %line_x and line_y should both be two element arrays containing
        %the x and y coordinates of the line segment describing the current link
        line_x = [coords(vertex_a,1),coords(vertex_b,1)];
        line_y = [coords(vertex_a,2),coords(vertex_b,2)];
        set(leg_drawing.linkages{linkage_index},'xdata',line_x,'ydata',line_y);
    end

    %iterate through each vertex, and update corresponding vertex plot
    for vertex_index = 1:leg_params.num_vertices

        %vertex_index is the label of the current vertex

        %dot_x and dot_y should both be scalars
        %specifically the x and y coordinates of the corresponding vertex
        dot_x = coords(vertex_index,1);
        dot_y = coords(vertex_index,2);

        set(leg_drawing.vertices{vertex_index},'xdata',dot_x,'ydata',dot_y);
    end

    %crank_x and crank_y should both be two element arrays
    %containing the x and y coordinates of the line segment describing the crank
    crank_x = [leg_params.vertex_pos0(1),coords(1,1)];
    crank_y = [leg_params.vertex_pos0(2),coords(1,2)];

    set(leg_drawing.crank,'xdata',crank_x,'ydata',crank_y);
end