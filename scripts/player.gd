extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D
@export var joystick:CustomVirtualJoystick
var friction = 0.2
@export var player_stats:PlayerStats

func _ready():
	animated_sprite_2d.play("default")
	
func _process(delta: float) -> void:
	velocity=joystick.output * player_stats.move_speed
	move_and_slide()
	self.look_at(self.position + joystick.output) #Movement vektör ile rotation takibi
	
	if joystick.is_pressed == false:
		joystick.output = joystick.output.move_toward(Vector2.ZERO, friction * delta * player_stats.move_speed) #inertia???, olmadı.

	if joystick.output.x < 0:
		$Player.flip_h
