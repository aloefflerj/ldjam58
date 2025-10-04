extends Area2D


func _ready() -> void:
	body_entered.connect(self._on_body_entered)


func _on_body_entered(body: CharacterBody2D) -> void:
	if body.is_in_group("player"):
		GameManager.increase_power_up_jump_multiply()
		queue_free()
