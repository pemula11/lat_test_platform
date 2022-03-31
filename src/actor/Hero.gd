extends Actor


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
var direction: = Vector2.ZERO

var mati = false
var sedang_serang = false
var sedang_terluka = false
var anim_terluka = false

onready var sndserang = $sound/serang
onready var sndhiten = $sound/hitten
onready var sndjump = $sound/jump

onready var snddead = $sound/dead
onready var sprite = $AnimatedSprite
onready var area_serang = $attackCollision/
onready var areatack = $attackCollision/CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#if PlayerData.current_health <= 0:
	#	pass
	#else:
	#	pass
	PlayerData.set_health(health)

func _physics_process(delta: float) -> void:
	var is_jump_tergangu: = Input.is_action_just_released("jump") and kecepatan.y < 0.0
	direction = get_direction()
	kecepatan = hitung_percepatan(kecepatan, direction, speed, is_jump_tergangu)
	kecepatan = move_and_slide(kecepatan, Vector2.UP)
	
	if (not anim_terluka) and (not sedang_serang):
		ganti_anim()



func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_action_pressed("serangA"):
		sedang_serang = true
		sndserang.play()
		sprite.play("serang")
		areatack.disabled = false
	
	if event is InputEventKey:
		
		for i in get_slide_count():
			var collision = get_slide_collision(i)
			if collision.collider.has_method("collide_with"):
				collision.collider.collide_with(collision, self)
	
		
		

func get_direction()-> Vector2:
	var directionx = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	if directionx < 0:
		arah = directionx
		
	if directionx > 0:
		
		arah = directionx
	area_serang.scale.x = arah
	
	
	
	return Vector2(
		directionx, -
		 1.0 if Input.is_action_just_pressed("jump") and is_on_floor() else 0
	)
	

func hitung_percepatan(
	percepatan_linier: Vector2,
	Direction: Vector2,
	speed: Vector2,
	is_jump_interrupted: bool) -> Vector2:
	
	if Direction.y == -1.0:
		sndjump.play()
	var new_velocity: = percepatan_linier
	new_velocity.x = speed.x * Direction.x
	new_velocity.y += gravity * get_physics_process_delta_time()
	if Direction.y == -1.0:
		
		new_velocity.y = speed.y * Direction.y
	if is_jump_interrupted:
		new_velocity.y = 0
	if mati == true:
		new_velocity.x = 0
	return new_velocity

func ganti_anim():
	
	if is_on_floor():
		if kecepatan.x == (direction.x):
			sprite.play("idle")
		else: 
			sprite.play("jalan")
	else:
		if kecepatan.y > 0:
			sprite.play("jatuh")
		else:
			sprite.play("lompat")
	 
	if Input.is_action_just_pressed("serangA"):
		pass
		#seee
	
	if direction.x < 0:
		sprite.scale.x = -1
	elif direction.x >0:
		sprite.scale.x = 1

func terluka(value: int):
		
		sedang_terluka = true
		anim_terluka = true
		sndhiten.play()
		PlayerData.current_health -= value
		if PlayerData.current_health <= 0:
			mati()
		else:
			
			modulate.a = 0.55
			sprite.play("terluka")
			
				
			yield(get_tree().create_timer(0.5), "timeout")
			anim_terluka = false
			
			
			yield(get_tree().create_timer(1), "timeout")
			sedang_terluka = false
			modulate.a = 1
			


func mati():
	mati = true
	snddead.play()
	matikan_collision()
	sprite.play("mati")
	
	yield(get_tree().create_timer(1), "timeout")
	get_tree().paused =false
	get_tree().reload_current_scene()


func _on_AnimatedSprite_animation_finished() -> void:
	if sprite.animation == "serang":
		areatack.disabled = true
	sedang_serang = false
		

func matikan_collision():
	set_collision_layer_bit(1, false)
	


func _on_Timer_timeout() -> void:
	pass
	
	
	
	

