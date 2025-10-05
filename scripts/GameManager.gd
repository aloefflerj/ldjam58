extends Node


signal budget_updated(new_budget)
signal end_game_started(value)


const initial_dialog_text_message: String = "ERROR!"


var soundtrack_game_scene = preload("res://scenes/Itens/soundtrack.tscn")
var player_budget: int = 0
var power_up_jump_multiply: float = 1.00
var player_dialog_text: String = self.initial_dialog_text_message
var is_game_ended: bool = false


func _ready() -> void:
	self._play_soundtrack()


func end_game() -> void:
	self.is_game_ended = true
	self.end_game_started.emit(self.is_game_ended)


func increase_budget(value: int) -> void:
	self.player_budget += value
	budget_updated.emit(self.player_budget)


func increase_power_up_jump_multiply(multiply_value: float = 0.25) -> void:
	self.power_up_jump_multiply += multiply_value


func reset_player_dialog_text() -> void:
	self.player_dialog_text = self.initial_dialog_text_message


func handle_game_pause(paused: bool) -> void:
	get_tree().paused = paused


func handle_base_mechanics() -> void:
	GameManager.player_budget = 0
	GameManager.power_up_jump_multiply = 1
	GameManager.is_game_ended = false


func _play_soundtrack() -> void:
	var soundtrack = soundtrack_game_scene.instantiate()
	
	get_tree().root.call_deferred("add_child", soundtrack)
