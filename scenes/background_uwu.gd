extends CPUParticles2D
class_name BackgroundUwU

const BGUWUS = preload("res://scenes/background_uwu.tscn")

static func create(amount: int):
	var emitter = BGUWUS.instantiate()
	emitter.amount = amount
	emitter.emitting = true
	return emitter

func stop():
	emitting = false
	await finished
	queue_free()
