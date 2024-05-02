extends RigidBody3D
var holder: Vector2
var cam: Camera3D

func _ready():
	cam = $"../../Camera3D"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var mousepos = get_viewport().get_mouse_position()
		var query = cam.project_position(mousepos,42)
		query.z=0
		query = (position-query).normalized()*42/(position-query).length_squared()
		if(query.length_squared()>1764):
			query=query.normalized()*42
		apply_central_impulse(query)
		
