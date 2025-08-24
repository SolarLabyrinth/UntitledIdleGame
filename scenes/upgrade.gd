@tool
extends Control
class_name Upgrade

signal upgrade_pressed(upgrade: Upgrade)

@onready var texture_button: TextureButton = $PlusOneButton
@onready var rich_text_label: RichTextLabel = $Control/RichTextLabel
@onready var rich_text_label_2: RichTextLabel = $Control/RichTextLabel2
@onready var plus_five_button: TextureButton = $PlusFiveButton

@export var disabled := false:
	get():
		return disabled
	set(value):
		if texture_button:
			texture_button.disabled = value
		disabled = value

@export var unknown := true:
	get():
		return unknown
	set(value):
		if value:
			setCostLabel("--")
		else:
			setCostLabel(str(cost))
		unknown = value

@export var count := 0:
	set(value):
		count = value
		setNameLabel()
		setCostLabel(str(cost))

@export var base_cost := 0

@export var text := '':
	get():
		return text
	set(value):
		text = value
		setNameLabel()

@export var cost := 0.0:
	get():
		return floori(cost * 1.1 ** count)
	set(value):
		cost = value

func setNameLabel():
	if rich_text_label:
		rich_text_label.text = text + " (" + str(count) + ")"
func setCostLabel(label: String):
	if rich_text_label_2:
		rich_text_label_2.text = "Cost: " + label

@export var ups := 1

func _ready() -> void:
	rich_text_label.text = text
	unknown = unknown

func _on_texture_button_pressed() -> void:
	upgrade_pressed.emit(self)


func _on_plus_five_button_pressed() -> void:
	pass # Replace with function body.
