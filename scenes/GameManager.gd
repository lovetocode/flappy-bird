extends Node

@onready var bird = $"../Bird" as Bird
@onready var ground = $"../Ground" as Ground
@onready var pipe_spawner = $"../PipeSpawner" as PipeSpawner
@onready var fade = $"../fade" as Fade
@onready var ui = $"../UI" as UI
@onready var point = $"../SFX/Point"
@onready var woosh = $"../SFX/woosh"
@onready var start = $"../Start"
@onready var background_music = $"../SFX/BackgroundMusic"


var points = 0
var high_score = 0
var Start_woosh = 0 

func _ready():
	bird.game_started.connect(on_game_started)
	ground.bird_crashed.connect(end_game)
	pipe_spawner.bird_crashed.connect(end_game)
	pipe_spawner.point_scored.connect(on_point_scored)
	background_music.play()
	
func  _process(delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	
func on_game_started():
	pipe_spawner.start_spawning_pipes()
	if Start_woosh == 0:
		woosh.play()
	
func end_game():
	if fade != null:
		fade.play()
	
	ground.stop()
	bird.kill()
	pipe_spawner.stop()
	ui.on_game_over(points, high_score)
	
	
func on_point_scored():
	points += 1
	ui.update_points(points)
	if points > high_score:
		high_score = points
	point.play()
	


