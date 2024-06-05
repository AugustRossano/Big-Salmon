extends GPUParticles3D
var counter:float

# Called when the node enters the scene tree for the first time.
func _ready():
	emitting=true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	counter+=delta
	if (counter>lifetime):
		queue_free()
	pass
