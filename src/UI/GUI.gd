extends CanvasLayer


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
onready var health_progress = $HealthBar/TextureProgress

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	PlayerData.connect("health_updated", self, "update_interface")
	update_interface()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func set_health():
	pass

func update_interface() -> void:
	health_progress.value = (float(PlayerData.current_health)/float(100)) * 100 
