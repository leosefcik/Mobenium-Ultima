# player_input.gd
extends MultiplayerSynchronizer

# Set via RPC to simulate is_action_just_pressed.
@export var shooting := false

# Synchronized property.
@export var direction := Vector2()

func _ready():
	# Only process for the local player.
	set_process(get_multiplayer_authority() == multiplayer.get_unique_id())


@rpc("call_local")
func shoot():
	shooting = true


func _process(delta):
	# Get the input direction and handle the movement/deceleration.
	direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if Input.is_action_just_pressed("ui_accept"):
		shoot.rpc()
