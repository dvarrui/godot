extends Node2D

# Player explosion (Big effect)
func _ready():
	var items = [ $fire, $fire/pieces, $fire/smoke, $fire/smoke2 ]
	for item in items:
		item.visible = true
		item.one_shot = true
		item.emitting = true
	$timer.start(max($fire.lifetime, $fire/pieces.lifetime) + 0.5)

func _on_timer_timeout():
	queue_free()
