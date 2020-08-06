extends Node

# states/fall
var host = null
var prev = {}
var post = {}

func enter(_host):
	host = _host
	prev["pos"] = host.position
	prev["coord"] = host.get_cell_coord()
	prev["tile"] = host.get_cell_id(prev["coord"])
	post["pos"] = host.position + Vector2(0, 48+24)
	post["coord"] = host.get_cell_coord() + Vector2(0,2)
	post["tile"] = host.get_cell_id(post["coord"])

func exit(next_state):
	host.change_to(next_state)

# Optional handler functions for game loop events
func update(delta):
	var motion = Vector2(0,1) * host.speed_fall * delta
	host.move_and_collide(motion)
	if host.position.y >= post["pos"].y:
		# Down stairs
		host.set_height(host.height - 1)
		exit("move")

#func physics_process(delta):
#	return delta

func input(event):
	return event

func unhandled_input(event):
	return event

#func unhandled_key_input(event):
#	return event

#func notification(what, flag = false):
#	return [what, flag]