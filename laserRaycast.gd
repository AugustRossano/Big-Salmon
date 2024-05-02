extends RayCast3D
var laser: GPUParticles3D
var impact: GPUParticles3D
var point: Vector3
var time: float
# Called when the node enters the scene tree for the first time.
func _ready():
	laser = $"../GPUParticles3D"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	force_raycast_update()
	if(is_colliding()):
		point = get_collision_point()
		laser.lifetime=((position-point).length()/25)
	else:
		laser.lifetime=2
	pass
