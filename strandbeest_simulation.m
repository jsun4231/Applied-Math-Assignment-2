%runs strandbeest simulation
function strandbeest_simulation()

    leg_params = define_leg_parameters();

    %column vector of initial guesses
    %for each vertex location.
    %in form: [x1;y1;x2;y2;...;xn;yn]
    vertex_coords_guess = [...
    [   0;   50];... %vertex 1 guess
    [ -50;    0];... %vertex 2 guess
    [ -50;   50];... %vertex 3 guess
    [-100;    0];... %vertex 4 guess
    [-100;  -50];... %vertex 5 guess
    [ -50;  -50];... %vertex 6 guess
    [ -50; -100]...  %vertex 7 guess
    ];

    %set the number of cycles and frames in the animation
    num_cycles = 5;
    num_frames = 180;
    frame_rate = 30;
    theta_list = linspace(0,2*pi,num_frames+1);
    crank_speed = 2*pi*frame_rate/num_frames;
    velocity_scale = 0.5; %constant time scale for the velocity arrow

    %compute one complete cycle of positions and theta derivatives
    vertex_coords_list = zeros(2*leg_params.num_vertices,num_frames+1);
    dVdtheta_list = zeros(2*leg_params.num_vertices,num_frames+1);

    for n = 1:num_frames+1
        theta = theta_list(n);
        vertex_coords = compute_coords(vertex_coords_guess,leg_params,theta);
        vertex_coords_list(:,n) = vertex_coords;

        %use the previous solution as the next initial guess
        vertex_coords_guess = vertex_coords;

        dVdtheta_list(:,n) = compute_velocities(vertex_coords,leg_params,theta);
    end

    %initialize the current figure and save as object
    fig1 = figure(1);
    clf(fig1);

    %set the figure size in pixels for high quality video
    set(fig1,'windowstyle','normal','units','pixels',...
        'position',[0 0 1440 1080],'color','w','resize','off');

    %set equal scaling and fixed axis limits
    hold on;
    axis([-120,30,-110,45]);
    axis equal;
    axis manual;
    box on; grid on;
    set(gca,'TickLabelInterpreter','latex','fontsize',18);
    title('Jansen''s Linkage','interpreter','latex');
    xlabel('$x$ (-)','interpreter','latex');
    ylabel('$y$ (-)','interpreter','latex');

    %draw the crank path and the complete leg tip path
    plot(leg_params.vertex_pos0(1)+leg_params.crank_length*cos(theta_list),...
        leg_params.vertex_pos0(2)+leg_params.crank_length*sin(theta_list),...
        'k:','linewidth',1);
    tip_path = plot(vertex_coords_list(end-1,:),vertex_coords_list(end,:),...
        'b--','linewidth',1.5);

    leg_drawing = initialize_leg_drawing(leg_params);
    plot([leg_params.vertex_pos0(1),leg_params.vertex_pos2(1)],...
        [leg_params.vertex_pos0(2),leg_params.vertex_pos2(2)],...
        'bo','markerfacecolor','b','markersize',8);

    %the zero scale disables automatic scaling of the velocity arrow
    velocity_plot = quiver(0,0,0,0,0,'color',[0,0.5,0],...
        'linewidth',2,'MaxHeadSize',1);
    legend([tip_path,velocity_plot],{'Foot path','Tip velocity (scaled)'},...
        'interpreter','latex','location','northeast');

    %create a videowriter, which will write frames to the animation file
    writerObj = VideoWriter('strandbeest_animation.avi');
    writerObj.FrameRate = frame_rate;
    writerObj.Quality = 100;
    open(writerObj);

    %animate five complete cycles, including the final endpoint
    for cycle_index = 1:num_cycles
        last_frame = num_frames;
        if cycle_index==num_cycles
            last_frame = num_frames+1;
        end

        for n = 1:last_frame
            vertex_coords = vertex_coords_list(:,n);
            update_leg_drawing(vertex_coords,leg_drawing,leg_params);

            %convert theta derivatives to velocities using the crank speed
            tip_velocity = crank_speed*dVdtheta_list(end-1:end,n);
            set(velocity_plot,'xdata',vertex_coords(end-1),...
                'ydata',vertex_coords(end),...
                'udata',velocity_scale*tip_velocity(1),...
                'vdata',velocity_scale*tip_velocity(2));

            drawnow;
            current_frame = getframe(fig1);
            writeVideo(writerObj,current_frame);
        end
    end

    %close the video file after all frames have been written
    close(writerObj);

    fprintf('Saved strandbeest_animation.avi: %d complete cycles.\n',num_cycles);
end