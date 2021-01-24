extends Level

var win_rect : Rect2 = Rect2(Vector2(396, 250), Vector2(11, 8))

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
			$FadingLabel2/AnimationPlayer.play("intro")
