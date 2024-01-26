extends Area2D
class_name Enemy
@export var direction:int
@export var speed:float

var max_health = 40
var current_health = max_health
var damage_pushback:=Vector2(15,15)
var invincibilty_time:float=0.3

var is_moving:bool=true

func _process(delta):
	move(delta)

func apply_damage(damage_amount:float,direction:Vector2):
	if monitoring:
		modulate=Color(1,1,1,0.3)
		current_health-=damage_amount
		printerr(current_health)
		if(current_health<=0):queue_free()
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


func _on_body_entered(body):
	if body.is_in_group("Level"):
		is_moving=false
