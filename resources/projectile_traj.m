%projectile motion function
%theta is angle projectile is fired at (in radians)
%t is time in seconds
function V_p = projectile_traj(theta,t)
    g = 2.3; %gravity in m/s^2
    v0 = 14; %initial speed in m/s
    px0 = 2; %initial x position
    py0 = 4; %initial y position

    %compute position vector
    V_p = [v0*cos(theta)*t+px0; -.5*g*t.^2+v0*sin(theta)*t+py0];
end
