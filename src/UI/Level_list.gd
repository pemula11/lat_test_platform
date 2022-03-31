extends Control

export (PackedScene) var base_button
export (int) var total_level = 0
export (NodePath) var grid

func _ready() -> void:
	grid = get_node(grid)
	PlayerData.load_game()
	if !total_level <= 4:
		column_size()
	
	for i in range(0, total_level):
		generate_button(i+1)
		
func generate_button(name:int):
	var bb = base_button.instance()
	
	bb.set_name(str(name))
	bb.set_text(str(name))
	bb.level_path = ("res://src/level/Level" + str(name) + ".tscn")
	grid.add_child(bb)
	if name in range(PlayerData.openedlevel+1):
		bb.disabled = false
	else:
		bb.disabled = true
	
	
func column_size():
	var divider = round(total_level/5)
	
	if total_level %2 ==0:
		grid.columns = total_level/divider
	else:
		grid.columns = total_level/divider +1
