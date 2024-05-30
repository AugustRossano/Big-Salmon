extends RayCast3D
var head: RigidBody3D
var laser: GPUParticles3D
var impact: GPUParticles3D
var point: Vector3
var time: float
var light = preload("res://lingeringLight.tscn")
var victim: Node3D
#var debug: MeshInstance3D
# Called when the node enters the scene tree for the first time.
func _ready():
	laser = $"../GPUParticles3D"
	impact = $"../GPUParticles3D3"
	head = $"../.."
	#debug = $"../../../../MeshInstance3D"
	pass # Replace with function body.
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position=head.position
	rotation=head.rotation
	force_raycast_update()
	if(is_colliding()):
		point = get_collision_point()
		laser.lifetime=((position-point).length()/18)
		impact.position = get_collision_point()
		impact.rotation=rotation
		#debug.position = get_collision_point()
		impact.emitting = true
		victim = get_collider()
		if(victim.get_class()=="RigidBody3D"):
			if victim.has_meta("heat"):
				victim.set_meta("heat",victim.get_meta("heat")+delta)
			victim.apply_impulse(($"../GPUParticles3D".global_position-$"..".global_position),impact.global_position)
		if(randi_range(0,0)==0):
			var lightInstance = light.instantiate()
			
			
			victim.add_child(lightInstance,false,1)
			lightInstance.global_position = impact.global_position
			lightInstance.look_at((get_collision_normal()),Vector3.DOWN)
			
	else:
		laser.lifetime=2
		#debug.position = Vector3(0,0,0)
		impact.emitting = false
	pass
