extends "res://Buttons/MovableButton.gd"

class_name RotableButton

var target : int = 0
var ori : bool = false
var true_rot : float = 0

func rotate_left():
	target += 90
	true_rot += 90
	check_rot()

func rotate_right():
	target -= 90
	true_rot -= 90
	check_rot()

func check_rot():
	if true_rot >= 360:
		true_rot = 0
	elif true_rot <= -360:
		true_rot = 0
	$Tween.interpolate_property(self, "rect_rotation", rect_rotation, target, 0.2)
	if not $Tween.is_active():
		$Tween.start()
