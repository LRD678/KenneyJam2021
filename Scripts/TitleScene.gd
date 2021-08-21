extends Control

onready var background_particles = $BackgroundParticles
onready var phase_jump = $PhaseJump
onready var highscore_label = $V/Label

func _ready():
	background_particles.emitting = true
	highscore_label.text = "Highscore: " + str(Global.highscore)

func _on_PlayButton_pressed():
	phase_jump.play()
	yield(get_tree().create_timer(0.3), "timeout")
	get_parent().load_game()

func _on_OptionsButton_pressed():
	phase_jump.play()
	yield(get_tree().create_timer(0.3), "timeout")
	get_parent().load_options()

func _on_MusicTrack_pressed():
	OS.shell_open("https://opengameart.org/content/8bit-theme-upbeat-overworld")

func _on_Kenney_pressed():
	OS.shell_open("https://www.kenney.nl/")
