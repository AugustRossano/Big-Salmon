extends Decal


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x+=delta*15
	if (position.x>34):
		position.x=-6
	pass
