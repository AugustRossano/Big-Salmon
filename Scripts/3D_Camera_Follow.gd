extends Camera3D

# The object the camera will follow
var target  

# Camera's offset from the target
#var offset : Vector3 = Vector3(0, 5, -10)

func _ready(): 
	# Set the initial position of the camera
	set_camera_position()

func _process(delta):
		# Update the position of the camera every frame
	set_camera_position()
	

func set_camera_position():

	# Set the camera position to be the target's position plus the offset
	position.x = $"root/Node3D/SalmonDad/Mid".position.x
	global_transform.origin = target.global_transform.origin
