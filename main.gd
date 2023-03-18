extends Node

@onready var UILayer = $UILayer
@onready var FPS = $UILayer/FPS

@export var MainMenuUI: PackedScene
@export var HostingUI: PackedScene

func _ready():
	var i
	i = MainMenuUI.instantiate()
	UILayer.add_child(i)
	
#	multiplayer.server_relay = false
#
#	if DisplayServer.get_name() == "headless":
#		print("Automatically starting dedicated server.")
#		_on_host_pressed.call_deferred()

func _process(delta):
	FPS.text = str(Engine.get_frames_per_second())

#func _on_host_pressed():
#	var peer = ENetMultiplayerPeer.new()
#	peer.create_server(PORT)
#	if peer.get_connection_status() == MultiplayerPeer.CONNECTION_DISCONNECTED:
#		OS.alert("Failed to start multiplayer server.")
#		return
#	multiplayer.multiplayer_peer = peer
#	start_game()
#
#func _on_connect_pressed():
#	var txt : String = $UILayer/UI/Net/Options/Remote.text
#	if txt == "":
#		OS.alert("Need a remote to connect to.")
#		return
#	var peer = ENetMultiplayerPeer.new()
#	peer.create_client(txt, PORT)
#	if peer.get_connection_status() == MultiplayerPeer.CONNECTION_DISCONNECTED:
#		OS.alert("Failed to start multiplayer client.")
#		return
#	multiplayer.multiplayer_peer = peer
#	start_game()
#
#func start_game():
#	$UILayer/UI/Net.hide()
#	$UILayer/UI/Restart.show()
#	var instance = train_map.instantiate()
#	add_child(instance)
#	instance = player.instantiate()
#	$TrainMap.add_child(instance)
#
#func _on_restart_pressed():
#	$TrainMap.queue_free()
#	multiplayer.multiplayer_peer.close()
#	$UILayer/UI/Net.show()
#	$UILayer/UI/Restart.hide()
