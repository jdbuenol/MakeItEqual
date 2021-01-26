extends Level

var win_rect : Rect2 = Rect2(Vector2(397, 242), Vector2(53, 58))

func _ready():
	$FadingLabel/AnimationPlayer.play("intro")

func current_button(button : TextureButton):
	if ! win:
		.current_button(button)

func drop():
	if ! win:
		.drop()
		if win_rect.has_point($ShrinkableButton.rect_global_position) and $ShrinkableButton.rect_scale.x == 4:
			win = true
			won("")
