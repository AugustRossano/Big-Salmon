#Auth: Vincent Hayes
#LED: 5/13/24
#Desc: Spawns projectiles(towards player) from enemy when within x range from player
extends Node2D

# The object that will spawn projectiles
var projectileSpawner : Area2D

# The object that will be targeted by projectiles
var target : Area2D

# The radius within which the projectile spawner detects the target
var detectionRadius : float = 200

# The projectile to spawn
var projectilePrefab : PackedScene

func _ready():
	# Connect the 'body_entered' signal of the projectile spawner to a function
	projectileSpawner.connect("body_entered", self, "_on_ProjectileSpawner_body_entered")

func _process(delta):
	# Check if the target is within the detection radius
	if projectileSpawner.global_position.distance_to(target.global_position) < detectionRadius:
		spawnProjectile()

func spawnProjectile():
	# Instantiate the projectile prefab
	var projectile = projectilePrefab.instance()

	# Set its initial position and direction
	projectile.global_position = projectileSpawner.global_position
	projectile.direction = (target.global_position - projectile.global_position).normalized()

	# Add it to the scene
	get_parent().add_child(projectile)

func _on_ProjectileSpawner_body_entered(body):
	# Check if the body entered is the target
	if body == target:
		spawnProjectile()
