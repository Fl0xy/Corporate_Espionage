extends CharacterBody2D

@export var speed = 100
var move_vec: Vector2 = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func get_input():
	self.move_vec = Input.get_vector("player_left", "player_right", "player_up", "player_down")
	velocity = move_vec * speed

func _physics_process(delta):
	get_input()
	move_and_slide()
	look_at(global_position + move_vec.rotated(deg_to_rad(90))) # rotate why?
	if (move_vec != Vector2.ZERO):
		$AnimatedSprite2D.play("running")
	else:
		$AnimatedSprite2D.play("idle")
