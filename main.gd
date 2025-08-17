extends Node2D

@onready var thing_to_click: TextureButton = $ThingTOClick
@onready var rich_text_label: RichTextLabel = $RichTextLabel
@onready var item_list: ItemList = $ItemList
@onready var upgradesList: Control = $Control
@onready var rich_text_label_2: RichTextLabel = $RichTextLabel2

var currency := 0.0:
	get():
		return currency
	set(value):
		if rich_text_label:
			rich_text_label.text = "Currency: " + str(int(floor(value)))
		currency = value

var uwusPerSecond := 0.0:
	get():
		return uwusPerSecond
	set(value):
		if rich_text_label_2:
			rich_text_label_2.text = "Uwu's Per Second: " + str(value)
		uwusPerSecond = value

func _ready():
	currency = currency
	uwusPerSecond = uwusPerSecond
	#item_list.set_item_text()

func _physics_process(delta: float) -> void:
	currency += uwusPerSecond * delta

func _on_thing_to_click_pressed() -> void:
	currency += 1
	pass # Replace with function body.

func _on_upgrade_1_upgrade_pressed(upgrade: Upgrade) -> void:
	if(currency >= upgrade.cost):
		currency -= upgrade.cost;
		uwusPerSecond += upgrade.ups
		upgrade.cost *= 1.1
