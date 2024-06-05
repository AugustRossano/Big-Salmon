extends Node

# Declare health variables
@export var max_health: int = 100
var current_health: int

# Signal to notify when health changes
signal health_changed(new_health)

# Called when the node enters the scene tree for the first time
func _ready():
	# Initialize the player's health
	current_health = max_health

# Function to decrease health
func decrease_health(amount: int):
	current_health -= amount
	# Ensure health doesn't go below zero
	if current_health < 0:
		current_health = 0
	# Emit the health changed signal
	emit_signal("health_changed", current_health)
	# Check if the player is dead
	if current_health == 0:
		_on_death()

# Function to increase health
func increase_health(amount: int):
	current_health += amount
	# Ensure health doesn't exceed max health
	if current_health > max_health:
		current_health = max_health
	# Emit the health changed signal
	emit_signal("health_changed", current_health)

# Function to handle player's death
func _on_death():
	print("Player has died :3")
	# Add death logic here (e.g., respawn, game over screen, etc.)

# Function to reset health to maximum
func reset_health():
	current_health = max_health
	emit_signal("health_changed", current_health)
