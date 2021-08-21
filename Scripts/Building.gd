extends StaticBody2D

onready var blue1 = preload("res://Assets/Blue.png")
onready var green1 = preload("res://Assets/Green.png")
onready var red1 = preload("res://Assets/Red.png")
onready var yellow1 = preload("res://Assets/Yellow.png")
onready var blue2 = preload("res://Assets/Blue2.png")
onready var green2 = preload("res://Assets/Green2.png")
onready var red2 = preload("res://Assets/Red2.png")
onready var yellow2 = preload("res://Assets/Yellow2.png")
onready var sprite = $Sprite
onready var anim = $AnimationPlayer

var color
var rand_num

func _ready():
	randomize()
	rand_num = randi() % 2

func _process(delta):
	match color:
		0:
			match rand_num:
				0:
					sprite.texture = blue1
				1:
					sprite.texture = blue2
		1:
			match rand_num:
				0:
					sprite.texture = green1
				1:
					sprite.texture = green2
		2:
			match rand_num:
				0:
					sprite.texture = red1
				1:
					sprite.texture = red2
		3:
			match rand_num:
				0:
					sprite.texture = yellow1
				1:
					sprite.texture = yellow2

func scale_rot():
	anim.play("Scale")
