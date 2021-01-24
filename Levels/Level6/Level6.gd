extends Level

onready var win_rect : Rect2 = Rect2($TextureRect2.rect_global_position - Vector2(5, 5), $TextureRect2.rect_scale * $TextureRect2.rect_size.x + Vector2(5, 5))

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
		if win_rect.has_point($ShrinkableButton.rect_global_position) and $ShrinkableButton.rect_scale.x == 2:
			win = true
			$FadingLabel2/AnimationPlayer.play("intro")
