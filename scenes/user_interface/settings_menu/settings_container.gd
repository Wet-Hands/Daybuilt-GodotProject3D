extends VBoxContainer

@export var control_container : Control
@export var main_container : Container
@export var back_button : Button
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_container($GeneralContainer)
	
	for child in $HBoxContainer.get_children():
		child.pressed.connect(_on_button_pressed.bind(child))
		
	$BackButton.pressed.connect(_on_button_pressed.bind($BackButton))

func set_container(container : VBoxContainer) -> void:
	for child in self.get_children():
		if child is VBoxContainer:
			child.hide()
	container.show()

func _on_button_pressed(button : Button) -> void:
	var button_name : String = button.name
	match button_name:
		"General":
			set_container($GeneralContainer)
		"Controls":
			set_container($ControlsContainer)
		"Audio":
			set_container($AudioContainer)
		"Video":
			set_container($VideoContainer)
		"BackButton":
			control_container.set_container(main_container)
