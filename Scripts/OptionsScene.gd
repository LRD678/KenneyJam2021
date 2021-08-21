extends Control

onready var music_slider = $V/SoundSliders/MusicVolume
onready var SFX_Slider = $V/SoundSliders/SFXVolume
onready var master_slider = $V/SoundSliders/MasterVolume
onready var phase_jump = $PhaseJump
onready var background_particles = $BackgroundParticles

func _ready():
	background_particles.emitting = true
	music_slider.value = db2linear(AudioServer.get_bus_volume_db(2))
	SFX_Slider.value = db2linear(AudioServer.get_bus_volume_db(1))
	master_slider.value = db2linear(AudioServer.get_bus_volume_db(0))

func _on_SFXVolume_value_changed(value):
	AudioServer.set_bus_volume_db(1, linear2db(value))

func _on_MusicVolume_value_changed(value):
	AudioServer.set_bus_volume_db(2, linear2db(value))

func _on_MasterVolume_value_changed(value):
	AudioServer.set_bus_volume_db(0, linear2db(value))

func _on_TitleButton_pressed():
	phase_jump.play()
	yield(get_tree().create_timer(0.3), "timeout")
	get_parent().load_title()
