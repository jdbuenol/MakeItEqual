extends ColorRect

class_name Level

var win : bool = false

onready var rect : Rect2 = Rect2(
	$TrueRect.get_rect().position, 
	$TrueRect.rect_scale * $TrueRect.rect_size.x
)

var current : TextureButton
var anchor_pos : Vector2

func _ready():
	LevelControl.prep()
	for x in get_tree().get_nodes_in_group("MovableButton"):
		x.connect("current", self, "current_button")
		x.connect("drop", self, "drop")

func current_button(button : TextureButton):
	anchor_pos = get_viewport().get_mouse_position() - button.rect_global_position
	$Blip.play()
	current = button

func drop():
	current = null

func _process(_delta):
	if current:
		current.rect_global_position = get_viewport().get_mouse_position() - anchor_pos

func won(_anim_name):
	$Button.visible = true

func _input(event):
	if event.is_action_pressed("ui_up") and current is ShrinkableButton:
		current.grow_more()
	elif event.is_action_pressed("ui_down") and current is ShrinkableButton:
		current.shrink()
