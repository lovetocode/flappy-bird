extends CharacterBody2D

class_name Bird

@export var gravity = 900.0
@export var jump_force = 200
@export var rotation_speed = 2

@onready var animation_player = $AnimationPlayer

var max_speed = 200

func _ready():
	velocity = Vector2.ZERO

func _physics_process(delta):
	pass
