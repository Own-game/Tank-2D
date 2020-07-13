extends Sprite



func _process(delta):
		look_at(G.player_position)
		rotation += PI/2
