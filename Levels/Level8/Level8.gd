extends Level

var win_rect_1 : Rect2 = Rect2(Vector2(393, 250), Vector2(10, 8))
var win_rect_2 : Rect2 = Rect2(Vector2(376, 276), Vector2(7, 2))

func current_button(button : TextureButton):
	if ! win:
		.current_button(button)

func drop():
	if ! win:
		.drop()
		if win_rect_1.has_point($MovableButton.rect_global_position) and win_rect_2.has_point($MovableButton2.rect_global_position):
			win = true
			won("")
