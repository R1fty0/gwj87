extends Node
class_name OrbitController

@export var orbit_velocity: float = 10.0
## How far the spaceship is above the planet's surface
@export var orbital_height: float = 10.0


# Get orbit pivot from planet
# Set orbit controller position at orbit pivot
# Rotate orbit pivot with ship at offset at given speed

func _process(delta):
	pass
	# Rotate the ship around the planet. 
	#rotate_y(deg_to_rad(orbit_speed * delta))
	
