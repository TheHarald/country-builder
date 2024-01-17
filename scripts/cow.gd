extends CharacterBody2D


const SPEED = 300.0

var motion = Vector2()

@onready var animation = $AnimationPlayer

func _ready():
	animation.play('idle')
