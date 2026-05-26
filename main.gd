extends Control

@onready var x_value: RichTextLabel = $"Panel/MarginContainer/VBoxContainer/GridContainer/x-value"
@onready var y_value: RichTextLabel = $"Panel/MarginContainer/VBoxContainer/GridContainer/y-value"
@onready var z_value: RichTextLabel = $"Panel/MarginContainer/VBoxContainer/GridContainer/z-value"
@onready var slope_value: RichTextLabel = $"Panel/MarginContainer/VBoxContainer/GridContainer/slope-value"
@onready var angle_value: RichTextLabel = $"Panel/MarginContainer/VBoxContainer/GridContainer/angle-value"
@onready var board: FunBoard = $Board

func _process(_delta: float) -> void:
	var accel: Vector3 = Input.get_accelerometer()
	board.gravity_vector = accel
	board.gravity_vector.y = -board.gravity_vector.y
	x_value.text = "%.2f" % [accel.x]
	y_value.text = "%.2f" % [accel.y]
	z_value.text = "%.2f" % [accel.z]
	var angle: float = accel.angle_to(Vector3(0, 0, -1))
	angle_value.text = "%.0f⁰" % [rad_to_deg(angle)]
	slope_value.text = "%.0f %%" % [(100.0 * tan(angle))]

func _on_button_pressed() -> void:
	get_tree().quit()
