extends CPUParticles2D

func stop():
	print('here1')
	emitting = false
	print('here2')
	await finished
	print('here3')
	queue_free()
	print('here4')
