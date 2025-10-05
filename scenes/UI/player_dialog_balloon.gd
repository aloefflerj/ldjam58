extends NinePatchRect


func _ready() -> void:
	self._handle_show()


func _handle_show() -> void:
	await get_tree().create_timer(2.0).timeout
	self.queue_free()
