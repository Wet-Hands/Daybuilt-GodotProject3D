class_name PlayerCharacter
extends CharacterBody3D

@export var debug : bool
@export var dyn_debug: Container

@export var health_component : HealthComponent
@export var interaction_component : Node
@export var save_component : SaveComponent

var _input_dir : Vector2 = Vector2.ZERO
var _movement_velocity : Vector3 = Vector3.ZERO

var is_paused : bool = false

var Settings : Node

func _ready() -> void:
	dyn_debug.create_category("FPS", str(Engine.get_frames_per_second()))

func _process(delta: float) -> void:
	dyn_debug.update_value("FPS", str(Engine.get_frames_per_second()))

func update_rotation(rotation_input) -> void:
	global_transform.basis = Basis.from_euler(rotation_input)

func update_gravity(delta : float) -> void:
	velocity += get_gravity() * delta

func update_input(speed : float, acceleration : float, deceleration : float) -> void:
	# If Player presses Pause, Pause Game
	if Input.is_action_just_pressed("pause"):
		set_pause_container(!is_paused)
	
	# If Player Presses Interact, Use InteractionComponent (if it exists)
	if Input.is_action_just_pressed("interact"):
		#if interaction_component: interaction_component.interact()
		pass
	
	# Get Direction based on Input
	_input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	
	var direction : Vector3
	var current_velocity : Vector2
	
	current_velocity = Vector2(_movement_velocity.x, _movement_velocity.z)
	direction = (transform.basis * Vector3(_input_dir.x, 0, _input_dir.y)).normalized()
	
	if direction:
		current_velocity = lerp(current_velocity, Vector2(direction.x, direction.z) * speed, acceleration)
	else:
		current_velocity = current_velocity.move_toward(Vector2.ZERO, deceleration)
	
	_movement_velocity = Vector3(current_velocity.x, velocity.y, current_velocity.y)
	velocity = _movement_velocity
	
	# Doesn't Print if Velocity == 0
	if debug && velocity: print("Player Velocity: ", velocity)

func update_velocity() -> void:
	move_and_slide()

func set_pause_container(on : bool) -> void:
		is_paused = on
		%PauseContainer.visible = is_paused
		if is_paused:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		else:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
