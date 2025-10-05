extends Node2D


@onready var sound_player: AudioStreamPlayer2D = $SoundPlayer
@onready var player: CharacterBody2D = %Player
var dialog = preload("res://scenes/UI/player_dialog_balloon.tscn") 


func _ready() -> void:
	self._handle_dialog()


func _handle_dialog() -> void:
	self._handle_player_dialog_text("[font_size=10]I want to have a bike")
	self._handle_instance_dialog()


func _handle_player_dialog_text(text: String) -> void:
	GameManager.player_dialog_text = text


func _handle_instance_dialog() -> void:
	var dialog_instance = dialog.instantiate()
	player.add_child(dialog_instance)
