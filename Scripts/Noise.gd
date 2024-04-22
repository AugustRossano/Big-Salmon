extends Sprite3D

var salmonPos: Vector3
var stars = NoiseTexture2D
var noise = FastNoiseLite

# Called when the node enters the scene tree for the first time.
func _ready():
	stars = load("res://starNoise.tres")
	noise = stars.noise
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	salmonPos =  $"/root/Node3D/SalmonDad/Mid".position
	
	noise.offset=Vector3(salmonPos.x*10,-salmonPos.y*10,noise.offset.z+(delta*10))
	position.x=salmonPos.x
	position.y=salmonPos.y
	#self.texture.set_shader_param("noise_img/noise/offset:x", time)
	
