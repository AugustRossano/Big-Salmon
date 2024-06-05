extends Node3D
var Samuel = preload("res://samuel_probe.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(randi_range(0,100)<0):
		var Samuel_instance = Samuel.instantiate()
		$".".add_child(Samuel_instance)
	pass
