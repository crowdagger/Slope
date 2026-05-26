class_name Ball
extends RigidBody2D

@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready() -> void:
	sprite_2d.modulate = Color.from_hsv(randf_range(0.0, 1.0), randf_range(0.0, 1.0), 1.0)
	

#func _ready() -> void:
	#Events.unfreeze.connect(on_unfreeze)
#
#func on_unfreeze() -> void:
	#freeze = false
