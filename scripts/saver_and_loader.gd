extends Node
class_name SaverAndLoader
@export var player:PlayerStats
@onready var label = $"../../CanvasLayer/Label"

func save_game():
	var saved_game:PlayerStats=PlayerStats.new()
	
	saved_game.damage=player.damage
	saved_game.move_speed=player.move_speed
	ResourceSaver.save(saved_game,"user://save_game.tres")


func load_game():
	var saved_game:PlayerStats= load("user://save_game.tres") as PlayerStats
	player.damage=saved_game.damage
	player.move_speed=saved_game.move_speed
