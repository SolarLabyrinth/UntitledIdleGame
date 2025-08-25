extends Node2D

@export var uwus := 0.0
@export var uwusPerSecond := 0.0
@export var upgrades := {}

func _ready():
	Saves.load_game()

func _physics_process(delta: float) -> void:
	GameState.uwus += GameState.uwusPerSecond * delta

func _on_save_game_timer_timeout() -> void:
	Saves.save_game()
