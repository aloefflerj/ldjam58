extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(4).timeout
	text = ""  # Clear the text
