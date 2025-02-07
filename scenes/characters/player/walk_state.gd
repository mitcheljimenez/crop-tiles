extends NodeState

@export var player: Player
@export var animated_sprite_2d: AnimatedSprite2D
@export var SPEED: int = 50

var direction: Vector2

func _on_process(_delta : float) -> void:
    pass


func _on_physics_process(_delta : float) -> void:
    direction = GameInputEvents.movement_input()

    if direction == Vector2.UP:
        animated_sprite_2d.play('walk_back')
    elif direction == Vector2.DOWN:
        animated_sprite_2d.play('walk_front')
    elif direction == Vector2.LEFT:
        animated_sprite_2d.play('walk_left')
    elif direction == Vector2.RIGHT:
        animated_sprite_2d.play('walk_right')

    if direction != Vector2.ZERO:
        player.direction = direction

    player.velocity = direction * SPEED
    player.move_and_slide()


func _on_next_transitions() -> void:
    if not GameInputEvents.is_movement_input():
        transition.emit("Idle")


func _on_enter() -> void:
    pass


func _on_exit() -> void:
    animated_sprite_2d.stop()
