use <../helpers/maths.scad>
function select(vector,indices) = [ for (index = indices) vector[index] ];
function helix_path_points(radius=5, pitch=1, height=1, fn=20, start_angle=0) = [
	for  (i = [0 : 1 : fn * height / pitch]) [
		radius * cos(start_angle + i * 360/fn),
		radius * sin(start_angle + i * 360/fn),
		i * pitch / fn
	]
];

function get_x_angle(a,b) = let(d=b-a) atan2(d[2], VLEN(d));
function get_z_angle(a,b) = let(d=b-a) atan2(d[1], d[0]);
function get_deltas(points) = [for (i = [0 : len(points) - 2]) points[i+1]-points[i]];
function get_euler(points) = [for (i = [0 : len(points) - 2]) let (a=points[i], b=points[i+1]) [get_x_angle(a, b),0,get_z_angle(a, b)]-[90,90,90]];

function get_transform(point, euler) = mat4_mult_mat4( transform_rotx(euler[0]),
									mat4_mult_mat4(transform_rotz(euler[2]), transform_translate(point)
								)
							);
function get_transforms(points, eulers) = [
	for (i = [0 : len(points) - 1])
		/*transform_translate(points[i])*/
		get_transform(points[i], eulers[i])
];

function regular_polygon_points(sides=4, radius=1, inscribed=true) = [
	for (i=[0:sides-1])
		[
			-radius * cos((i*360 / sides) - (180/sides)),
			-radius * sin((i*360 / sides) - (180/sides))
		]
];

function vec_extend(v, length=3, filler=0) = concat(
	v,
	[for (i=[len(v):length - 1]) filler]
);
function mat_vec_extend(m, length=3, filler=0) = [
	for (i=[0:len(m)-1])
		vec_extend(m[i], length, filler)
];

function faciate(verticies) = let (num_verts = len(verticies), num_face_verts = num_verts / 2, last_v_i = num_verts-1, f0 = [for (i=[0:num_face_verts-1]) i], f1 = [for (i=[num_face_verts:len(verticies)-1]) i])
	concat(
		[
			for (i=[0:1:num_face_verts-1])
				[
					(0 + i) % num_face_verts,
					(1 + i) % num_face_verts,
					num_face_verts + ((1 + i) % num_face_verts),
					num_face_verts + (i % num_face_verts)
				]
		],
		[f0],
		[f1]
	);

module corkscrew(thickness=0.5, radius=5, height=20, pitch=4, fn=60){
	// square profile
	/*square_profile = [[thickness,thickness*2.15,0],[thickness,-thickness*2.15,0],[-thickness,-thickness,0],[-thickness,thickness,0]];*/
	/*square_profile = mat_vec_extend([[thickness,thickness],[thickness,-thickness],[-thickness,-thickness],[-thickness,thickness]], 3, 0);*/
	square_profile = mat_vec_extend(regular_polygon_points(sides=12, radius=thickness), 3, 0);
	points = helix_path_points(radius = radius, height = height, pitch = pitch, fn=fn, start_angle=0);
	// euler angles are only generated for points that have a following point. Add an artificial euler for the last point in series
	eulers = concat(get_euler(points), [[-90,0,0]]);
	transforms = get_transforms(points, eulers);
	verticies = [for (i=[0:len(transforms)-1])
		[for (j=[0:len(square_profile) - 1]) select(vec4_mult_mat4(concat(square_profile[j],1), transforms[i]), [0,1,2])]
	];
	union(){
		for (i=[0:len(verticies)-2]){
			v = concat(verticies[i], verticies[i+1]);
			f = faciate(v);
			polyhedron(points=v, faces=f);
		}
	}
}
corkscrew();
