extends Control

func _on_AnimationPlayer_animation_finished(anim_name):
	get_parent().load_title()
