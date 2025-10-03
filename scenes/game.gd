extends Node2D

@onready var sound_player: AudioStreamPlayer2D = $SoundPlayer

func _ready() -> void:
	SoundManager.play_clip(sound_player, SoundManager.LEVEL_MUSIC)
