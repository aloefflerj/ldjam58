extends Area2D

@export var score_value: int = 100

func _ready() -> void:
	body_entered.connect(_on_body_entered)


func _on_body_entered(body: CharacterBody2D) -> void:
	if body.is_in_group("player"):
		print("has collision with collectible")

		queue_free()
