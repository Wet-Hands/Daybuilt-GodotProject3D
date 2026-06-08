class_name InteractionComponent
extends Component

@export var is_enabled : bool = true
@export var raycast : RayCast3D

var colliding : bool = false

signal enter_interaction
signal exit_interaction

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _create_interaction_label(text : String) -> void:
	var label := Label.new()
	label.text = text
	add_child(label)

func _delete_interaction_label() -> void:
	for child in self.get_children():
		if child is Label:
			child.queue_free()

func trigger_raycast() -> void:
	if !is_enabled: return
	
	if raycast.is_colliding():
		var collider = raycast.get_collider()
		if collider:
			pass
