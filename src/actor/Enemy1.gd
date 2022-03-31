extends Actor


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

var velocity = Vector2.ZERO
onready var sprite = $musuh
onready var sprite1 = $musuh/Animation
var hited = false
onready var pivot = $pivot
onready var raycast = $pivot/RayCast2D
# Called when the nodeenters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	
		
	velocity = movement()
	change_animation()
	velocity = move_and_slide(velocity,Vector2.UP)


func movement() -> Vector2:
	var out = Vector2.ZERO
	
			
	
	if (is_on_wall()) or not raycast.is_colliding():
		arah = arah * -1
		pivot.scale.x = pivot.scale.x * -1
	if arah <0:
		sprite.flip_h = true
	elif arah >0:
		sprite.flip_h = false
	out.x = speed.x * arah
	out.y += gravity 
	if hited == true:
		out.x = 0
	return out

func change_animation():
	if is_on_floor() and hited == false:
		if velocity.x != 0:
			sprite.play("jalan")
		else:
			sprite.play("idle")
		
	else:
		pass


func _on_Area2D_body_entered(body: Node) -> void:
	
	if body.name == "Hero" and body.sedang_terluka == false:
		body.terluka(15)


func _on_Area2D_area_entered(area: Area2D) -> void:
	
	if area.is_in_group("sword"):
		hited = true
		
		sprite.play("hit")
		
		
	


func _on_musuh_animation_finished() -> void:
	if sprite.animation == "hit":
		mati()
		

func mati():
	queue_free()
	
