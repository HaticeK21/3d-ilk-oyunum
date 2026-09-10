extends CharacterBody3D

const SPEED = 5.0
const GRAVITY = 15.0

@onready var flashlight = $Flashlight

func _physics_process(delta):
	if not is_on_floor():
		velocity.y -= GRAVITY * delta

	var input = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = Vector3(input.x, 0, input.y)

	if direction.length() > 0:
		direction = direction.normalized()

	velocity.x = direction.x * SPEED
	velocity.z = direction.z * SPEED

	move_and_slide()

func _input(event):
	if event.is_action_pressed("ui_accept"):
		flashlight.visible = !flashlight.visible
