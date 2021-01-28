extends Level

var win_rect : Rect2 = Rect2(Vector2(389, 238), Vector2(28, 12))
var win_rect_2 : Rect2 = Rect2(Vector2(327, 233), Vector2(10, 19))
var win_rect_3 : Rect2 = Rect2(Vector2(259, 272), Vector2(10, 11))

func current_button(button : TextureButton):
	if ! win:
		.current_button(button)

func drop():
	if ! win:
		.drop()
		if win_rect.has_point($MovableButton2.rect_global_position) and\
		win_rect_2.has_point($MovableButton.rect_global_position) and\
		win_rect_3.has_point($RotableButton.rect_global_position) and\
		($RotableButton.true_rot == -90 or $RotableButton.true_rot == 270):
			win = true
			won("")
