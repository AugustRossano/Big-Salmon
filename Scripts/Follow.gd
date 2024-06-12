#Makes object move towards another object(Enemy->Player)
extends Node3D

# Variables to store the target object and speed
var target : Node3D
var speed : float = 10

func _process(delta):
	# Check if the target is valid
	print(get_meta("heat"))
	if (get_meta("heat")>get_meta("headCapacity")):
		queue_free()
	if target:
		# Calculate the direction towards the target
		var direction = (target.global_position - global_position).normalized()
	   
		# Move towards the target
		global_position += direction * speed * delta
		
	else:
		print("No target set!")
		target=$"../../SalmonDad/Mid"
		
# Function to set the target object

