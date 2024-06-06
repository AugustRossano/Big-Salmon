 #Reference to the SalmonHealth script
@export var health: SalmonHealth

# Damage amount to apply on collision
@export var collision_damage: int = 10

# Called when the node enters the scene tree for the first time
func _ready():
	# Ensure the health script is assigned
	if health == null:
		health = $SalmonHealth

# Handle collisions
func _physics_process(delta):
	var collision = move_and_collide(Vector2.ZERO) # Replace with actual movement code
	if collision:
		on_collision(collision.collider)

# Function to handle collision logic
func on_collision(collider):
	# Check if the collider should cause damage (e.g., an enemy or hazard)
	if collider.is_in_group("enemy") or collider.is_in_group("hazard"):
		health.decrease_health(collision_damage)
