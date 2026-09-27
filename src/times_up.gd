extends CanvasLayer

func _on_retry_pressed() -> void:
	$Click.play()
	Transition.reload_scene()

func _on_quit_to_menu_pressed() -> void:
	$Click.play()
	Transition.change_scene("res://src/main_menu.tscn")

func _on_animation_animation_started(anim_name: StringName) -> void:
	if anim_name == "Time Up":
		SaveManager.save_game()
