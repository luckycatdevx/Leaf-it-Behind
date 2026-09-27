extends CanvasLayer

func _on_continue_pressed() -> void:
	$Click.play()
	get_tree().paused = false
	hide()

func _on_retry_pressed() -> void:
	$Click.play()
	Transition.reload_scene()

func _on_quit_to_menu_pressed() -> void:
	$Click.play()
	Transition.change_scene("res://src/main_menu.tscn")
