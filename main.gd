extends Node

@onready var UILayer = $UILayer
@onready var FPS = $UILayer/FPS

@export var MainMenuUI: PackedScene
@export var HostingUI: PackedScene
@export var SimpleUI: PackedScene

@onready var world = $World

const MAX_PLAYERS = 16

func _process(delta):
	# Show FPS
	FPS.text = str(Engine.get_frames_per_second())

func _ready():
	# You can save bandwidth by disabling server relay and peer notifications.
	multiplayer.server_relay = false

	# Automatically start the server in headless mode.
	if DisplayServer.get_name() == "headless":
		print("Automatically starting dedicated server.")
		host_server.call_deferred()
	
	# Start main menu
	var i
	i = HostingUI.instantiate()
	UILayer.add_child(i)
	i.host_server.connect(host_server)
	i.join_server.connect(join_server)

func host_server(port):
	# Start as server.
	var peer = ENetMultiplayerPeer.new()
	peer.create_server(int(port), MAX_PLAYERS)
	if peer.get_connection_status() == MultiplayerPeer.CONNECTION_DISCONNECTED:
		OS.alert("Failed to start multiplayer server.")
		return
	multiplayer.multiplayer_peer = peer
	start_game()


func join_server(address, port):
	# Start as client.
	if address == "":
		OS.alert("Need a remote to connect to.")
		return
	var peer = ENetMultiplayerPeer.new()
	peer.create_client(address, int(port))
	if peer.get_connection_status() == MultiplayerPeer.CONNECTION_DISCONNECTED:
		OS.alert("Failed to start multiplayer client.")
		return
	multiplayer.multiplayer_peer = peer
	start_game()

func start_game():
	#Set UI
	$UILayer/HostingUI.queue_free()
	UILayer.add_child(SimpleUI.instantiate())
	
	if multiplayer.is_server():
		#Set level
		change_level.call_deferred(load("res://levels/train_map.tscn"))
		world.add_child(load("res://player/player.tscn").instantiate())

func change_level(scene: PackedScene):
	world.add_child(scene.instantiate())
