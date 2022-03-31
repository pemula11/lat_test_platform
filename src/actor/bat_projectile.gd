extends Area2D

var kecepatan = Vector2.ZERO
var STEER_FORCE =100
var accelerator = Vector2.ZERO
const MOVE_SPEED = 600
var target = null
func _ready() -> void:
	pass
	
func _physics_process(delta: float) -> void:
	accelerator = seek()
	kecepatan += accelerator * delta
	kecepatan = kecepatan.clamped(MOVE_SPEED)
	position += kecepatan * delta
	
	
func seek():
	var steer = Vector2.UP
	if target:
		var desire = (target - position).normalized() * MOVE_SPEED
		steer = (desire-kecepatan).normalized()  * STEER_FORCE
	return steer

func launch(target):
	self.target = target


func _on_endTimer_timeout() -> void:
	queue_free()


func _on_Area2D_body_entered(body: Node) -> void:
	if body.name == "Hero" and body.sedang_terluka == false:
		
		body.terluka(20)
