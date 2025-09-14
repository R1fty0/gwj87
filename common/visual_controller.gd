extends Node
class_name VisualController


@export var camera: Camera3D
@export var env_resource: Environment
## Is this scene the spaceport or the planet 
@export var scene_type: SceneType = SceneType.PLANET

enum SceneType
{
	SPACEPORT,
	PLANET
}

var mesh_group_name: StringName
var lighting_group_name: StringName

func _ready() -> void:
	if scene_type == SceneType.PLANET:
		mesh_group_name = "planet_meshes"
		lighting_group_name = "planet_lighting"
	if scene_type == SceneType.SPACEPORT:
		mesh_group_name = "spaceport_meshes"
		lighting_group_name = "spaceport_lighting"

func disable_view():
	var lights = get_tree().get_nodes_in_group(lighting_group_name)
	# Hide lights
	for light in lights:
		light.visible = false
	# Hide meshes
	var meshes = get_tree().get_nodes_in_group(mesh_group_name)
	for mesh in meshes:
		mesh.visible = false
	
func enable_view(world_env: WorldEnvironment):
	camera.current = true
	world_env.environment = env_resource
	# Show lights
	var lights = get_tree().get_nodes_in_group(lighting_group_name)
	for light in lights:
		light.visible = true
	# Show meshes
	var meshes = get_tree().get_nodes_in_group(mesh_group_name)
	for mesh in meshes:
		mesh.visible = true
