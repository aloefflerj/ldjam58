extends RichTextLabel

# Called when the node enters the scene tree for the first time.
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    await get_tree().create_timer(4).timeout
    text = "[b][font_size=9][color=#a3c1b7][wave amp=30.0 freq=3.0 connected=1]I want to have a bike[/wave][/color][/font_size][/b]"  # Clear the text
    await get_tree().create_timer(2).timeout
    text = ""  # Clear the text
