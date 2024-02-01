extends Area2D

@export var bullet_speed:float
@export var bullet_damage:float
var direction:Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position+=bullet_speed*direction*delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_body_entered(body):
	if body.is_in_group("Player"):
		body.take_damage(bullet_damage)
		queue_free()
