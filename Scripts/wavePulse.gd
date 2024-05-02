extends GPUParticles3D
var wave : Curve
var time : float
var height: float
# Called when the node enters the scene tree for the first time.
func _ready():
	wave = preload("res://new_curve_texture.tres").curve
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	wave.set_point_offset(1,time)
	wave.set_point_value(1,height)
	time+=delta*3
	if(time>1):
		time=0
	height=min(((time*2)+1),1.5,((-2*time)+3))
	#mat.scale_curve = curve
	pass
