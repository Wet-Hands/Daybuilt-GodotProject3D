class_name InteractionComponent
extends Component

@export var is_enabled : bool = true
@export var raycast : RayCast3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func trigger_raycast() -> void:
	if !is_enabled: return
	
	if raycast.is_colliding():
		var collider = raycast.get_collider()
		if collider:
			pass
