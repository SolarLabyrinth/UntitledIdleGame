extends Control
class_name Upgrade

signal upgrade_pressed(upgrade: Upgrade)

@onready var texture_button: TextureButton = $TextureButton
@onready var rich_text_label: RichTextLabel = $Control/RichTextLabel
@onready var rich_text_label_2: RichTextLabel = $Control/RichTextLabel2
@onready var control: Control = $Control

@export var disabled := false:
	get():
		return disabled
	set(value):
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

@export var text := ''
@export var cost := 0.0:
	get():
		return cost
	set(value):
		#value = value / 10.0
		setCostLabel(str(value))
		cost = value
		#return value

func setCostLabel(cost: String):
	if rich_text_label_2:
		rich_text_label_2.text = "Cost: " + cost

@export var ups := 1

func _ready() -> void:
	rich_text_label.text = text
	cost = cost / 10.0
	unknown =unknown


func _on_texture_button_pressed() -> void:
	upgrade_pressed.emit(self)
	pass # Replace with function body.


func _on_texture_button_button_down() -> void:
	rich_text_label.position.y += 4
	rich_text_label_2.position.y += 4
	pass # Replace with function body.

func _on_texture_button_button_up() -> void:
	rich_text_label.position.y -= 4
	rich_text_label_2.position.y -= 4
	pass # Replace with function body.
