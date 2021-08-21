extends Control

onready var phase_jump = $PhaseJump
onready var score_label = $V/V/Score
onready var highscore_label = $V/V/Highscore
onready var background_particles = $BackgroundParticles

var score
var highscore

func _ready():
	yield(get_tree().create_timer(0.01), "timeout")
	background_particles.emitting = true
	score = Global.score
	highscore = Global.highscore
	highscore_label.text = "Highscore: " + str(highscore)
	score_label.text = "Score: " + str(score)

func _on_MenuButton_pressed():
	phase_jump.play()
	yield(get_tree().create_timer(0.3), "timeout")
	get_parent().load_title()

func _on_PlayAgainButton_pressed():
	phase_jump.play()
	yield(get_tree().create_timer(0.3), "timeout")
	get_parent().load_game()
