extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D

@export var player_stats:PlayerStats

func _ready():
	animated_sprite_2d.play("default")
func _process(delta: float) -> void:
	velocity.x = Input.get_axis("ui_left", "ui_right") * player_stats.move_speed
	velocity.y = Input.get_axis("ui_up", "ui_down") * player_stats.move_speed
	move_and_slide()
