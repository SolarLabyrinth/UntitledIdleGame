extends Control
class_name Upgrade

signal upgrade_pressed(upgrade: Upgrade)

@onready var rich_text_label: RichTextLabel = $RichTextLabel
@onready var rich_text_label_2: RichTextLabel = $RichTextLabel2

@export var text := ''
@export var cost := 0.0:
	get():
		return cost
	set(value):
		#value = value / 10.0
		if rich_text_label_2:
			rich_text_label_2.text = "Cost: " + str(value)
		cost = value
		#return value

@export var ups := 1

func _ready() -> void:
	rich_text_label.text = text
	cost = cost / 10.0


func _on_texture_button_pressed() -> void:
	upgrade_pressed.emit(self)
	pass # Replace with function body.
