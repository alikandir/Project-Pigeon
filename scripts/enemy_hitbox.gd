extends Area2D
@onready var enemy = $".."
var damage_pushback_amount:=30

func apply_damage(damage_amount:float,direction:Vector2):
	enemy.current_health-=damage_amount
	enemy.damage_pushback=direction*damage_pushback_amount
	printerr(enemy.current_health)
	if(enemy.current_health<=0):enemy.queue_free()
