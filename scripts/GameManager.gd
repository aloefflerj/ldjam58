extends Node


var game_over_scene = preload("res://scenes/game_over.tscn")


func end_game() -> void:
	var game_over_instance = game_over_scene.instantiate()
	
	get_tree().root.add_child(game_over_instance)
