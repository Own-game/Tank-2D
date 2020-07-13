extends CanvasLayer

signal start_game

func show_message(text):
	$Massage.text = text
	$Massage.show()
	$MessageTimer.start()
func show_game_over():
	show_message("Game Over")
	yield($MessageTimer, "timeout")
	
	$Massage.text = "Dodge the\nCreeps!"
	$Massage.show()
	yield(get_tree().create_timer(1),"timeout")
	$StartButton.show()
func update_score(score):
	$ScoreLabel.text = str(score)


func _on_MessageTimer_timeout():
	$Massage.hide()


func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")