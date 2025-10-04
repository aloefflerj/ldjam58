extends Area2D

func _ready() -> void:
	body_entered.connect(_on_body_entered)


func _on_body_entered(body: CharacterBody2D) -> void:
	if body.is_in_group("player"):
		body.velocity.y = -350
		
		self.get_parent().queue_free()
