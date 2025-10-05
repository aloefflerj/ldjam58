extends Node


signal budget_updated(new_budget)

const initial_dialog_text_message: String = "ERROR!"

var soundtrack_game_scene = preload("res://scenes/Itens/soundtrack.tscn")
var game_over_scene = preload("res://scenes/game_over.tscn")
var player_budget: int = 0
var power_up_jump_multiply: float = 1.00
var player_dialog_text: String = self.initial_dialog_text_message


func _ready() -> void:
	self._play_soundtrack()


func end_game() -> void:
	var game_over_instance = game_over_scene.instantiate()
	
	get_tree().root.add_child(game_over_instance)


func increase_budget(value: int) -> void:
	self.player_budget += value
	budget_updated.emit(self.player_budget)


func increase_power_up_jump_multiply(multiply_value: float = 0.25) -> void:
	self.power_up_jump_multiply += multiply_value


func reset_player_dialog_text() -> void:
	self.player_dialog_text = self.initial_dialog_text_message


func _play_soundtrack() -> void:
	var soundtrack = soundtrack_game_scene.instantiate()
	
	get_tree().root.call_deferred("add_child", soundtrack)
