extends Level

var win_rect : Rect2 = Rect2(Vector2(336, 346), Vector2(21, 9))
var win_rect_2 : Rect2 = Rect2(Vector2(384, 334), Vector2(12, 18))

func current_button(button : TextureButton):
	if ! win:
		.current_button(button)

func drop():
	if ! win:
		.drop()
		if win_rect.has_point($MovableButton.rect_global_position) and\
		win_rect_2.has_point($MovableButton2.rect_global_position) and not\
		(rect.has_point($MovableButton3.rect_global_position) or\
		rect.has_point($MovableButton4.rect_global_position) or\
		rect.has_point($MovableButton5.rect_global_position) or\
		rect.has_point($MovableButton6.rect_global_position)):
			win = true
			won("")
