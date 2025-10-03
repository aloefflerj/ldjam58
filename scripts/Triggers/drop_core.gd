extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group('TriggerDropCore'):
		print('Success, you drop a core!!!')
