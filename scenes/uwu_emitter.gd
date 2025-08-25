extends CPUParticles2D
class_name UWUEmitter

const EMITTER := preload("res://scenes/uwu_emitter.tscn")

static func create():
	var emitter = EMITTER.instantiate()
	emitter.emitting = true
	return emitter

func _on_finished() -> void:
	queue_free()
