extends Actor


onready var stomp_area: Area2D = $StompArea2D

export var score: = 100
var _direction = 1

func _ready() -> void:
	set_physics_process(false)
	_velocity.x = -speed.x


func _physics_process(delta: float) -> void:
	var _velocity = (Vector2(300.0, 0.0)) * _direction
	move_and_slide(_velocity)
	if is_on_wall():
		_direction = _direction * -1
		$RayCast2D.position.x *= -1
	if $RayCast2D.is_colliding() == false:
		_direction = _direction * -1
		$RayCast2D.position.x *= -1


func _on_StompArea2D_area_entered(area: Area2D) -> void:
	if area.global_position.y > stomp_area.global_position.y:
		return
	die()


func die() -> void:
	PlayerData.score += score
	queue_free()
