extends Node

## Reference to the world environment 
@export var world_environment: WorldEnvironment
@export var starting_view: View

@export_category("Visual Controllers")
@export var spaceport: VisualController
@export var planet: VisualController


enum View
{
	SPACEPORT,
	PLANET
}

var active_view: View = View.SPACEPORT

func _ready() -> void:
	pass

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("change_view"):
		SignalBus.change_view.emit()
		# Swtich to the planet view. 
		if active_view == View.SPACEPORT:
			spaceport.disable_view()
			spaceport.enable_view(world_environment)
			active_view = View.PLANET
		# Switch to the spaceport view. 
		elif active_view == View.PLANET:
			planet.disable_view()
			spaceport.enable_view(world_environment)
			active_view = View.SPACEPORT
	
