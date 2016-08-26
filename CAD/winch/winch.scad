use <../components/ball_bearing.scad>;
use <../components/pulley_wheel.scad>;
use <../components/pulley_bracket.scad>;

// default measurements are in mm, but should theoretically work proportionally for imperial scale as well

TAU = 2 * PI;


// --------------------------------------------------------------
// global characteristics

wall_thickness = 2;

// --------------------------------------------------------------
// cable characteristics

cable_length = 500; // distance from spool to pulley + 0.25 * pulley circumference + top pulley angle + diagonal length - carriage corner distance from center
cable_min_bend_radius = 15;
cable_radius = 1.7;
cable_diameter = cable_radius * 2;

// --------------------------------------------------------------
// spool assembly

spool_inner_radius = cable_min_bend_radius; // affects torque
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
	/*rotate([90, 0, 0]){*/
	rotate([0, 0, 0]){
		difference(){
			// main cylinder
			cylinder(r=spool_inner_radius, h=spool_length, center=true);

			// main thread



			// center hole
			cylinder(r=spool_inner_radius - wall_thickness, h=spool_length + wall_thickness, center=true);
		}

	// ------------------------------------------------------------
	// end caps

		cap_width = wall_thickness * 2;

		difference(){
			union(){

				// cap base
				translate([0, 0, spool_length * 0.5 + cap_width * 0.5]){
					cylinder(r=spool_inner_radius + wall_thickness, h=cap_width, center=true);
				}

				translate([0, 0, -spool_length * 0.5 - cap_width * 0.5]){
					cylinder(r=spool_inner_radius + wall_thickness, h=cap_width, center=true);
				}

			}
			// center hole
			cylinder(r=spool_inner_radius - wall_thickness, h=spool_length + wall_thickness + cap_width * 2, center=true);
		}

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
	}


// --------------------------------------------------------------
// rack gear

	// plate

	// support structure

	// teeth

	// mounts

// --------------------------------------------------------------
// redirect pulley assembly (redirect from spool)

 	pulley_radius = spool_inner_radius;

	translate([150, 0 , pulley_radius + cable_radius]){
		rotate([90, 0, 0]){

			// pulley
			pully_wall_thickness = 2;
			pully_width = cable_diameter + pully_wall_thickness * 2;
			pulley_wheel(wall_thickness = pully_wall_thickness, cradle_radius = cable_diameter * 0.5);

			// bracket
			pulley_bracket();
			// ball bearing
			bearing_inner_diameter = 3;
			bearing_outer_diameter = 10;
			bearing_width = 4;
			bearing_color = [0,1,1];

			*color(bearing_color) ball_bearing(id = bearing_inner_diameter, od = bearing_outer_diameter, width = bearing_width);

			// shaft
			*cylinder(r=1.5, h=pully_width + 14, $fn=20, center=true);

			// optical endstop

		}
	}
// --------------------------------------------------------------
// Case

	// Nema motor mount

	// shaft bearing mounts

	// rack mount

	// redirect pulley mount

// --------------------------------------------------------------
// swivel pulley assembly (redirect from top of frame)
