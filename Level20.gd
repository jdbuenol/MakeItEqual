extends Level

var win_rect : Rect2 = Rect2(Vector2(479, 237), Vector2(15, 14))

func _ready():
	$FadingLabel/AnimationPlayer.play("intro")
# warning-ignore:return_value_discarded
	$FadingLabel2/AnimationPlayer.connect("animation_finished", self, "won")

func current_button(button : TextureButton):
	if ! win:
		.current_button(button)

func drop():
	if ! win:
		.drop()
		if win_rect.has_point($MovableButton.rect_global_position):
			$FadingLabel2/AnimationPlayer.play("intro")
