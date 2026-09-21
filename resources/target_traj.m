%function describing motion of a flying target
%t is time in seconds
function V_t = target_traj(t)
    a1 = 7; %x amplitude in meters
    b1 = 9; %y amplitude meters
    omega1 = 3; %frequency in rad/sec
    phi1 = -pi/7; %phase shift in radians
    

    a2 = 2; %x amplitude in meters
    b2 = .7; %y amplitude meters
    omega2 = 5; %frequency in rad/sec
    phi2 = 1.5*pi; %phase shift in radians

    x0 = 28;  %x offset in meters
    y0 = 21;  %y offset in meters

    %compute position vector
    V_t = [a1*cos(omega1*t+phi1)+a2*cos(omega2*t+phi2)+x0;...
           b1*sin(omega1*t+phi1)+b2*sin(omega2*t+phi2)+y0];
end