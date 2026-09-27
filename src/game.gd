extends Node2D

var leaf_scene = preload("res://src/leaf.tscn")
var timer = 20
var timer_speed = 1

var sav = SaveManager

func _ready() -> void:
	$UI/Increase.text = str("+ ", sav.increase_timer)
	$"Pause Menu".hide()
	for i in range(randi_range(4, 8)):
		var leaf_ins = leaf_scene.instantiate() as Node
		
		leaf_ins.position.x = randf_range(8, 368)
		leaf_ins.position.y = randf_range(8, 168)
		
		add_child(leaf_ins)

func _process(delta: float) -> void:
	$Background/Layer.motion_offset += Vector2(0.1, 0.1)
	$UI/Timer.text = str(int(timer))
	timer -= 0.01 * timer_speed

	if timer <= 0:
		$"Times Up/Animation".play("Time Up")
		get_tree().paused = true
	if timer >= 99 and not sav.ach_best_time:
		sav.ach_best_time = true
		sav.save_ach()
		Transition.show_ach("Best Time")

	if get_tree().get_nodes_in_group("leaf").size() == 0:
		sav.money += sav.increase_money
		sav.save_game()
		timer += sav.increase_timer
		timer_speed += 0.1
		$UI/Increase/Animation.play("Increase")
		$UI/Timer/Animation.speed_scale = timer_speed
		for i in range(randi_range(4, 8)):
			var leaf_ins = leaf_scene.instantiate() as Node
			
			leaf_ins.position.x = randf_range(8, 368)
			leaf_ins.position.y = randf_range(8, 168)
			
			add_child(leaf_ins)

func _on_area_1_mouse_entered() -> void:
	$Camera.position.x -= 10

func _on_area_1_mouse_exited() -> void:
	$Camera.position.x += 10

func _on_area_2_mouse_entered() -> void:
	$Camera.position.x += 10

func _on_area_2_mouse_exited() -> void:
	$Camera.position.x -= 10

func _on_area_3_mouse_entered() -> void:
	$Camera.position.y -= 10

func _on_area_3_mouse_exited() -> void:
	$Camera.position.y += 10

func _on_pause_pressed() -> void:
	$"Pause Menu".show()
	get_tree().paused = true

func _on_music_finished() -> void:
	$Music.play()
