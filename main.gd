extends Node2D

@onready var thing_to_click: TextureButton = $ThingTOClick
@onready var rich_text_label: RichTextLabel = $RichTextLabel
@onready var item_list: ItemList = $ItemList
@onready var upgradesList: Control = $Control
@onready var rich_text_label_2: RichTextLabel = $RichTextLabel2
@onready var particles: Node = $Particles
@onready var bg_uwus: CPUParticles2D = $CPUParticles2D
@onready var bg_uwus_parent: Node = $BGUwUs

var currency := 0.0:
	get():
		return currency
	set(value):
		if rich_text_label:
			rich_text_label.text = "UwUs: " + str(int(floor(value)))
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

var current_bguwus = 0

const BGUWUS = preload("res://scenes/bguwus.tscn")

func _physics_process(delta: float) -> void:
	currency += uwusPerSecond * delta
	for child: Upgrade in upgradesList.get_children():
		child.disabled = child.cost > currency
		child.unknown = child.ups / (uwusPerSecond+1) > 5

	var desired_bguwus = max(roundi(log(uwusPerSecond)), 1)
	if(current_bguwus != desired_bguwus):
		for uwu in bg_uwus_parent.get_children():
			uwu.stop()
		var emitter = BGUWUS.instantiate()
		emitter.amount = desired_bguwus
		emitter.emitting = true
		bg_uwus_parent.add_child(emitter)
		current_bguwus = desired_bguwus

const EMITTER := preload("res://scenes/uwu_emitter.tscn")

func _on_thing_to_click_pressed() -> void:
	currency += 1
	var emitter = EMITTER.instantiate()
	
	var pos := get_global_mouse_position()
	emitter.emitting = true
	particles.add_child(emitter)
	emitter.global_position = pos
	
	
	var tween = get_tree().create_tween().bind_node(thing_to_click)
	
	var defaultScale = Vector2(4.0,4.0)
	var newX = min(thing_to_click.scale.x * 1.25, 5)
	var newY = min(thing_to_click.scale.y * 1.25, 5)
	var newScale =  Vector2(newX, newY)
	
	#var newScale = log()
	
	tween.tween_property(thing_to_click, "scale", newScale, 0.1)
	tween.tween_property(thing_to_click, "scale", defaultScale, 0.1)

func _on_upgrade_1_upgrade_pressed(upgrade: Upgrade) -> void:
	if(currency >= upgrade.cost):
		currency -= upgrade.cost;
		uwusPerSecond += upgrade.ups
		upgrade.cost *= 1.1
