@tool
extends Control
class_name Upgrade

@onready var name_label: RichTextLabel = $Control/NameLabel
@onready var cost_label: RichTextLabel = $Control/CostLabel

@onready var plus_one_button: TextureButton = $PlusOneButton
@onready var plus_five_button: TextureButton = $PlusFiveButton

@export var count := 0
@export var base_cost := 0
@export var text := ''
@export var ups := 1

func _physics_process(delta: float) -> void:
	var is_one_disabled = get_price(1) > GameState.uwus;
	if(plus_one_button.disabled != is_one_disabled):
		plus_one_button.disabled = is_one_disabled
		
	var is_five_disabled = get_price(5) > GameState.uwus;
	if(plus_five_button.disabled != is_five_disabled):
		plus_five_button.disabled = is_five_disabled
	
	var is_hidden = ups / (GameState.uwusPerSecond+1) > 5
	if(is_hidden):
		name_label.text = "?"
		cost_label.text = "--"
		plus_one_button.disabled = true
		plus_five_button.disabled = true
	else:
		name_label.text = text + " (" + str(count) + ")"
		cost_label.text = "Cost: " + str(get_price(1))

func get_price(amount: int = 1):
	var total_cost = 0.0;
	for i in amount:
		total_cost += floori(base_cost * (1.1 ** (count + i)))
	return total_cost

func buy(amount: int):
	var total_cost = get_price(amount)
	if(GameState.uwus >= total_cost):
		GameState.uwus -= total_cost;
		GameState.uwusPerSecond += ups
		count += amount

func _on_plus_one_button_pressed() -> void:
	buy(1)
func _on_plus_five_button_pressed() -> void:
	buy(5)
