extends CanvasLayer


func _ready() -> void:
	# TODO make it show in a dynamic way
	# $Retry.hide()
	
	GameManager.budget_updated.connect(on_budget_updated)
	
	on_budget_updated(GameManager.player_budget)


func on_budget_updated(new_budget: int) -> void:
	$BudgeLabel.text = "Budget: $" + str(new_budget)


func _on_retry_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://scenes/Game.tscn")
