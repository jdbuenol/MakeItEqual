extends ColorRect

class_name level

var current : TextureButton
var anchor_pos : Vector2

func _ready():
	for x in get_tree().get_nodes_in_group("MovableButton"):
		x.connect("current", self, "current_button")
		x.connect("drop", self, "drop")

func current_button(button : TextureButton):
	anchor_pos = get_viewport().get_mouse_position() - button.rect_global_position
	button.grow(true)
	current = button

func drop():
	current.grow(false)
	current = null

func _process(_delta):
	if current:
		current.rect_global_position = get_viewport().get_mouse_position() - anchor_pos
