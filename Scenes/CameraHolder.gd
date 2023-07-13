extends Node3D

const SENSITIVITY = 0.5
const SMOOTHNESS = 0.2

@onready var cam = $"Camera3D"
var camera_input : Vector2
var rotation_velocity : Vector2

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion:
		camera_input = event.relative
		
func _process(delta):
	rotation_velocity = rotation_velocity.lerp(camera_input * SENSITIVITY, delta * SMOOTHNESS)
	cam.rotate_x(-deg_to_rad(rotation_velocity.y))
	rotate_y(-deg_to_rad(rotation_velocity.x))
	
	cam.rotation_degrees.x = clamp(cam.rotation_degrees.x, -90, 90)
	camera_input = Vector2.ZERO
