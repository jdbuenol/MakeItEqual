extends Node

var current_level : Level
var level_number : int

const MUSIC : PackedScene = preload("res://Assets/Music and FX/Music.tscn")
var music : AudioStreamPlayer = MUSIC.instance()

var music_stream_0 : AudioStream = load("res://Assets/Music and FX/MakeItEqual.ogg")
var music_stream_1 : AudioStream = load("res://Assets/Music and FX/MakeItEqual2.ogg")
var music_stream_2 : AudioStream = load("res://Assets/Music and FX/MakeItEqual3.ogg")

func _ready():
	add_child(music)

var levels : Dictionary = {
	"Level0" : "res://Levels/Level1/Level1.tscn",
	"Level1" : "res://Levels/Level2/Level2.tscn",
	"Level2" : "res://Levels/Level3/Level3.tscn",
	"Level3" : "res://Levels/Level4/Level4.tscn",
	"Level4" : "res://Levels/Level5/Level5.tscn",
	"Level5" : "res://Levels/Level6/Level6.tscn",
	"Level6" : "res://Levels/Level7/Level7.tscn",
	"Level7" : "res://Levels/Level8/Level8.tscn",
	"Level8" : "res://Levels/Level9/Level9.tscn",
	"Level9" : "res://Levels/Level10/Level10.tscn",
	"Level10" : "res://Levels/Level11/Level11.tscn",
	"Level11" : "res://Levels/Level12/Level12.tscn",
	"Level12" : "res://Levels/Level13/Level13.tscn",
	"Level13" : "res://Levels/Level14/Level14.tscn",
	"Level14" : "res://Levels/Level15/Level15.tscn",
	"Level15" : "res://Levels/Level16/Level16.tscn",
	"Level16" : "res://Levels/Level17/Level17.tscn",
	"Level17" : "res://Levels/Level18/Level18.tscn",
	"Level18" : "res://Levels/Level19/Level19.tscn",
	"Level19" : "res://Levels/Level20/Level20.tscn",
	"Level20" : "res://Levels/Level0/Level0.tscn",
}

enum Level_ids {Level0, Level1, Level2, Level3, Level4, Level5, Level6, Level7,
Level8, Level9, Level10, Level11, Level12, Level13, Level14, Level15, Level16,
Level17, Level18, Level19, Level20}

func prep():
	current_level = get_viewport().get_children()[-1]
	if "Level" in current_level.name:
# warning-ignore:return_value_discarded
		current_level.get_node("Button").connect("pressed", self, "next")
	level_number = Level_ids[current_level.name]
	if level_number == 0:
		current_level.get_node("TrueRect").queue_free()
		current_level.get_node("sound").queue_free()
		current_level.get_node("paralel").queue_free()
		current_level.get_node("Label").queue_free()
	else:
		current_level.get_node("Label").text = "Screen " + str(level_number)
	if level_number <= 5:
		current_level.get_node("Blip").volume_db = -80
	if level_number >= 5:
		current_level.get_node("paralel").queue_free()
		if level_number == 5:
# warning-ignore:return_value_discarded
			current_level.connect("music", self, "play_music")
		elif level_number > 5:
			play_music()
#Music check
	if level_number > 0 and level_number < 5:
		music.stop()
	if level_number > 5 and level_number <= 10 and music.stream != music_stream_0:
		music.stop()
		music.stream = music_stream_0
		music.play()
	if level_number > 10 and level_number < 16 and music.stream != music_stream_1:
		music.stop()
		music.stream = music_stream_1
		music.play()
	if level_number >= 16 and music.stream != music_stream_2:
		music.stop()
		music.stream = music_stream_2
		music.play()

func next():
	var save : File = File.new()
	if save.open("user://level.save", save.WRITE) == 0:
		save.store_line(str(level_number))
	else:
		print("Coudn't save the progress")
# warning-ignore:return_value_discarded
	get_tree().change_scene(levels[current_level.name])

func play_music():
	if ! music.playing:
		music.play()
