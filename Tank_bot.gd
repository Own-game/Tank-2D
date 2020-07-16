extends Area2D

var speed = Vector2(30,0)

func _ready():
	rotation += PI/2
	

func _physics_process(delta):
	
	  
	position += speed.rotated(rotation - PI/2) * delta
	
