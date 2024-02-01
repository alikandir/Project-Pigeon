extends Area2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var player_position:=Vector2.ZERO
@export var move_speed:float
@export var range_to_start_following:float
@export var police_max_health:int
var police_current_health:int
var damage_pushback:=Vector2(15,15)
var is_moving:bool=true
var invincibilty_time:float=0.3
@onready var police_health_bar = $Health

func _ready():
	animated_sprite_2d.play("default")
	Signals.connect("get_position",Callable(self,"_get_position"))
	police_current_health = police_max_health

func _get_position(player_position_data:Vector2):
	player_position=player_position_data

func _process(delta):
	follow_player(delta)
	
func _physics_process(delta):
	bar_update()

func follow_player(delta):
	if abs(player_position.x-global_position.x)>range_to_start_following:
		global_position.x=move_toward(global_position.x,player_position.x,delta*move_speed)
	else:
		pass

func bar_update():
	police_health_bar.value = police_current_health
	police_health_bar.max_value = police_max_health
	
	if police_current_health >= police_max_health:
		police_health_bar.visible = false
	else:
		police_health_bar.visible = true
	
	
func apply_damage(damage_amount:float,direction:Vector2):
	if monitoring:
		printerr(police_current_health)
		modulate=Color(1,1,1,0.3)
		police_current_health-=damage_amount
		if(police_current_health<=0):
			queue_free()
		position+=direction*damage_pushback
		monitoring=false
		is_moving=false
		await get_tree().create_timer(invincibilty_time).timeout
		monitoring=true
		modulate=Color(1,1,1,1)
		is_moving=true
