extends CanvasLayer

signal start_game

@onready var score_label: Label = $Control/ScoreLabel
@onready var massagelabel: Label = $Control/Massagelabel
@onready var message_timer: Timer = $messageTimer
@onready var start_button: Button = $Control/StartButton

func show_message (text):
	massagelabel.text = text
	massagelabel.show()
	message_timer.start()
	
func show_game_over():
	show_message("Game Over")
	await message_timer.timeout
	
	massagelabel.text = "Dodge the bugs"
	massagelabel.show()
	
	await get_tree().create_timer(1.0).timeout
	start_button.show()

func update_score(score):
	score_label.text = str(score)
	


func _on_start_button_pressed() -> void:
	start_button.hide()
	start_game.emit()

func _on_message_timer_timeout() -> void:
	massagelabel.hide()
