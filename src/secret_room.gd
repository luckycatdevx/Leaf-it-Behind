extends Control

var mouse_in = false
var press = false

func _ready() -> void:
	if not SaveManager.ach_secret_room:
		SaveManager.ach_secret_room = true
		SaveManager.save_ach()
		Transition.show_ach("Secret Room")
	$Money.text = str(SaveManager.money)
	$IMoney.text = str(SaveManager.increase_money)
	$ITimer.text = str(SaveManager.increase_timer)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			$Animation.play("Wake Up")

func _on_cat_mouse_entered() -> void:
	mouse_in = true

func _on_cat_mouse_exited() -> void:
	mouse_in = false

func _on_money_text_changed(new_text) -> void:
	SaveManager.money = new_text
	SaveManager.save_game()

func _on_i_money_text_changed(new_text) -> void:
	SaveManager.increase_money = new_text
	SaveManager.save_game()

func _on_i_timer_text_changed(new_text) -> void:
	SaveManager.increase_timer = new_text
	SaveManager.save_game()

func _on_animation_2_animation_finished(anim_name: String) -> void:
	$Animation2.play("2")

func _on_music_finished() -> void:
	$Music.play()
