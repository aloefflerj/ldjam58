extends Node2D


func _ready() -> void:
	load_soundtrack()


func load_soundtrack() -> void:
	SoundManager.play_clip($AudioPlayer, SoundManager.MAIN_THEME)
