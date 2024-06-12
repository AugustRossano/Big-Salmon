extends Node3D
var Samuel = preload("res://samuel_probe.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for n in 8:
		var angle = randf_range ( 0, 6.283 )
		var Samuel_instance = Samuel.instantiate()
		$".".add_child(Samuel_instance)
		Samuel_instance.position = Vector3(cos(angle)*30,sin(angle)*30,0)+position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(randi_range(0,100)<0):
		var Samuel_instance = Samuel.instantiate()
		$".".add_child(Samuel_instance)
	pass
