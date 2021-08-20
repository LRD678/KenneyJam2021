extends Node2D

onready var score_label = $GUI/Score
onready var turns_label = $GUI/Turns

signal rotated

var ground_colors = []
var building_colors = []
var counter = 0
var score = 0
var turns = 5

func _ready():
	for num in 16:
		randomize()
		var rand_num = randi() % 4
		building_colors.append(rand_num)
	for b in get_tree().get_nodes_in_group("Building"):
		b.color = building_colors[counter]
		counter += 1
	counter = 0
	for num in 16:
		randomize()
		var rand_num = randi() % 4
		ground_colors.append(rand_num)
	for g in get_tree().get_nodes_in_group("Ground"):
		connect("rotated", g, "handle_score")
		g.color = ground_colors[counter]
		counter += 1

func _process(delta):
	score = max(score, 0)
	score_label.text = str(score)
	turns_label.text = str(turns)

func _on_Planet_rotated():
	score = 0
	turns -= 1
	emit_signal("rotated")
