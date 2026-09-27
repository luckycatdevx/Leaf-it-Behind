extends Control

var sav = SaveManager

func get_timer_cost() -> int:
	return sav.increase_timer + 5

func get_money_cost() -> int:
	return sav.increase_money + 2

func _ready() -> void:
	update_ui()
	if sav.teddy_cat == true:
		$Teddy.text = 'Press "Home"'
		$Teddy.disabled = true

func update_ui() -> void:
	$Money2.text = str("Money: ", sav.money)
	$Timer/Text2.text = str(sav.increase_timer, " > ", sav.increase_timer + 5)
	$Money/Text2.text = str(sav.increase_money, " > ", sav.increase_money + 2)
	$Timer.text = str("Bay: ", get_timer_cost())
	$Money.text = str("Bay: ", get_money_cost())

func _process(delta: float) -> void:
	$Background/Layer.motion_offset += Vector2(0.25, 0.25)
	
	if sav.teddy_cat:
		var hue = fposmod(Time.get_ticks_msec() / 1000.0 * 0.5, 1.0)
		$Teddy.modulate = Color.from_hsv(hue, 1.0, 1.0)

func _on_timer_pressed() -> void:
	var current_cost = get_timer_cost()
	if sav.money >= current_cost:
		if not SaveManager.ach_frist_upgrade:
			SaveManager.ach_frist_upgrade = true
			SaveManager.save_ach()
			Transition.show_ach("Frist Upgrade")
		
		sav.increase_timer += 5
		sav.money -= current_cost
		sav.save_game()
		update_ui()
		$Upgrade.play()
	else:
		$Ab.play()

func _on_money_pressed() -> void:
	var current_cost = get_money_cost()
	if sav.money >= current_cost:
		if not SaveManager.ach_frist_upgrade:
			SaveManager.ach_frist_upgrade = true
			SaveManager.save_ach()
			Transition.show_ach("Frist Upgrade")
		
		sav.increase_money += 2
		sav.money -= current_cost
		sav.save_game()
		update_ui()
		$Upgrade.play()
	else:
		$Ab.play()

func _on_teddy_pressed() -> void:
	if sav.money >= 1:
		if not sav.ach_frist_upgrade:
			sav.ach_frist_upgrade = true
			sav.save_ach()
			Transition.show_ach("Frist Upgrade")
		sav.teddy_cat = true
		sav.money -= 1
		sav.save_game()
		update_ui()
		$Teddy.text = 'Press "Home"'
		$Teddy.disabled = true
		$Upgrade.play()
	else:
		$Ab.play()

func _on_back_pressed() -> void:
	Transition.change_scene("res://src/main_menu.tscn")

func _on_music_finished() -> void:
	$Music.play()
