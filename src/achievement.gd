extends Control

var unlocked = preload("res://spr/unlocked.png")
var locked = preload("res://spr/locked.png")
var sav = SaveManager

func _ready() -> void:
	if sav.ach_frist_upgrade:
		$Ach1/Texture.texture = unlocked
	else:
		$Ach1/Texture.texture = locked
	if sav.ach_more_money:
		$Ach2/Texture.texture = unlocked
	else:
		$Ach2/Texture.texture = locked
	if sav.ach_best_time:
		$Ach3/Texture.texture = unlocked
	else:
		$Ach3/Texture.texture = locked
	if sav.ach_secret_room:
		$Ach4/Texture.texture = unlocked
	else:
		$Ach4/Texture.texture = locked

func _on_back_pressed() -> void:
	Transition.change_scene("res://src/main_menu.tscn")

func _on_music_finished() -> void:
	$Music.play()
