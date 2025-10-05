extends Node2D


func _ready() -> void:
	self._pause()
	self._on_ready_reset_base_mechanics()


func _on_ready_reset_base_mechanics() -> void:
	GameManager.handle_base_mechanics()


func _pause() -> void:
	GameManager.handle_game_pause(true)


func _unpause() -> void:
	GameManager.handle_game_pause(false)


func _on_retry_pressed() -> void:
	self._unpause()
	self._self_remove()
	self._restart_game()


func _self_remove() -> void:
	self.queue_free()


func _restart_game() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://scenes/Game.tscn")
