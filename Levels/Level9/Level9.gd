extends Level

onready var win_rect : Rect2 = Rect2($TextureRect10.rect_global_position - Vector2(5, 5), $TextureRect10.rect_scale * $TextureRect10.rect_size.x + Vector2(5, 5))
var win_rect_2 : Rect2 = Rect2(Vector2(300, 247), Vector2(6, 9))

func current_button(button : TextureButton):
	if ! win:
		.current_button(button)

func drop():
	if ! win:
		.drop()
		if win_rect.has_point($MovableButton.rect_global_position) and win_rect_2.has_point($MovableButton2.rect_global_position):
			win = true
			won("")
