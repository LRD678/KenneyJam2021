extends StaticBody2D

onready var blue = preload("res://Assets/Blue.png")
onready var green = preload("res://Assets/Green.png")
onready var red = preload("res://Assets/Red.png")
onready var yellow = preload("res://Assets/Yellow.png")
onready var sprite = $Sprite

var color

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
