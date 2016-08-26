module ball_bearing( id = 3, od = 10, width = 4, lip = 1, lip_depth = 0.2, $fn = 30){
    ir = id * 0.5;
    or = od * 0.5;
    hw = width * 0.5;

    rotate_extrude($fn=200){
        polygon( points = [
            [ ir, -hw],
            [ ir + lip, -hw],
            [ ir + lip, -(hw-lip_depth)],
            [ or - lip, -(hw-lip_depth)],
            [ or - lip, -hw],
            [ or, -hw],
            [ or, hw],
            [ or - lip, hw],
            [ or - lip, (hw-lip_depth)],
            [ ir + lip, (hw-lip_depth)],
            [ ir + lip, hw],
            [ ir, hw]
        ]);
    };
}

ball_bearing();
