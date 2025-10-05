extends Camera2D


@export var target: Node2D


const base_height: float = 90


func _ready() -> void:
	self.global_position.y = self.base_height
	self.global_position.x = 160


func _process(_delta: float) -> void:
	if target == null:
		pass
	
	if target.global_position.y < self.base_height:
		self.global_position.y = target.global_position.y
