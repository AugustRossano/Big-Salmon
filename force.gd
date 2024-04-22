extends RigidBody3D
var holder: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func _input(event):
   # Mouse in viewport coordinates.
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		holder=((event.position*2)-Vector2(get_viewport().size))/Vector2(get_viewport().size)
		holder.x=holder.x*27
		holder.y=-holder.y*15
		if holder.length()>30:
			holder = holder.normalized()*30
		linear_velocity+=(position-Vector3(holder.x,holder.y,0)).normalized()*50/(position-Vector3(holder.x,holder.y,0)).length()
