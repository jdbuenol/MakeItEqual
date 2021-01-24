extends "res://Buttons/MovableButton.gd"

class_name ShrinkableButton

var current_size : int = 3

func shrink():
	if current_size > 1:
		current_size -= 1
		match current_size:
			1:
				$AnimationPlayer.play_backwards("to 2")
			2:
				$AnimationPlayer.play_backwards("to 3")
			3:
				$AnimationPlayer.play_backwards("to 4")
			4:
				$AnimationPlayer.play_backwards("to 5")

func grow_more():
	if current_size < 5:
		current_size += 1
		match current_size:
			2:
				$AnimationPlayer.play("to 2")
			3:
				$AnimationPlayer.play("to 3")
			4:
				$AnimationPlayer.play("to 4")
			5:
				$AnimationPlayer.play("to 5")
