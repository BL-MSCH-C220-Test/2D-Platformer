extends Node2D



func _physics_process(_delta):
	if get_child_count() == 1:
		var Player = load(Global.Player)
		var player = Player.instantiate()
		player.position = $Marker2D.position
		add_child(player)
