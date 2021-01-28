extends Level

var win_rect : Rect2 = Rect2(Vector2(496, 243), Vector2(5, 9))

func _ready():
	$FadingLabel/AnimationPlayer.play("intro")

func current_button(button : TextureButton):
	if ! win:
		.current_button(button)

func drop():
	if ! win:
		.drop()
		if win_rect.has_point($RotableButton.rect_global_position) and\
		$RotableButton.true_rot == 90 or $RotableButton.true_rot == -270:
			win = true
			won("")
