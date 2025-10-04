extends CanvasLayer


func _ready() -> void:
	GameManager.budget_updated.connect(on_budget_updated)
	
	on_budget_updated(GameManager.player_budget)


func on_budget_updated(new_budget: int) -> void:
	$BudgeLabel.text = "Budget: $" + str(new_budget)
