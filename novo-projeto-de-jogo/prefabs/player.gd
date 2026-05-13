extends Area2D

const SPEED := 400

func _ready():
	pass

func _process(delta):
	var velocity = Input.get_vector("move_left","move_right","move_up","move_down")
	
	if velocity.length()>0:
		velocity = velocity.normalized() * SPEED
		
	position += velocity + delta
