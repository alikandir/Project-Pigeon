extends StaticBody2D

@onready var collision_polygon_2d = $CollisionPolygon2D
@onready var polygon_2d = $Polygon2D


# Called when the node enters the scene tree for the first time.
func _ready():
	polygon_2d.polygon=collision_polygon_2d.polygon
