module pulley_bracket(shaft_radius=1.5, bearing_width=3, pulley_width=5, pulley_radius=20, side_clearance=2, base_clearance=5, wall_thickness=2, base_width=10, $fn=20){
	// face
	face_displacement = wall_thickness * 0.5 + pulley_width * 0.5 + side_clearance;
	spacer_height = face_displacement - bearing_width;
	difference(){
		union(){
			// face 0
			hull(){
				translate([0,0,-face_displacement])
					cylinder(r=pulley_radius, h=wall_thickness, center=true);
				translate([pulley_radius + base_clearance, 0, -face_displacement])
					cube([wall_thickness, pulley_radius * 2, wall_thickness], true);
			}

			// face 1
			hull(){
				translate([0,0,face_displacement])
					cylinder(r=pulley_radius, h=wall_thickness, center=true);

				translate([pulley_radius + base_clearance, 0, face_displacement])
					cube([wall_thickness, pulley_radius * 2, wall_thickness], true);
			}

			// base
			//
			translate([pulley_radius + base_clearance, 0, 0])
				cube([wall_thickness, pulley_radius * 2, side_clearance * 2 + pulley_width + (wall_thickness + base_width) * 2], true);
			// spacers
			difference(){
				cylinder(r=shaft_radius + wall_thickness, h=side_clearance * 2 + pulley_width, center=true, $fn=$fn);
				cube([(shaft_radius + wall_thickness) * 2, (shaft_radius + wall_thickness) * 2, bearing_width], center=true);
			}
		};
		cylinder(r=shaft_radius, h=1 + side_clearance * 2 + pulley_width + wall_thickness * 2, center=true, $fn=$fn);
	}
}
pulley_bracket();
