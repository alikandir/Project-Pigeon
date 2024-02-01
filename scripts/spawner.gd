extends Node2D
@onready var timer = $Timer

@export var spawn_rate:float
@export var is_police_spawner:bool
@export var spawn_police_interval:int
@export var spawn_to_left:bool
@export var enemies_to_spawn:Array[PackedScene]

func _ready():
	if !is_police_spawner:
		timer.start(spawn_rate)
	elif  is_police_spawner:
		Signals.connect("enemy_kill_count",Callable(self,"_on_enemy_kill_count_increase"))
func _process(delta):
	pass


func _on_timer_timeout():
	var enemy_index:int=randi()%enemies_to_spawn.size()
	var enemy_instance=enemies_to_spawn[enemy_index].instantiate()
	if spawn_to_left:
		enemy_instance.direction=-1
	add_child(enemy_instance)

func _on_enemy_kill_count_increase(enemy_count:int):
	if !is_police_spawner:return
	if enemy_count%spawn_police_interval==0:
		var enemy_instance=enemies_to_spawn[0].instantiate()
		if spawn_to_left:
			enemy_instance.direction=-1
		add_child(enemy_instance)
