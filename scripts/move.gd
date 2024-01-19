extends CharacterBody2D


var speed = 50.0
var target_position = Vector2()


func get_input():
	var input_direction = Input.get_vector("move-left", "move-right", "move-up", "move-down")
	velocity = input_direction * speed
	
	
func _physics_process(delta):
	if Input.is_action_just_released('right-click'):
		target_position = get_global_mouse_position()
		target_position.x = round(target_position.x)
		target_position.y = round(target_position.y)
		var direction = (target_position - position).normalized()
			
	get_input()
	move_and_slide()
