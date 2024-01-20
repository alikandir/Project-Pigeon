extends Control

@onready var wing_upgrade = $Panel/LeftContainer/WingUpgrade
@onready var beak_upgrade = $Panel/LeftContainer/BeakUpgrade
@onready var tail_upgrade = $Panel/RightContainer/TailUpgrade

@onready var beak = $Panel/PlayerSprites/Beak
@onready var wings = $Panel/PlayerSprites/Wings
@onready var tail = $Panel/PlayerSprites/Tail
@onready var body = $Panel/PlayerSprites/Body

@onready var animation_player = $AnimationPlayer

func _ready():
	beak.play("default")
	animation_player.play("scene_opening")


func _on_wing_upgrade_pressed():
	pass


func _on_beak_upgrade_pressed():
	pass # Replace with function body.


func _on_tail_upgrade_pressed():
	pass # Replace with function body.


func _on_close_shop_pressed():
	animation_player.play("scene_closing")
	await get_tree().create_timer(1.0).timeout
	get_tree().paused=false
	queue_free()
