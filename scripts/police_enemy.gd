extends Area2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var player_position:=Vector2.ZERO
@export var move_speed:float
@export var range_to_start_following:float
@export var enemy_max_health:int
var enemy_current_health:int
var damage_pushback:=Vector2(15,15)
var is_moving:bool=true
var invincibilty_time:float=0.3

func _ready():
	animated_sprite_2d.play("default")
	Signals.connect("get_position",Callable(self,"_get_position"))
	enemy_current_health=enemy_max_health

func _get_position(player_position_data:Vector2):
	player_position=player_position_data

func _process(delta):
	follow_player(delta)

func follow_player(delta):
	if abs(player_position.x-global_position.x)>range_to_start_following:
		global_position.x=move_toward(global_position.x,player_position.x,delta*move_speed)
	else:
		pass

func apply_damage(damage_amount:float,direction:Vector2):
	if monitoring:
		printerr(enemy_current_health)
		modulate=Color(1,1,1,0.3)
		enemy_current_health-=damage_amount
		if(enemy_current_health<=0):
			queue_free()
		position+=direction*damage_pushback
		monitoring=false
		is_moving=false
		await get_tree().create_timer(invincibilty_time).timeout
		monitoring=true
		modulate=Color(1,1,1,1)
		is_moving=true
