extends Node

func _ready():
	# Get references to Object1 and Object2
	var object1 = $Object1
	var object2 = $Object2
   
	# Set Object2 as the target for Object1
	object1.set_target(object2)
