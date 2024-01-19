extends Node2D

@onready var tile_map:TileMap = $TileMap
var ground_layer = 2
var road_layer = 3
var source_id = 3
var atlas_coords = Vector2i(3,3)
var can_place_road_custom_layer = 'can-place-road'
var road_tiles = []

func _ready():
	pass


func _input(event):
	if Input.is_action_just_released('left-click'):
		var target_position = get_global_mouse_position()
		var target_tile_position = tile_map.local_to_map(target_position)
		var tile_data : TileData = tile_map.get_cell_tile_data(ground_layer,target_tile_position)
		if(tile_data):
			var can_place_road = tile_data.get_custom_data(can_place_road_custom_layer)
			if(can_place_road):
				road_tiles.append(target_tile_position)
				tile_map.set_cells_terrain_connect(road_layer,road_tiles,1,0)
			else:
				print('can`t place')
		else:
			print('no tile data')

func _process(delta):
	pass
