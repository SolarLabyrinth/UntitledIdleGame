extends VBoxContainer
class_name UpgradesList

@onready var upgrades_list: VBoxContainer = $"."

var upgrades: Array[Upgrade] = []

func _ready() -> void:
	for child in upgrades_list.get_children():
		if child is Upgrade:
			upgrades.push_back(child as Upgrade)

func get_uwus_per_second() -> float:
	var ups = 0.0;
	for child in upgrades:
		child.ups * child.count
	return ups
