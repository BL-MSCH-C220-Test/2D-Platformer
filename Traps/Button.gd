extends Area2D


func _on_body_entered(body):
	if body.name == "Player":
		$Sprite2D.texture = load("res://Assets/switchGreen_pressed.png")
		$Timer.start()


func _on_timer_timeout():
	var Explosion = load("res://Traps/explosion.tscn")
	var explosion = Explosion.instantiate()
	explosion.position = position
	get_parent().add_child(explosion)
	for d in $Damage.get_overlapping_bodies():
		if d.has_method("die"):
			d.die()
	queue_free()
