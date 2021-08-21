extends StaticBody2D

onready var blue = preload("res://Assets/BlueTile.png")
onready var green = preload("res://Assets/GreenTile.png")
onready var red = preload("res://Assets/RedTile.png")
onready var yellow = preload("res://Assets/YellowTile.png")
onready var sprite = $Sprite
onready var building_check = $BuildingCheck
onready var game_scene = get_parent().get_parent().get_parent()

var color
var inc_score = false
var dec_score = false

func _process(delta):
	match color:
		0:
			sprite.texture = blue
		1:
			sprite.texture = green
		2:
			sprite.texture = red
		3:
			sprite.texture = yellow

func handle_score():
	if building_check.is_colliding():
		var collision = building_check.get_collider()
		if collision.is_in_group("Building"):
			if collision.color == self.color:
				game_scene.score += 1
				dec_score = true
			elif collision.color != self.color:
				game_scene.score -= 1
				inc_score = true
