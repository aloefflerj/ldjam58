extends Node


const MAIN_THEME = 'main_theme'


var SOUNDS: Dictionary = {
	MAIN_THEME: preload("res://assets/sfx/I want to have a bike.wav")
}


func play_clip(audio_player: AudioStreamPlayer2D, clip_key: String) -> void:
	if SOUNDS.has(clip_key) == false:
		return

	audio_player.stream = SOUNDS[clip_key]
	audio_player.play()
