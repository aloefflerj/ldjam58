extends Node


var game_over_scene = preload("res://scenes/game_over.tscn")
var player_budget: int = 0


func end_game() -> void:
	var game_over_instance = game_over_scene.instantiate()
	
	get_tree().root.add_child(game_over_instance)

func increase_budget(value: int) -> void:
	self.player_budget += value
	print("Your budget is $", self.player_budget, " dollars more")
	
