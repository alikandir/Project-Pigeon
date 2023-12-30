extends Resource
class_name PlayerStats

@export var move_speed:float=10.0
@export var damage:float=1.0

func IncreaseMoveSpeed(amount:float) -> void:
	move_speed+=amount

func IncreaseDamage(amount:float) -> void:
	damage+=amount

func GetMoveSpeed():
	return move_speed
