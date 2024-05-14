extends OmniLight3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	light_energy-=delta/3
	if(light_energy<=0):
		free()
	pass
