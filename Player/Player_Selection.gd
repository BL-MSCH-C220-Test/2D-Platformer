extends Control


func _on_adventurer_pressed():
	Global.Player = "res://Player/player_adventurer.tscn"
	get_tree().change_scene_to_file("res://game.tscn")


func _on_warrior_pressed():
	Global.Player = "res://Player/player_warrior.tscn"
	get_tree().change_scene_to_file("res://game.tscn")
