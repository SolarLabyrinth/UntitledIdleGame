extends CPUParticles2D
class_name BackgroundUwU

const BGUWUS = preload("res://scenes/background_uwu.tscn")

static func create(count: int):
	var emitter = BGUWUS.instantiate()
	emitter.amount = count
	emitter.emitting = true
	return emitter

func stop():
	emitting = false
	await finished
	queue_free()
