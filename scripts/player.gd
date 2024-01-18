extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var beak = $BodyParts/Beak
@onready var wings = $BodyParts/Wings
@onready var tail = $BodyParts/Tail

@export var joystick:CustomVirtualJoystick
var friction = 2
@export var player_stats:PlayerStats

var player_body_parts=preload("res://scripts/player_body_parts.gd")

func _ready():
	animated_sprite_2d.play("default")
	### ÖRNEK: beak.texture=player_body_parts.beak_sprites[player_stats.beak_sprite_index]
func _process(delta: float) -> void:
	animation_control()
	look_at(position + joystick.output) #Movement vektör ile rotation takibi
	slow_down_inertia(delta)
	move_player(delta)



func animation_control() -> void:
	if velocity.x==0:
		animated_sprite_2d.flip_v
	elif velocity.x < 0:
		animated_sprite_2d.flip_v=true
	else:
		animated_sprite_2d.flip_v=false

func slow_down_inertia(delta)-> void:
	if joystick.is_pressed:return
	velocity.x = move_toward(velocity.x,0,friction*delta*player_stats.move_speed) 
	velocity.y = move_toward(velocity.y,0,friction*delta*player_stats.move_speed)
	move_and_slide()

func move_player(delta):
	if !joystick.is_pressed:return
	velocity=joystick.output * player_stats.move_speed
	move_and_slide()
