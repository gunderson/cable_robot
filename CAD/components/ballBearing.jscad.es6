function ballBearing(
	id = 3,
	od = 10,
	width = 4,
	lip = 1,
	lipDepth = 0.2,
	$fn = 30
) {
	let ir = id * 0.5;
	let or = od * 0.5;
	let hw = width * 0.5;

	return CSG.rotate_extrude( {fn: 200},
		CSG.polygon( {points: [
			[ ir, -hw ],
			[ ir + lip, -hw ],
			[ ir + lip, -( hw - lipDepth ) ],
			[ or - lip, -( hw - lipDepth ) ],
			[ or - lip, -hw ],
			[ or, -hw ],
			[ or, hw ],
			[ or - lip, hw ],
			[ or - lip, ( hw - lipDepth ) ],
			[ ir + lip, ( hw - lipDepth ) ],
			[ ir + lip, hw ],
			[ ir, hw ]
		]} )
	);
}

module.exports = { ballBearing };
