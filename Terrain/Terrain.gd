extends Node2D

const SPEED = Vector2(-5, 0)

var terrain = [
	load("res://Terrain/terrain_1.tscn")
	,load("res://Terrain/terrain_2.tscn")
]


func _ready():
	randomize()
	var t = terrain[randi_range(0,len(terrain)-1)].instantiate()
	t.position = Vector2.ZERO
	add_child(t)
	var t2 = terrain[randi_range(0,len(terrain)-1)].instantiate()
	t2.position = Vector2(1152,0)
	add_child(t2)

func _physics_process(_delta):
	for c in get_children():
		c.position += SPEED
		if c.position.x == -1152:
			var t2 = terrain[randi_range(0,len(terrain)-1)].instantiate()
			t2.position = Vector2(1152,0)
			add_child(t2)
			c.queue_free()
			
		

