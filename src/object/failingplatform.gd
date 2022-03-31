extends KinematicBody2D

onready var animation_player = $AnimationPlayer
onready var timer = $resetTimer
export var gravity = 100

var is_trigger = false
var velocity = Vector2()
onready var resetposition = global_position

func _ready() -> void:
	set_physics_process(false)

func _physics_process(delta: float) -> void:
	velocity.y += gravity + delta
	position += velocity * delta


func collide_with(collision: KinematicCollision2D, collider : KinematicBody2D):
	if !is_trigger:
		is_trigger = true
		animation_player.play("shake")
		velocity = Vector2.ZERO


func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	set_physics_process(true)
	timer.start()


func _on_resetTimer_timeout() -> void:
	set_physics_process(false)
	yield(get_tree(), "physics_frame")
	var temp = collision_layer
	collision_layer = 0
	global_position = resetposition
	yield(get_tree(), "physics_frame")
	collision_layer = temp
	is_trigger = false
