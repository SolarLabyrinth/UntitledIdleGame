extends Node2D
class_name Face

@onready var face_btn: TextureButton = $FaceBtn
@onready var particles: Node = $Particles

func _on_face_btn_pressed() -> void:
	GameState.uwus += 1
	
	var emitter = UWUEmitter.create()
	particles.add_child(emitter)
	emitter.global_position = get_global_mouse_position()
	
	var tween = get_tree().create_tween().bind_node(face_btn)
	
	var newScale =  Vector2(
		min(face_btn.scale.x * 1.25, 1.25),
		min(face_btn.scale.y * 1.25, 1.25)
	)
	tween.tween_property(face_btn, "scale", newScale, 0.1)
	tween.tween_property(face_btn, "scale", Vector2(1.0, 1.0), 0.1)
