extends Node2D


func _on_repel_spell_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$GoBackPlate.show()
