extends Level

var win_rect : Rect2 = Rect2(Vector2(408, 353), Vector2(17, 14))

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
		if win_rect.has_point($RotableButton.rect_global_position) and\
		(abs($RotableButton.true_rot) == 180):
			win = true
			$FadingLabel2/AnimationPlayer.play("intro")

