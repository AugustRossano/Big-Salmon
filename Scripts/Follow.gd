#Makes object move towards another object(Enemy->Player)
extends Node3D

# Variables to store the target object and speed
var target : Node3D
var speed : float = 100

func _process(delta):
	# Check if the target is valid
	if target:
		# Calculate the direction towards the target
		var direction = (target.global_position - global_position).normalized()
	   
		# Move towards the target
		global_position += direction * speed * delta
	else:
		print("No target set!")

# Function to set the target object
func set_target(new_target : Node3D):
	target = new_target
