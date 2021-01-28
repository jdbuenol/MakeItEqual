extends Level

var win_rect : Rect2 = Rect2(Vector2(536, 345), Vector2(13, 15))

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
		if win_rect.has_point($MovableButton2.rect_global_position) and not\
		(rect.has_point($MovableButton.rect_global_position) or\
		rect.has_point($MovableButton3.rect_global_position) or\
		rect.has_point($MovableButton4.rect_global_position)):
			win = true
			$FadingLabel2/AnimationPlayer.play("intro")
		elif win_rect.has_point($MovableButton2.rect_global_position):
			$FadingLabel3/AnimationPlayer.play("intro")
