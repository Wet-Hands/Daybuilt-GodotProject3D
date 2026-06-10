extends MarginContainer

@export var player : PlayerCharacter

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_container(%MainContainer)
	for child in %MainContainer.get_children():
		if child is Button:
			child.pressed.connect(_on_button_pressed.bind(child.name))

func _on_button_pressed(button_name : String) -> void:
	match button_name:
		"Resume":
			player.set_pause_container(false)
		"Settings":
			set_container(%SettingsContainer)
		"ReturnMenu":
			get_tree().change_scene_to_file(ProjectSettings.get_setting("application/run/main_scene"))
		"ReturnDesktop":
			get_tree().quit()

func set_container(new_container : VBoxContainer) -> void:
	for child in %MainContainer.get_parent().get_children():
		print(child)
		child.hide()
	new_container.show()
