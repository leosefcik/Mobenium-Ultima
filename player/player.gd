extends CharacterBody2D

const SPEED := 150.0

func _physics_process(delta):
	
	var direction := Input.get_vector("foot_left", "foot_right", "foot_up", "foot_down")
	if direction:
		velocity = direction * SPEED
	else:
		velocity = Vector2(0,0)
	
	look_at(get_global_mouse_position())
	move_and_slide()
