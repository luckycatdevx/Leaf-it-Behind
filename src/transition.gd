extends CanvasLayer

@onready var animation: AnimationPlayer = $Animation

func _ready() -> void:
	$FPS.hide()

func _process(delta: float) -> void:
	if $FPS.visible == true:
		$FPS.text = str("FPS ", int(Engine.get_frames_per_second()))
	if SaveManager.money >= 500 and not SaveManager.ach_more_money:
		SaveManager.ach_more_money = true
		SaveManager.save_ach()
		show_ach("More Money")

func show_ach(ach_name: String):
	$Animation3.play("Ach")
	$Ach/Text.text = str(ach_name)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			Input.set_custom_mouse_cursor(preload("res://spr/hand_on.png"), Input.CURSOR_ARROW, Vector2(32, 32))
		else:
			Input.set_custom_mouse_cursor(preload("res://spr/hand_off.png"), Input.CURSOR_ARROW, Vector2(32, 32))

	if Input.is_action_just_pressed("full_screen"):
		var current_mode = DisplayServer.window_get_mode()
		if current_mode == DisplayServer.WINDOW_MODE_WINDOWED:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

	if Input.is_action_pressed("quit"):
		$Animation2.play("quitting")
	else:
		$Animation2.play("RESET")

	if Input.is_action_just_pressed("show_fps"):
		$FPS.visible = !$FPS.visible

	if Input.is_action_just_pressed("secret_room") and SaveManager.teddy_cat == true:
		change_scene("res://src/secret_room.tscn")

func change_scene(target: String):
	animation.play("fade")
	await animation.animation_finished
	get_tree().paused = false
	get_tree().change_scene_to_file(target)
	animation.play_backwards("fade")

func reload_scene():
	animation.play("fade")
	await animation.animation_finished
	get_tree().paused = false
	get_tree().reload_current_scene()
	animation.play_backwards("fade")

func quit():
	animation.play("fade")
	await get_tree().create_timer(0.55).timeout
	get_tree().quit()

func _on_animation_2_animation_finished(anim_name: StringName) -> void:
	if anim_name == "quitting":
		get_tree().quit()
