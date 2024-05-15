extends RigidBody3D
var asteriod = load("res://meteor.tscn")
var materialChanger:MeshInstance3D
#var materialCopy:StandardMaterial3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	materialChanger=get_child(0,false)
	#materialCopy=materialChanger.get_surface_override_material(0)
	#materialChanger.set_surface_override_material(0,materialCopy)
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	materialChanger.get_surface_override_material(0).emission_energy_multiplier=get_meta("heat")/(get_meta("heatCapacity")*2)
	if (get_meta("heat")>get_meta("heatCapacity")):
		if(get_meta("heatCapacity")<0.5):
			free()
		else:
			
			
			#
			#
			var randomOffset = randi_range(0,90)
			for n in 4:
				var asteriodInstance = asteriod.instantiate()
				
				asteriodInstance.set_meta("heatCapacity",get_meta("heatCapacity")/2)
				asteriodInstance.get_child(0,false).scale = Vector3(get_meta("heatCapacity"),get_meta("heatCapacity"),get_meta("heatCapacity"))
				asteriodInstance.get_child(1,false).scale = Vector3(get_meta("heatCapacity"),get_meta("heatCapacity"),get_meta("heatCapacity"))/3
				asteriodInstance.mass = mass/4
				
				$"..".add_child(asteriodInstance)
				asteriodInstance.global_position = global_position
				asteriodInstance.position+=Vector3(cos(deg_to_rad(90*n+randomOffset)),-sin(deg_to_rad(90*n+randomOffset)),0)*get_child(0,false).scale.x*0.75
				asteriodInstance.linear_velocity=asteriodInstance.position-position
				asteriodInstance.linear_velocity+=linear_velocity/2
				asteriodInstance.angular_velocity=Vector3(randf_range(0,2),randf_range(0,2),randf_range(0,2))
				
			queue_free()
				
		
		
	#set_meta("heat",get_meta("heat")-(delta/10))
