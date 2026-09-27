extends Control

@onready var click: AudioStreamPlayer = $Click

func _input(event: InputEvent) -> void:
	if $Animation.current_animation == "Animation 2":
		if Input.is_anything_pressed():
			$Animation.play("Animation 1")

func _on_start_pressed() -> void:
	click.play()
	Transition.change_scene("res://src/game.tscn")

func _on_shop_pressed() -> void:
	Transition.change_scene("res://src/shop.tscn")

func _on_ach_pressed() -> void:
	Transition.change_scene("res://src/shop.tscn")

func _on_options_pressed() -> void:
	click.play()
	$"Options Menu".show()

func _on_quit_pressed() -> void:
	click.play()
	Transition.quit()

func _on_itchio_pressed() -> void:
	click.play()
	OS.shell_open("https://luckycatdev.itch.io/")

func _on_you_tube_pressed() -> void:
	click.play()
	OS.shell_open("https://www.youtube.com/@luckycatdev")

func _on_kofi_pressed() -> void:
	click.play()
	OS.shell_open("https://ko-fi.com/luckycatdev")

func _on_english_pressed() -> void:
	click.play()
	TranslationServer.set_locale("en")

func _on_arabic_pressed() -> void:
	click.play()
	TranslationServer.set_locale("ar")

func _on_music_value_changed(value: float) -> void:
	var bus_index = AudioServer.get_bus_index("Music")
	if value <= 0:
		AudioServer.set_bus_mute(bus_index, true)
	else:
		AudioServer.set_bus_mute(bus_index, false)
		var db = linear_to_db(value / 80.0)
		AudioServer.set_bus_volume_db(bus_index, db)

func _on_sound_value_changed(value: float) -> void:
	var bus_index = AudioServer.get_bus_index("Sound")
	if value <= 0:
		AudioServer.set_bus_mute(bus_index, true)
	else:
		AudioServer.set_bus_mute(bus_index, false)
		var db = linear_to_db(value / 80.0)
		AudioServer.set_bus_volume_db(bus_index, db)

func _on_jam_pressed() -> void:
	OS.shell_open("https://itch.io/jam/cozy-fall-jam-2026")

func _on_music_2_pressed() -> void:
	OS.shell_open("https://chajamakesmusic.itch.io/")

func _on_sound_2_pressed() -> void:
	OS.shell_open("https://undertale.com/")

func _on_back_pressed() -> void:
	click.play()
	$"Options Menu".hide()

func _on_music_finished() -> void:
	$Music.play()
