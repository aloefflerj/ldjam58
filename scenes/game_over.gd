extends Node2D

func _ready() -> void:
	get_tree().paused = true
	
	GameManager.player_budget = 0
	GameManager.power_up_jump_multiply = 1
	
	if GameManager.camera_global_position.y != 0:
		self.global_position = GameManager.camera_global_position


func _on_retry_pressed() -> void:
	get_tree().paused = false
	queue_free()
	get_tree().call_deferred("change_scene_to_file", "res://scenes/Game.tscn")

	self._on_reset_global_position_properties()


func _on_reset_global_position_properties() -> void:
	self.global_position = Vector2(0, 0)
	GameManager.camera_global_position = self.global_position
