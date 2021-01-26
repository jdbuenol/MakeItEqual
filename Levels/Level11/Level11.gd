extends Level

var win_rect : Rect2 = Rect2(Vector2(504, 343), Vector2(5, 9))
var win_rect_2 : Rect2 = Rect2(Vector2(446, 344), Vector2(18, 15))

func _ready():
# warning-ignore:return_value_discarded
	$FadingLabel/AnimationPlayer.connect("animation_finished", self, "next")
# warning-ignore:return_value_discarded
	$FadingLabel3/AnimationPlayer.connect("animation_finished", self, "won")
	$FadingLabel/AnimationPlayer.play("intro")

func next(_anim_name):
	$FadingLabel2/AnimationPlayer.play("intro")

func current_button(button : TextureButton):
	if ! win:
		.current_button(button)

func drop():
	if ! win:
		.drop()
		if win_rect.has_point($MovableButton.rect_global_position) and\
		win_rect_2.has_point($MovableButton2.rect_global_position):
			win = true
			$FadingLabel3/AnimationPlayer.play("intro")
