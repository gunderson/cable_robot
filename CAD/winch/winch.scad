use <../../components/ball_bearing.scad>;

// default measurements are in mm, but should theoretically work proportionally for imperial scale as well

TAU = 2 * PI;

// --------------------------------------------------------------
// cable characteristics

cable_length = 500; // distance from spool to pulley + 0.25 * pulley circumference + top pulley angle + diagonal length - carriage corner distance from center
cable_min_bend_radius = 15;
cable_diameter = 3.4;

// --------------------------------------------------------------
// spool assembly

spool_inner_radius = 10; // affects torque
spool_groove_width = cable_diameter; // should closely match the width of the tensile cable
spool_groove_depth = spool_groove_width * 0.75; // groove wall height. Should be greater than 0.5 * groove width
pitch = 8; // groove spacing on center. should be greater than groove width (groove spacing = pitch - groove width) to avoid overlapping groove

// TODO: check that pitch is greater than groove width

spool_inner_circumference = TAU * spool_inner_radius;
spool_single_wrap_length = sqrt((pitch*pitch) + (spool_inner_circumference*spool_inner_circumference));
spool_length = pitch * ceil(cable_length / spool_single_wrap_length);
spool_endcap_radius = spool_inner_radius + spool_groove_width + spool_groove_depth;
spool_endcap_height = pitch;

geartooth_depth = 2;


    // ------------------------------------------------------------
    // spool
    
        // main cylinder
        
        // main thread
        
    // ------------------------------------------------------------
    // end caps

        // main cylinder

        // spokes
        
        // hub

        // worm thread

    // ------------------------------------------------------------
    // fluid assembly
    
        // pump
        
            // motor mount
    
        // reservoir
    
        // spool hub
        
        // spool nipple
        
        // hub nipple
        
        // shaft sleeve
        
        // shaft nipple
        
        // bearing
        
        // bearing mount
        
        
    // ------------------------------------------------------------
    // square shaft
    
        // motor mount
        
        // coupling
        
        // bearing mounts
        
        // bearings


    // ------------------------------------------------------------
    // bearing assembly
    
        // bearings
        
        // screws
        
        // nuts
        
        // bracket


// --------------------------------------------------------------
// rack gear

    // plate
    
    // support structure
    
    // teeth

    // mounts

// --------------------------------------------------------------
// redirect pulley assembly (redirect from spool)

    // pulley
    pully_width = 5;
    pully_wall_thickness = 2;

    // bracket
    
    // ball bearing
    bearing_inner_diameter = 3;
    bearing_outer_diameter = 10;
    bearing_width = 4;
    bearing_color = [0,1,1];
 
    color(bearing_color) ball_bearing(id = bearing_inner_diameter, od = bearing_outer_diameter, width = bearing_width);

    // shaft
    
    // optical endstop
    
// --------------------------------------------------------------
// Case

    // Nema motor mount
    
    // shaft bearing mounts
    
    // rack mount
    
    // redirect pulley mount
    
// --------------------------------------------------------------
// swivel pulley assembly (redirect from top of frame)

module arc(r = 1, sa = 0, ea = 360, x_offset = 0, y_offset = 0, $fn = 60){
    sweep = ea - sa;
    step_angle = sweep / $fn;
    points = [];
    for (a = [sa : step_angle : ea]){
        x = r * cos(a) + x_offfset;
        y = r * sin(a) + y_offfset;
        points = concat(points, [[x, y]]);
    }
}
