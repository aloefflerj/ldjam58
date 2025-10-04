extends Node2D

func _ready() -> void:
	get_tree().paused = true
	
	GameManager.player_budget = 0


func _on_retry_pressed() -> void:
	get_tree().paused = false	
	queue_free()
	get_tree().call_deferred("change_scene_to_file", "res://scenes/Game.tscn")
