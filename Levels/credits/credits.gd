extends ColorRect

func _ready():
# warning-ignore:return_value_discarded
	$TextureButton.connect("pressed", self, "queue_free")
