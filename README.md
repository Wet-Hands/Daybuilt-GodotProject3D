# Daybuilt GodotProject3D
[![Godot](https://img.shields.io/badge/Godot-v4.6.3%20-478CBF?logo=godot-engine&logoColor=white)](https://godotengine.org/download/)
[![MIT LICENSE](https://img.shields.io/badge/License-MIT%20-aa0000?logo=MIT&logoColor=white)](LICENSE)

Template Project for 3D Godot Projects designed to be forked for other projects.

## Features

### Components
|  Class Name   | Icon |  Description  | Extends From |
| ------------- | :-------------: | -------------- | -------------- |
| Component |![](assets/components/ComponentNode.svg)|Base class for all Components that exist outside of 2D or 3D space | Node |
| Component3D |![](assets/components/Component3DNode.svg) | Base class for all Components that exist within 3D space | Node3D |
| AnalogCaptureComponent | ![](assets/components/MouseCaptureComponentNode.svg) |Used for getting mouse and joystick movement for the Player's CameraController | Component |
| AudioComponent |![](assets/components/AudioComponentNode.svg)| Creates AudioStreamPlayer or AudioStreamPlayer3D for simple use cases | Component |
| DungeonComponent3D |![](assets/components/DungeonComponent3d.svg)| Experimental component for creating procedually generated indoor environments | Component3D |
| HealthComponent |![](assets/components/HealthComponentNode.svg)| Deprecated component for handling the health of an entity | Component |
| SaveComponent |![](assets/components/save_component_node.svg)| Experimental component for reading and writing save data for simple use cases | Component |
| StateMachine |![](assets/components/StateMachineNode.svg)| Manages States and the transitions between them | Component |
| State |![](assets/components/StateNode.svg)| Base class for any StateMachine setup | Component |
| SteamComponent |![](assets/components/SteamComponentNode.svg)| Base class for any components that need to utilize GodotSteam Addon | Component |
| ResourceComponent |![](assets/components/ComponentNode.svg)| Experimental component for creating and managing any type of singular resource | Component |

### Globals
| Global Name | Description |
| ----------- | ----------- |
| Discord | Script for Updating Discord Rich Presence |
| Network | Script for ENET multiplayer |

### Included Addons
- [AmbientCG Browser](https://github.com/AzPepoze/godot-ambientcg) by AzPepoze & CSLRDoesntGameDev
- [DiscordRPC-GD](https://codeberg.org/vaporvee/discord-rpc-godot) by Vaporvee
- [GodotSteam](https://codeberg.org/godotsteam/godotsteam) by Roberto "Gramps" Sanchez
- [TODO Manager](https://github.com/OrigamiDev-Pete/TODO_Manager) by OrigamiPete


## Contributions
If you find any issues or bugs feel free to create an issue or a Pull Request.
