extends StaticBody2D

onready var tween = $Tween
onready var phase_jump = $PhaseJump

signal rotated

var tween_speed = 0.2

func _ready():
	get_parent().turns += 1

func _process(delta):
	if get_parent().turns != 0:
		if !tween.is_active():
			if Input.is_action_just_pressed("Rotate_Left"):
				phase_jump.play()
				tween.interpolate_property(self, "rotation_degrees", rotation_degrees, rotation_degrees - 45, tween_speed)
				tween.start()
			if Input.is_action_just_pressed("Rotate_Right"):
				phase_jump.play()
				tween.interpolate_property(self, "rotation_degrees", rotation_degrees, rotation_degrees + 45, tween_speed)
				tween.start()

func _on_Tween_tween_completed(object, key):
	emit_signal("rotated")
