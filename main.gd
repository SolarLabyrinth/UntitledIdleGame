extends Node2D

@onready var uwusLabel: RichTextLabel = $UwUsLabel
@onready var upsLabel: RichTextLabel = $UwUsPerSecondLabel
@onready var upgrades_list: UpgradesList = $UpgradesList
@onready var bg_uwus: Node = $BGUwUs

func _ready():
	load_game()

func save_game():
	var upgrades = {}
	for child in upgrades_list.upgrades:
		upgrades[child.text] = child.count
	Saves.save_to_file(GameState.uwus, GameState.uwusPerSecond, upgrades)
	
func load_game():
	if not Saves.has_save_game():
		save_game()
	var save = Saves.load_game()
		
	var elapsedSeconds = Time.get_unix_time_from_system() - save.timestamp
	GameState.uwus = save.uwus + save.ups * elapsedSeconds
	GameState.uwusPerSecond = save.ups
	for child in upgrades_list.upgrades:
		if(save.upgrades.has(child.text)):
			child.count = save.upgrades[child.text]
		else:
			child.count = 0

var current_bguwus = 0

func _physics_process(delta: float) -> void:
	GameState.uwus += GameState.uwusPerSecond * delta
	uwusLabel.text = "UwUs: " + str(int(floor(GameState.uwus)))
	upsLabel.text = "Uwu's Per Second: " + str(GameState.uwusPerSecond)
	
	var desired_bguwus = max(roundi(log(GameState.uwusPerSecond)), 1)
	if(current_bguwus != desired_bguwus):
		for uwu in bg_uwus.get_children():
			uwu.stop()
		var emitter = BackgroundUwU.create(desired_bguwus)
		bg_uwus.add_child(emitter)
		current_bguwus = desired_bguwus

func _on_timer_timeout() -> void:
	save_game()

func _on_reset_button_pressed() -> void:
	Saves.delete_save()	
	GameState.uwus = 0
	GameState.uwusPerSecond = 0
	for child in upgrades_list.upgrades:
		child.count = 0
	load_game()
