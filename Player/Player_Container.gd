extends Node2D

var Player = load("res://Player/player.tscn")


func _physics_process(_delta):
	if get_child_count() == 1:
		var player = Player.instantiate()
		player.position = $Marker.position
		add_child(player)
