extends CharacterBody2D

@export var gravity = 900.0
@export var jump_force = 200
@export var rotation_speed = 20

@onready var animation_player = $AnimationPlayer

var max_speed = 200
