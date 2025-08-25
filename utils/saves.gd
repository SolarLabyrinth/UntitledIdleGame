extends Node
class_name Saves

static var save_path := "user://player_data.json"

static func save_game():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	var json = JSON.stringify({
		uwus = GameState.uwus,
		ups = GameState.uwusPerSecond,
		upgrades = GameState.upgrades,
		timestamp = Time.get_unix_time_from_system(),
	})
	file.store_string(json)
	file.close()

static func load_file():
	var file = FileAccess.open(save_path, FileAccess.READ)
	var content = file.get_as_text()
	file.close()
	var dict: Dictionary = JSON.parse_string(content)
	return dict

static func load_game():
	if not FileAccess.file_exists(save_path):
		save_game()
	var save = load_file()
	
	var elapsedSeconds = Time.get_unix_time_from_system() - save.timestamp
	GameState.uwus = save.uwus + save.ups * elapsedSeconds
	GameState.uwusPerSecond = save.ups
	GameState.upgrades = save.upgrades

static func reset_game():
	DirAccess.remove_absolute(save_path)
	GameState.uwus = 0
	GameState.uwusPerSecond = 0
	GameState.upgrades = {}
