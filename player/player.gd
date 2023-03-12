extends CharacterBody2D

const SPEED := 150.0

var testingobject = preload("res://objects/test.tscn")

func _physics_process(delta):
	if Input.is_action_just_pressed("fire_primary"):
		var t = testingobject.instantiate()
		t.rotation = rotation
		t.position = position
		get_parent().add_child(t)
	
	var direction := Input.get_vector("foot_left", "foot_right", "foot_up", "foot_down")
	if direction:
		velocity = direction * SPEED
	else:
		velocity = Vector2(0,0)
	
	look_at(get_global_mouse_position())
	move_and_slide()
