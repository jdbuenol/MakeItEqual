extends Level

func _ready():
# warning-ignore:return_value_discarded
	$FadingLabel/AnimationPlayer.connect(
		"animation_finished", self, "next_label"
	)
	$FadingLabel/AnimationPlayer.play("intro")
# warning-ignore:return_value_discarded
	$FadingLabel2/AnimationPlayer.connect("animation_finished", self, "tip")
# warning-ignore:return_value_discarded
	$FadingLabel4/AnimationPlayer.connect("animation_finished", self, "won")
# warning-ignore:return_value_discarded
	$FadingLabel3/AnimationPlayer.connect("animation_finished", self, "tip2")

func current_button(button : TextureButton):
	if ! win:
		.current_button(button)

func drop():
	if ! win:
		.drop()
		if ! rect.has_point($MovableButton.rect_global_position):
			win = true
			$FadingLabel4/AnimationPlayer.play("intro")
		else:
			$FadingLabel6/AnimationPlayer.play("intro")

func next_label(_anim_name):
	$FadingLabel2/AnimationPlayer.play("intro")

func tip(_anim_name):
	yield(get_tree().create_timer(5), "timeout")
	if ! win:
		$FadingLabel3/AnimationPlayer.play("intro")

func tip2(_anim_name):
	yield(get_tree().create_timer(5), "timeout")
	if ! win:
		$FadingLabel5/AnimationPlayer.play("intro")
