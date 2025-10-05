extends AnimatedSprite2D

enum EnemyState {IDLE, PUNCH, HIT}

var _state: EnemyState = EnemyState.IDLE

func _ready() -> void:
	pass # Replace with function body.

func set_state(new_state: EnemyState) -> void:
	if new_state == _state:
		return
		
	_state = new_state
	
	match _state:
		EnemyState.IDLE:
			animation = "idle"
		EnemyState.PUNCH:
			animation = "punch"
		EnemyState.HIT:
			animation = "hit"

func _on_repel_spell_body_entered(body:Node2D) -> void:
	if (body.is_in_group("player")):
		set_state(EnemyState.PUNCH)


func _on_weakness_body_entered(body:Node2D) -> void:
	if (body.is_in_group("player")):
		set_state(EnemyState.HIT)
