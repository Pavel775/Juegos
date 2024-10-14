extends CharacterBody2D

var speed := 120
var direccion := 0.0
var jump := 250
const gravity := 9

@onready var anim := $AnimationPlayer
@onready var sprite := $Sprite2D
func _physics_process(_delta):
	direccion = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.x = direccion * speed
	
	if direccion != 0:
		anim.play("walk")
	else:
		anim.play("idle")
	
	sprite.flip_h = direccion < 0
	
	if is_on_floor() and Input.is_action_just_pressed("ui_accept"):
		velocity.y = -jump
	else:
		if !is_on_floor():
			velocity.y += gravity
		else:
			velocity.y = 0
	
	move_and_slide()
