extends CharacterBody2D

@onready var animation = $AnimationPlayer

@export var speed = 50.0


func get_input():
	var input_direction = Input.get_vector("move-left", "move-right", "move-up", "move-down")
	velocity = input_direction * speed

func animate():
	if(velocity == Vector2.ZERO):
		animation.play('idle')
		return
	var direction = 'right'
	if(velocity.x < 0): direction = 'left'
	if(velocity.x > 0): direction = 'right'
	if(velocity.y < 0): direction = 'up'
	if(velocity.y > 0): direction = 'down'
	animation.play('walk-' + direction)


func _physics_process(_delta):
	animate()
	get_input()
	move_and_slide()
