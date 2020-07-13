extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var dir = Vector2()
# Called when the node enters the scene tree for the first time.
func _process(delta):
	look_at(get_global_mouse_position()) 
	rotation += PI/2
	if Input.is_action_just_pressed("ui_select"):
		$AnimatedSprite.show()
		$AnimatedSprite.play()



func _on_AnimatedSprite_animation_finished():
	$AnimatedSprite.stop()
	$AnimatedSprite.hide()
