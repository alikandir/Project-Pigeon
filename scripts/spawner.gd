extends Node2D
@onready var timer = $Timer

@export var spawn_rate:float
@export var spawn_to_left:bool
@export var enemies_to_spawn:Array[PackedScene]
func _ready():
	timer.start(spawn_rate)
func _process(delta):
	pass


func _on_timer_timeout():
	var enemy_index:int=randi()%enemies_to_spawn.size()
	var enemy_instance=enemies_to_spawn[enemy_index].instantiate()
	if spawn_to_left:
		enemy_instance.direction=-1
	add_child(enemy_instance)
