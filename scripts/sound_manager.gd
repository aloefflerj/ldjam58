extends Node

const LEVEL_MUSIC = 'level_music'
const HIT = 'hit'

var SOUNDS: Dictionary = {
	LEVEL_MUSIC: preload("res://assets/sfx/shop-song.wav"),
	HIT: preload("res://assets/sfx/hit.wav")
}

func play_clip(player: AudioStreamPlayer2D, clip_key: String) -> void:
	if SOUNDS.has(clip_key) == false:
		return
		
	player.stream = SOUNDS[clip_key]
	player.play()
