extends AnimatedSprite2D


func _ready() -> void:
	pass # Replace with function body.

enum NpcState {IDLE, HIT}

var _state: NpcState = NpcState.IDLE

func set_state(new_state: NpcState) -> void:
	if new_state == _state:
		return
		
	_state = new_state
	
	match _state:
		NpcState.IDLE:
			animation = "idle"
		NpcState.HIT:
			animation = "hit"

func _on_weakness_body_entered(body:Node2D) -> void:
	if (body.is_in_group("player")):
		set_state(NpcState.HIT)
