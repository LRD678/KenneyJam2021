extends Node

onready var game_scene = preload("res://Scenes/GameScene.tscn")
onready var title_scene = preload("res://Scenes/TitleScene.tscn")
onready var gameover_scene = preload("res://Scenes/GameoverScene.tscn")
onready var options_scene = preload("res://Scenes/OptionsScene.tscn")
onready var splash_screen = preload("res://Scenes/SplashScreen.tscn")
onready var main_loop = $MainLoop

var active_scene

func _ready():
	main_loop.play()
	load_splash()

func load_game():
	cleanup()
	active_scene = game_scene.instance()
	add_child(active_scene)

func load_splash():
	cleanup()
	active_scene = splash_screen.instance()
	add_child(active_scene)

func load_options():
	cleanup()
	active_scene = options_scene.instance()
	add_child(active_scene)

func load_title():
	cleanup()
	active_scene = title_scene.instance()
	add_child(active_scene)

func load_gameover():
	yield(get_tree().create_timer(1), "timeout")
	cleanup()
	active_scene = gameover_scene.instance()
	add_child(active_scene)

func cleanup():
	if(active_scene != null):
		active_scene.queue_free()
