extends NodeState

@export var player: Player
@export var animated_sprite_2d: AnimatedSprite2D

var player_direction: Vector2

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	player_direction = player.direction

	if player_direction == Vector2.UP:
		animated_sprite_2d.play('idle_back')
	elif player_direction == Vector2.DOWN:
		animated_sprite_2d.play('idle_front')
	elif player_direction == Vector2.LEFT:
		animated_sprite_2d.play('idle_left')
	elif player_direction == Vector2.RIGHT:
		animated_sprite_2d.play('idle_right')
	else:
		animated_sprite_2d.play('idle_front')

func _on_next_transitions() -> void:
	GameInputEvents.movement_input()
	
	if GameInputEvents.is_movement_input():
		transition.emit("Walk")

	if GameInputEvents.is_using_tool():
		if player.current_tool == DataTypes.Tools.Axe:
			transition.emit("Chopping")
		elif player.current_tool == DataTypes.Tools.Hoe:
			transition.emit("Tilling")
		elif player.current_tool == DataTypes.Tools.WaterCan:
			transition.emit("Watering")
		
func _on_enter() -> void:
	pass


func _on_exit() -> void:
	animated_sprite_2d.stop()
