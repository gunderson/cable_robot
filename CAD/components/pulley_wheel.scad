// TODO: make pulley interior a rounded bed
// TODO: smooth pulley corners
// TODO: create spoke system

module pulley_wheel( ir = 5, or = 15, width = 4, wall_thickness = 2, cradle_radius = 3, cradle_height = 2, $fn = 30){
    hw = (cradle_radius + wall_thickness);
	cradle_height = cradle_radius + cradle_height;
    rotate_extrude($fn=$fn){
        polygon( points = [
            [ ir, -hw],
            [ ir + wall_thickness, -hw],
            [ ir + wall_thickness, -(hw - wall_thickness)],
            [ or - wall_thickness, -(hw - wall_thickness)],
            [ or - wall_thickness, -hw],
            [ or + cradle_height, -hw],
			// cradle
            [ or + cradle_height, -(hw - wall_thickness)],
			[ or + cradle_radius, -cradle_radius],
			[ or + cradle_radius * 0.33, -cradle_radius * 0.66],
			[ or, 0],
			[ or, 0],
			[ or + cradle_radius * 0.33, cradle_radius * 0.66],
			[ or + cradle_radius, cradle_radius],
			[ or + cradle_height, (hw - wall_thickness)],

			[ or + cradle_height, hw],
            [ or - wall_thickness, hw],
            [ or - wall_thickness, (hw - wall_thickness)],
            [ ir + wall_thickness, (hw - wall_thickness)],
            [ ir + wall_thickness, hw],
            [ ir, hw]
        ]);
    };
}

pulley_wheel();
