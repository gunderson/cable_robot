
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
