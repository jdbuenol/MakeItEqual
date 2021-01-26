extends Level

const NEW : Texture = preload("res://Assets/TextureButtons/NEW.png")
const NEW2 : Texture = preload("res://Assets/TextureButtons/NEW0.png")

const CREDITS : PackedScene = preload("res://Levels/credits/credits.tscn")

var current_level : String

func _ready():
# warning-ignore:return_value_discarded
	$Continue.connect("pressed", self, "continue_game")
# warning-ignore:return_value_discarded
	$CREDITS.connect("pressed", self, "credits")
# warning-ignore:return_value_discarded
	$EXIT.connect("pressed", self, "exit")
	check_level()

func check_level():
	var save : File = File.new()
	if save.file_exists("user://level.save") and save.open("user://level.save", save.READ) == 0:
		current_level = save.get_line()
		$Button.texture_normal = NEW2
		$Button.texture_hover = NEW
		$Button.texture_pressed = NEW
	else:
		$Continue.queue_free()

func continue_game():
# warning-ignore:return_value_discarded
	get_tree().change_scene(LevelControl.levels['Level' + current_level])

func credits():
	var credits : ColorRect = CREDITS.instance()
	add_child(credits)

func exit():
	get_tree().quit()
