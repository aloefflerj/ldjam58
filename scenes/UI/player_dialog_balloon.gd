extends NinePatchRect


@onready var dialog_text: RichTextLabel = $DialogText


func _ready() -> void:
	self._handle_dialog_text()
	self._handle_show()


func _handle_dialog_text() -> void:
	self.dialog_text.text = GameManager.player_dialog_text


func _handle_show() -> void:
	await get_tree().create_timer(2.0).timeout
	self._reset_dialog()

func _reset_dialog() -> void:
	self.queue_free()
	GameManager.reset_player_dialog_text()
