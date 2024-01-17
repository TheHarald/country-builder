extends Camera2D

var is_dragging = false
var drag_start = Vector2()
var drag_speed = 0.1
var zoom_speed = 0.25
var min_zoom =  Vector2(0.5,0.5)
var max_zoom = Vector2(3.0,3.0)

func _process(_delta):
	# Drag to move camera
	drag_controller()
	zoom_controller()
	

func is_zoom_allow(value):
	return value < max_zoom && value > min_zoom

func validate_zoom(value):
	if(value < min_zoom): return min_zoom
	if(value > max_zoom): return max_zoom
	return value

func zoom_controller():
	if is_dragging: return
	var current_zoom = get_zoom()
	var delta_zoom = Vector2(0,0)
	#if is_zoom_allow(current_zoom):
	if Input.is_action_just_released("wheel-down"):
		delta_zoom = - Vector2(zoom_speed, zoom_speed)
		
	if Input.is_action_just_released("wheel-up"):
		delta_zoom =  Vector2(zoom_speed, zoom_speed)
	set_zoom(validate_zoom(current_zoom + delta_zoom))

func drag_controller():
	if Input.is_action_pressed("wheel-click"):
		#print(get_global_mouse_position())
		if not is_dragging:
			drag_start = get_global_mouse_position()
			is_dragging = true
		if is_dragging:
			var delta_position = get_global_mouse_position() - drag_start
			global_transform.origin -= delta_position
			
	else:
		is_dragging = false
