extends Node

class_name PipeSpawner

var pipe_pair_scene = preload("res://scenes/pipe_pair.tscn")

@onready var spawn_timer = $SpawnTimer

var speed = -150



# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_timer.timeout.connect(spawn_pipe)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func start_spawning_pipes():
	spawn_timer.start()
	
func spawn_pipe():
	var pipe = pipe_pair_scene.instantiate() as PipePair
	add_child(pipe)
	
	var viewport_rect = get_viewport().get_camera_2d().get_viewport_rect()
	pipe.position.x = viewport_rect.end.x
