extends CPUParticles2D

func stop():
	emitting = false
	await finished
	queue_free()
