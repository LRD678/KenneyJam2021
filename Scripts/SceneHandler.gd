extends Node

onready var game_scene = preload("res://Scenes/GameScene.tscn")

var active_scene

func _ready():
	load_game()

func load_game():
	cleanup()
	active_scene = game_scene.instance()
	add_child(active_scene)

func cleanup():
	if(active_scene != null):
		active_scene.queue_free()
