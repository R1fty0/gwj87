extends Node


@export var world_environment: WorldEnvironment
## Which view will be active when the game starts. 
@export var active_view_on_load: ActiveView

@export_category("Cameras")
@export var spaceport_camera: Camera3D
@export var planet_camera: Camera3D

@export_category("Environments")
@export var spaceport_environment: Environment
@export var planet_environment: Environment


enum ActiveView
{
	SPACEPORT,
	PLANET
}

var current_view: ActiveView = ActiveView.SPACEPORT

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("change_view"):
		SignalBus.change_view.emit()
		#_change_view()

func _change_view(new_camera: Camera3D, new_world_env: Environment):
	# Switch from spaceport to planet
	if current_view == ActiveView.SPACEPORT:
		# Switch the camera perspective 
		spaceport_camera.current = false
		planet_camera.current = true
		# Switch the world environment 
		world_environment.environment = planet_environment
		# Switch the lights 
		var planet_lights = get_tree().get_nodes_in_group("planet_lights")
		for light in planet_lights:
			light.enabled = true
		# Switch the meshes
		var planet_meshes = get_tree().get_nodes_in_group("planet_meshes")
		for mesh in planet_meshes:
			mesh.visible = false
		current_view = ActiveView.PLANET
	# Switch from planet to spaceport
	elif current_view == ActiveView.PLANET:
		spaceport_camera.current = true
		planet_camera.current = false
		world_environment.environment = spaceport_environment
		var spaceport_lights = get_tree().get_nodes_in_group("spaceport_lights")
		for light in spaceport_lights:
			light.enabled = true
		current_view = ActiveView.SPACEPORT
