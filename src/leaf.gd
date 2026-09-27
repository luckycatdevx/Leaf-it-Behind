extends Area2D

var is_dragging = false
var drag_speed: float = 25.0

func _ready() -> void:
	$Sprite.texture = load("res://spr/leaf_" + str(randi_range(1, 4)) + ".png")
	$Sprite.rotation_degrees = randf_range(-360, 360)
	await get_tree().create_timer(0.2).timeout
	$Animation.play("Idle")

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if not event.pressed:
			is_dragging = false

func _physics_process(delta: float) -> void:
	if is_dragging:
		var target_pos = get_global_mouse_position()
		global_position = global_position.lerp(target_pos, drag_speed * delta)

	var screen_size = get_viewport_rect().size
	global_position.x = clamp(global_position.x, 20, screen_size.x - 20)
	global_position.y = clamp(global_position.y, 20, screen_size.y - 20)

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			is_dragging = true
			$Sound.play()
