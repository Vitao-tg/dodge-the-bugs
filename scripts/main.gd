extends Node2D

@export var bug_scene : PackedScene
var score 

func Game_over() -> void:
	$BugTimer.stop()
	$ScoreTimer.stop()
	$Hud.show_game_over()
	$bg_music.stop()
	$Game_Over_Sound.play()
	
func new_game():
	$StartTimer.start()
	$player.start_pos($Start_Pos.position)
	score = 0
	$Hud.update_score(score)
	$Hud.show_message("Get ready!")
	get_tree().call_group("bugs","queue_free")
	$bg_music.play()
	

func _on_start_timer_timeout() -> void:
	$BugTimer.start()
	$ScoreTimer.start()
	

func _on_score_timer_timeout() -> void:
	score += 1
	$Hud.update_score(score)

func _on_bug_timer_timeout() -> void:
	var bug = bug_scene.instantiate()
	var bug_loc = $BugPath/BugPathLocation
	bug_loc.progress_ratio = randf()
	
	var direction = bug_loc.rotation + PI / 2
	bug.position = bug_loc.position
	direction += randf_range(-PI /4, PI / 4)
	bug.rotation = direction
	
	var velocity = Vector2(randf_range(150.0,250.0), 0.0)
	bug.linear_velocity = velocity.rotated(direction)
	add_child(bug)
	
