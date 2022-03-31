extends Actor

onready var animation = $AnimationTree
var posisitarget = Vector2.ZERO
var hited = false
var can_move = true
var arah_jalan = false
onready var statemachine = animation["parameters/playback"]
var _serangan_bola = preload("res://src/actor/bat_projectile.tscn")
	
	
func _physics_process(delta: float) -> void:
	move()
	kecepatan = move_and_slide(kecepatan*delta,Vector2.UP)
	

func _on_Areaserang_body_entered(body: Node) -> void:
	if body.name == bodyhero:
		statemachine.travel("attack")
		posisitarget = body.position
		

func tembak():
	print("tembak")
	#sndmeriam.play()
	var seranganbola = _serangan_bola.instance()
	seranganbola.position = position
	get_tree().current_scene.add_child(seranganbola)
	seranganbola.launch(posisitarget)


func move()-> Vector2:
	if is_on_wall():
		arah_jalan = !arah_jalan
		scale.x = -scale.x
	kecepatan.x = (-speed.x if arah_jalan else speed.x)
	
	
	return kecepatan
