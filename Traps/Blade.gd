extends Area2D


func _physics_process(_delta):
	$Sprite2D.rotation_degrees += 1



func _on_body_entered(body):
	if body.has_method("die"):
		body.die()
