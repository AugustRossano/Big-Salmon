extends RigidBody3D
var target: Node3D
var rb: RigidBody3D
# Called when the node enters the scene tree for the first time.
func _ready():
	target=$"../../SalmonDad/Mid"

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	apply_central_force((target.position-position-linear_velocity).normalized()*1000*delta)

	pass
