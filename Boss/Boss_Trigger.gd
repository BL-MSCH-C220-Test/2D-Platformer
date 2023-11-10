extends Area2D


func _on_body_entered(body):
	if body.name == "Player":
		var anim = get_node_or_null("/root/Game/AnimationPlayer")
		if anim != null:
			anim.play("Dialogue")
		get_tree().paused = true
		queue_free()
