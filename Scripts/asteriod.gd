extends RigidBody3D
var asteriod = preload("res://meteor.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if (get_meta("heat")>get_meta("heatCapacity")):
			if(get_meta("heatCapacity")<0.3):
				free()
			else:
				
				
				#
				#
				var randomOffset = randi_range(0,90)
				for n in 4:
					var asteriodInstance = asteriod.instantiate()
					print(asteriodInstance.get_meta_list())
					asteriodInstance.set_meta("heatCapacity",get_meta("heatCapacity")/2)
					asteriodInstance.scale = Vector3(get_meta("heatCapacity"),get_meta("heatCapacity"),get_meta("heatCapacity"))
					
					$"..".add_child(asteriodInstance)
					asteriodInstance.global_position = global_position
					#asteriodInstance.velocity=Vector3(cos(deg_to_rad(90*n+randomOffset)),0,-sin(deg_to_rad(90*n+randomOffset)))*4
				queue_free()
				
		
		
	pass
