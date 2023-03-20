extends Control

@export var JoinIP: Node
@export var JoinPort: Node
@export var HostPort: Node

signal host_server(port)
signal join_server(address, port)

func _on_join_pressed():
	join_server.emit(JoinIP.text, JoinPort.text)

func _on_host_pressed():
	host_server.emit(HostPort.text)
