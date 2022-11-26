extends Line2D

export var length = 100
var point

func _ready():
	set_as_toplevel(true)
	
func _physics_process(delta):
	point = get_parent().global_position
	while point.y < 990:
		point.y	= point.y + 50
		add_point(point)	
	
	if points.size() > length:
		remove_point(0)
