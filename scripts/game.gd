extends Node2D

@onready var saver_and_loader:SaverAndLoader = $Utilities/SaverAndLoader as SaverAndLoader
@onready var label = $CanvasLayer/Label
@onready var player = $Player



# Called when the node enters the scene tree for the first time.
func _ready():
	label.text=str(player.player_stats.move_speed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	saver_and_loader.save_game()
	update_label()


func _on_button_2_pressed():
	saver_and_loader.load_game()
	update_label()
func update_label():
	label.text=str(player.player_stats.move_speed)


func _on_button_3_pressed():
	player.player_stats.move_speed+=100
	update_label()
