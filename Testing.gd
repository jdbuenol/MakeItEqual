extends Control

var current : TextureButton
var anchor_pos : Vector2

func _ready():
# warning-ignore:return_value_discarded
	$ColorRect/MovableButton.connect("current", self, "current_button")

func current_button(button : TextureButton):
	if current:
		button.grow(false)
		current = null
	else:
		anchor_pos = get_viewport().get_mouse_position() - button.rect_global_position
		button.grow(true)
		current = button

func _process(_delta):
	if current:
		current.rect_global_position = get_viewport().get_mouse_position() - anchor_pos
