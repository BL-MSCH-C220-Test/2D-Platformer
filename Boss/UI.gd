extends CanvasLayer




func _on_animation_player_animation_finished(anim_name):
	if anim_name == "Dialogue":
		get_tree().paused = false
		$Dialogue.queue_free()


func _unhandled_input(event):
	var dialogue = get_node_or_null("Dialogue")
	if event.is_action_pressed("skip") and dialogue != null:
		get_tree().paused = false
		dialogue.queue_free()
