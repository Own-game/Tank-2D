extends Area2D

signal hit

export var rot_speed = 1.5
export var speed = 200
var screen_size

func _ready():
	screen_size = get_viewport_rect().size
		
func _process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("ui_left"):
		rotation -= 0.1
	if Input.is_action_pressed("ui_right"):
		rotation += 0.1
	if Input.is_action_pressed("ui_down"):
		velocity = Vector2(-1, 0).rotated(rotation)
	if Input.is_action_pressed("ui_up"):
		velocity = Vector2(1, 0).rotated(rotation)
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimationPlayer.play("drive")
	else:
		$AnimationPlayer.stop()
	
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
	G.player_position = position
	
	if Input.is_action_just_pressed("ui_select"):
		$AnimationPlayer.play("shoot")


func _on_player_body_entered(body):
	hide()
	emit_signal("hit")
	$CollisionShape2D.set_deferred("disabled", true)
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
	
