extends Level

var win_rect : Rect2 = Rect2(Vector2(376, 276), Vector2(7, 2))

func current_button(button : TextureButton):
	if ! win:
		.current_button(button)

func drop():
	if ! win:
		.drop()
		if not rect.has_point($MovableButton.rect_global_position) and win_rect.has_point($MovableButton2.rect_global_position):
			win = true
			won("")
