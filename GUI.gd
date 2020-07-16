extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$new_game.connect("pressed", self, "btn_new_game")
	$continue.connect("pressed", self, "btn_continue")
	$exit.connect("pressed", self, "btn_exit")


func btn_new_game():
	get_tree().change_scene("res://Main.tscn")
	
func btn_continue():
	pass
func btn_exit():
	pass
