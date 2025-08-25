extends Node2D

@onready var uwusLabel: RichTextLabel = $UwUsLabel
@onready var upsLabel: RichTextLabel = $UwUsPerSecondLabel
@onready var bg_uwus: Node = $BGUwUs

var current_bguwus = 0

func _physics_process(_delta: float) -> void:
	uwusLabel.text = "UwUs: " + str(int(floor(GameState.uwus)))
	upsLabel.text = "Uwu's Per Second: " + str(GameState.uwusPerSecond)
	
	var desired_bguwus = max(roundi(log(GameState.uwusPerSecond)), 1) - 1
	if (current_bguwus != desired_bguwus):
		for uwu in bg_uwus.get_children():
			uwu.stop()
		var emitter = BackgroundUwU.create(desired_bguwus)
		bg_uwus.add_child(emitter)
		current_bguwus = desired_bguwus

func _on_reset_button_pressed() -> void:
	Saves.reset_game()
