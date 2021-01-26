extends Level

onready var win_rect : Rect2 = Rect2($Control/TextureRect22.rect_global_position - Vector2(10, 10), $Control/TextureRect22.rect_scale * $Control/TextureRect10.rect_size.x + Vector2(10, 10))
var win_rect_2 : Rect2 = Rect2(Vector2(260, 221), Vector2(24, 30))
var win_rect_3 : Rect2 = Rect2(Vector2(509, 235), Vector2(21, 16))
var win_rect_4 : Rect2 = Rect2(Vector2(147, 239), Vector2(10, 13))
var win_rect_5 : Rect2 = Rect2(Vector2(248, 215), Vector2(15, 12))
var win_rect_6 : Rect2 = Rect2(Vector2(265, 225), Vector2(17, 15))

func _ready():
	$FadingLabel/AnimationPlayer.play("intro")
# warning-ignore:return_value_discarded
	$FadingLabel/AnimationPlayer.connect("animation_finished", self, "reveal")
# warning-ignore:return_value_discarded
	$FadingLabel2/AnimationPlayer.connect("animation_finished", self, "joke")
# warning-ignore:return_value_discarded
	$FadingLabel3/AnimationPlayer.connect("animation_finished", self, "won")
# warning-ignore:return_value_discarded
	$FadingLabel4/AnimationPlayer.connect("animation_finished", self, "won")

func current_button(button : TextureButton):
	if ! win:
		.current_button(button)

func drop():
	if ! win:
		.drop()
		if $Control:
			if win_rect.has_point($Control/MovableButton2.rect_global_position) and\
			win_rect.has_point($Control/MovableButton3.rect_global_position) and\
			(win_rect_2.has_point($Control/MovableButton.rect_global_position) or\
			win_rect_2.has_point($Control/ShrinkableButton.rect_global_position)) and\
			(win_rect_3.has_point($Control/MovableButton.rect_global_position) or\
			win_rect_3.has_point($Control/ShrinkableButton.rect_global_position)) and\
			not rect.has_point($Control/MovableButton4.rect_global_position) and\
			$Control/ShrinkableButton.current_size == 2:
				win = true
				$FadingLabel3/AnimationPlayer.play("intro")
		else:
			if win_rect_4.has_point($Control2/MovableButton.rect_global_position) and\
			win_rect_5.has_point($Control2/MovableButton2.rect_global_position) and\
			win_rect_6.has_point($Control2/MovableButton3.rect_global_position):
				win = true
				$FadingLabel4/AnimationPlayer.play("intro")

func reveal(_anim_name):
	$Control/ColorRect.queue_free()
	yield(get_tree().create_timer(15), "timeout")
	if ! win:
		$Control.queue_free()
		$FadingLabel2/AnimationPlayer.play("intro")

func joke(_anim_name):
	$Control2/ColorRect.queue_free()
