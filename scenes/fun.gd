class_name FunBoard
extends Node2D

const BALL = preload("uid://b5wmn1fs3jr20")
@export var gravity_vector: Vector3 = Vector3(0, 0, -9.8) 

func _ready() -> void:
	for x in range(0, 50):
		var ball: Ball = BALL.instantiate()
		ball.position.x = randf_range(100.0, 400.0)
		ball.position.y = randf_range(100.0, 200.0)
		ball.linear_velocity.x = randf_range(-10.0, 10.0)
		ball.linear_velocity.y = randf_range(-10.0, 10.0)
		add_child(ball)

func _physics_process(_delta: float) -> void:
	PhysicsServer2D.area_set_param(get_viewport().find_world_2d().space, PhysicsServer2D.AREA_PARAM_GRAVITY, 100)
	var gravity: Vector2 = Vector2(gravity_vector.x, gravity_vector.y)
	PhysicsServer2D.area_set_param(get_viewport().find_world_2d().space, PhysicsServer2D.AREA_PARAM_GRAVITY_VECTOR, gravity)
