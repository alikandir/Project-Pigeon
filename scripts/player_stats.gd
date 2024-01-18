extends Resource
class_name PlayerStats

@export var move_speed:float=100.0
@export var damage:float=1.0

var beak_sprite_index:int
var wing_sprite_index:int
var tail_sprite_index:int

func IncreaseMoveSpeed(amount:float) -> void:
	move_speed+=amount

func IncreaseDamage(amount:float) -> void:
	damage+=amount

func GetMoveSpeed():
	return move_speed
