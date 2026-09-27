extends Node

const save_path = "user://save.sav"
const ach_path = "user://ach.sav"

var increase_timer: int = 5
var increase_money: int = 2
var teddy_cat = false
var money: int = 999

var ach_frist_upgrade = false
var ach_more_money = false
var ach_best_time = false
var ach_secret_room = false

func _ready() -> void:
	load_game()
	load_ach()

func save_game():
	var save_data = {
		"increase_timer": increase_timer,
		"increase_money": increase_money,
		"teddy_cat": teddy_cat,
		"money": money
	}
	
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	if file:
		file.store_string(JSON.stringify(save_data))
		file.close()

func load_game() -> void:
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	if file:
		var json = JSON.new()
		if json.parse(file.get_as_text()) == OK:
			var data = json.get_data()
			if data is Dictionary:
				increase_timer = data.get("increase_timer")
				increase_money = data.get("increase_money")
				teddy_cat = data.get("teddy_cat")
				money = data.get("money")
		file.close()

func save_ach():
	var ach_data = {
		"frist_upgrade": ach_frist_upgrade,
		"more_money": ach_more_money,
		"best_time": ach_best_time,
		"secret_room": ach_secret_room
	}
	var file = FileAccess.open(ach_path, FileAccess.WRITE)
	if file:
		file.store_string(JSON.stringify(ach_data))
		file.close()

func load_ach() -> void:
	var file = FileAccess.open(ach_path, FileAccess.WRITE)
	if file:
		var json = JSON.new()
		if json.parse(file.get_as_text()) == OK:
			var data = json.get_data()
			if data is Dictionary:
				ach_frist_upgrade = data.get("frist_upgrade")
				ach_more_money = data.get("more_money")
				ach_best_time = data.get("best_time")
				ach_secret_room = data.get("secret_room")
		file.close()
