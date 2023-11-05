extends Node

@onready var bird = $"../Bird" as Bird
@onready var ground = $"../Ground" as Ground
@onready var pipe_spawner = $"../PipeSpawner" as PipeSpawner
@onready var fade = $"../fade" as Fade


var points = 0

func _ready():
	bird.game_started.connect(on_game_started)
	ground.bird_crashed.connect(end_game)
	pipe_spawner.bird_crashed.connect(end_game)
	pipe_spawner.point_scored.connect(on_point_scored)
	
func on_game_started():
	pipe_spawner.start_spawning_pipes()
	
func end_game():
	if fade != null:
		fade.play()
	ground.stop()
	bird.kill()
	pipe_spawner.stop()
	
	
func on_point_scored():
	points += 1
	
	


