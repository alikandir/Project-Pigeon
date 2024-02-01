extends Area2D
class_name Enemy
@export var direction:int
@export var speed:float

var enemy_max_health = 20
var enemy_current_health = enemy_max_health
var damage_pushback:=Vector2(15,15)
var invincibilty_time:float=0.3
const enemy_damage = 5
@onready var healthbar = $healthbar

var is_moving:bool=true

func _process(delta):
	move(delta)

func _physics_process(delta):
	update_enemy_health()

func apply_damage(damage_amount:float,direction:Vector2):
	if monitoring:
		modulate=Color(1,1,1,0.3)
		enemy_current_health-=damage_amount
		if(enemy_current_health<=0):
			Signals.enemy_death.emit()
			queue_free()
		position+=direction*damage_pushback
		monitoring=false
		is_moving=false
		await get_tree().create_timer(invincibilty_time).timeout
		monitoring=true
		modulate=Color(1,1,1,1)
		is_moving=true

func move(delta):
	if is_moving:
		position.x+=speed*direction*delta

func update_enemy_health():
	healthbar.value = enemy_current_health
	healthbar.max_value = enemy_max_health
	
	if enemy_current_health >= enemy_max_health:
		healthbar.visible = false
	else:
		healthbar.visible = true

func _on_body_entered(body):
	if body.is_in_group("Level"):
		is_moving=false
