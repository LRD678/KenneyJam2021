extends Node2D

onready var score_label = $GUI/Score
onready var turns_label = $GUI/Turns
onready var background_particles = $BackgroundParticles
onready var score_scale = $GUI/Score/ScoreScale
onready var turn_scale = $GUI/Turns/TurnsScale

signal rotated

var ground_colors = []
var building_colors = []
var counter = 0
var score = 0
var turns = 5

func _ready():
	background_particles.emitting = true
	turns = 5
	for num in 16:
		randomize()
		var rand_num = randi() % 4
		building_colors.append(rand_num)
	for b in get_tree().get_nodes_in_group("Building"):
		b.color = building_colors[counter]
		counter += 1
	counter = 0
#	for num in 16:
#		randomize()
#		var rand_num = randi() % 4
#		ground_colors.append(rand_num)
	for g in get_tree().get_nodes_in_group("Ground"):
		connect("rotated", g, "handle_score")
		g.color = building_colors[counter]
		counter += 1

func _process(delta):
	score = max(score, 0)
	score_label.text = "Score: " + str(score)
	turns_label.text = "Turns: " + str(turns)

func _on_Planet_rotated():
	score = 0
	turns -= 1
	score_scale.play("Scale")
	turn_scale.play("Scale")
	emit_signal("rotated")
