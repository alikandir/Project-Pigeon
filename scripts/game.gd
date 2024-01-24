extends Node2D

@onready var saver_and_loader:SaverAndLoader = $Utilities/SaverAndLoader as SaverAndLoader
@onready var label = $CanvasLayer/Label
@onready var player = $Player
@onready var shop_button = $CanvasLayer/ShopButton
var pl_upgrade_screen=preload("res://scenes/upgrade_screen.tscn")


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


func _on_shop_button_pressed():
	var tween=create_tween()
	var upgrade_scene=pl_upgrade_screen.instantiate()
	get_node("CanvasLayer").add_child(upgrade_scene)
	tween.tween_property(upgrade_scene,"size",get_viewport_rect().size,2)
	get_tree().paused=true


