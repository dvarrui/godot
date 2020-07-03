extends RigidBody2D

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	# Check collisions
	for body in get_colliding_bodies():
		if body.is_in_group("block"):
			body.queue_free()

func _on_visibility_screen_exited():
	get_tree().quit()