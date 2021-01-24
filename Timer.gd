extends Timer

func _on_Timer_timeout():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Levels/Level1/Level1.tscn")
