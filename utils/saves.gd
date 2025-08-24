extends Node
class_name Saves

static var save_path := "user://player_data.json"

static func has_save_game():
	return FileAccess.file_exists(save_path)

static func save_to_file(uwus:int, ups:int, upgrades: Dictionary):
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	var json = JSON.stringify({
		uwus = uwus,
		ups = ups,
		upgrades = upgrades
	})
	file.store_string(json)
	file.close()

static func delete_save():
	DirAccess.open("user://").remove("player_data.json")
	#var errror = DirAccess.remove_absolute(save_path)
	#print(errror)

static func load_game():
	var file = FileAccess.open(save_path, FileAccess.READ)
	var content = file.get_as_text()
	file.close()
	var json = JSON.new()
	json.parse(content)
	var dict: Dictionary = json.data
	return dict
