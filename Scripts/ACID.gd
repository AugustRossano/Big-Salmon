extends Node
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func acidModeToggle(trippy:bool):
	Environment.adjustment_enabled=trippy
