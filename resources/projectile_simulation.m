%visualize the motion of the projectile and the target
%theta is the initial firing angle of the projectile
%t_c is the predicted collision time
function projectile_simulation(theta,t_c)
    %create the plot window, set the axes size, and add labels
    hold on;
    axis equal; axis square;
    axis([0,50,0,50])
    xlabel('x (m)')
    ylabel('y (m)')
    title('Simulation of Projectile Shot at Target')

    %initialize plots for the projectile/target and their paths
    traj_line_proj = plot(0,0,'g--','linewidth',2);
    traj_line_targ = plot(0,0,'k--','linewidth',2);
    t_plot = plot(0,0,'bo','markerfacecolor','b','markersize',8);
    p_plot = plot(0,0,'ro','markerfacecolor','r','markersize',8);
    
    %position lists
    %used for plotting paths of projectile/target
    V_list_proj = [];
    V_list_targ = [];

    %iterate through time until a little after the collision occurs
    for t = 0:.005:t_c+1.5
        %set time so that things freeze once collision occurs
        t_input = min(t,t_c);

        %compute position of projectile and target
        V_p = projectile_traj(theta,t_input);
        V_t = target_traj(t_input);

        %update the position lists
        V_list_proj(:,end+1) = V_p;
        V_list_targ(:,end+1) = V_t;

        %index used for tail of target path
        i = max(1,size(V_list_targ,2)-300);

        %update plots
        set(t_plot,'xdata',V_t(1),'ydata',V_t(2));
        set(p_plot,'xdata',V_p(1),'ydata',V_p(2));
        set(traj_line_proj,'xdata',V_list_proj(1,:),'ydata',V_list_proj(2,:));
        set(traj_line_targ,'xdata',V_list_targ(1,i:end),'ydata',V_list_targ(2,i:end));
        
        %show updated plots
        drawnow;
    end
end