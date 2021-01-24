extends Level

signal music

onready var win_rect : Rect2 = Rect2($TextureRect5.rect_global_position - Vector2(5, 5), $TextureRect5.rect_scale * $TextureRect5.rect_size.x + Vector2(5, 5))

func _ready():
# warning-ignore:return_value_discarded
	$FadingLabel2/AnimationPlayer.connect("animation_finished", self, "won")
	$FadingLabel/AnimationPlayer.play("intro")

func current_button(button : TextureButton):
	if ! win:
		.current_button(button)

func drop():
	if ! win:
		.drop()
		if win_rect.has_point($MovableButton.rect_global_position):
			win = true
			emit_signal("music")
			$FadingLabel2/AnimationPlayer.play("intro")
