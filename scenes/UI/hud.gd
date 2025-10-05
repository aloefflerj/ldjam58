extends CanvasLayer


func _ready() -> void:
	$Retry.hide()
	$RetryButtonLabel.hide()
	
	GameManager.budget_updated.connect(on_budget_updated)
	GameManager.end_game_started.connect(_handle_retry_button)
	
	on_budget_updated(GameManager.player_budget)
	_handle_retry_button(GameManager.is_game_ended)


func on_budget_updated(new_budget: int) -> void:
	$BudgeLabel.text = "[b][font_size=12
][color=#a3c1b7][wave amp=30.0 freq=3.0 connected=1]Bike Budget: $" + str(new_budget) + "[/wave][/color][/font_size][/b]"


func _on_retry_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://scenes/Game.tscn")
	self._on_retry_reset_base_mechanics()


func _on_retry_reset_base_mechanics() -> void:
	GameManager.handle_base_mechanics()


func _handle_retry_button(is_show: bool = false) -> void:
	if is_show:
		$Retry.show()
		$RetryButtonLabel.show()
	else:
		$Retry.hide()
		$RetryButtonLabel.hide()
