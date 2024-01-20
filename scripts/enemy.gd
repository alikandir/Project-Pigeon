extends CharacterBody2D
class_name Enemy
@export var direction:int
@export var speed:float


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	implement_gravity(delta)
	velocity.x=speed*delta*direction
	move_and_slide()

func implement_gravity(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
