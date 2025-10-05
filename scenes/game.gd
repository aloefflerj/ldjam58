extends Node2D


@onready var sound_player: AudioStreamPlayer2D = $SoundPlayer
@onready var player: CharacterBody2D = %Player
var dialog = preload("res://scenes/UI/player_dialog_balloon.tscn") 

func _ready() -> void:
	self._handle_dialog()


func _handle_dialog() -> void:
	var dialog_instance = dialog.instantiate()
	player.add_child(dialog_instance)
