extends Node

var current_level : Level
var level_number : int

const MUSIC : PackedScene = preload("res://Assets/Music and FX/Music.tscn")
var music : AudioStreamPlayer = MUSIC.instance()

func _ready():
	add_child(music)

var levels : Dictionary = {
	"Level1" : "res://Levels/Level2/Level2.tscn",
	"Level2" : "res://Levels/Level3/Level3.tscn",
	"Level3" : "res://Levels/Level4/Level4.tscn",
	"Level4" : "res://Levels/Level5/Level5.tscn",
	"Level5" : "res://Levels/Level6/Level6.tscn"
}

enum Level_ids {Level0, Level1, Level2, Level3, Level4, Level5, Level6, Level7, Level8, Level9, Level10}

func prep():
	current_level = get_viewport().get_children()[-1]
	if "Level" in current_level.name:
# warning-ignore:return_value_discarded
		current_level.get_node("Button").connect("pressed", self, "next")
	level_number = Level_ids[current_level.name]
	if level_number <= 5:
		current_level.get_node("Blip").volume_db = -80
	if level_number >= 5:
		current_level.get_node("paralel").queue_free()
		if level_number == 5:
# warning-ignore:return_value_discarded
			current_level.connect("music", self, "play_music")
		elif level_number > 5:
			play_music()

func next():
# warning-ignore:return_value_discarded
	get_tree().change_scene(levels[current_level.name])

func play_music():
	if ! music.playing:
		music.play()
