extends StaticBody2D

signal rotated

func _ready():
	emit_signal("rotated")
	get_parent().turns += 1

func _process(delta):
	if get_parent().turns != 0:
		if Input.is_action_just_pressed("Rotate_Left"):
			rotation_degrees -= 45
			emit_signal("rotated")
		if Input.is_action_just_pressed("Rotate_Right"):
			rotation_degrees += 45
			emit_signal("rotated")
