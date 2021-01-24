extends TextureButton

signal current
signal drop

export(Texture) var text

func _ready():
	texture_normal = text
	texture_pressed = text
	texture_hover = text
# warning-ignore:return_value_discarded
	connect("button_down", self, "current_button")
# warning-ignore:return_value_discarded
	connect("button_up", self, "dropped")

func current_button():
	emit_signal("current", self)

func dropped():
	emit_signal("drop")

func grow(bigger : bool):
	if bigger:
		$AnimationPlayer.play("grow")
	else:
		$AnimationPlayer.play_backwards("grow")
