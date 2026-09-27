extends Control

func _input(event: InputEvent) -> void:
	if Input.is_anything_pressed():
		$Animation.speed_scale = 4

func _on_animation_animation_finished(anim_name: StringName) -> void:
	Transition.change_scene("res://src/main_menu.tscn")
