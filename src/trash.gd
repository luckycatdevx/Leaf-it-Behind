extends Area2D

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("leaf"):
		area.queue_free()
		$Animation.play("Take")
		$Sound.play()

func _on_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Take":
		$Animation.play("Idle")
