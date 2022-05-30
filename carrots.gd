extends Spatial

func sprout():
	if transform.origin.y < 0:
		translate(Vector3(0,0.01,0))
