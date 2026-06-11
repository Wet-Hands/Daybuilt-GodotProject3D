extends Component

var player_spawn_node : Node

var lobby_id : int = 0
var peer : SteamMultiplayerPeer

var is_host : bool = false
var is_joining : bool = false

signal peer_connected
signal peer_disconnected

func _ready() -> void:
	print("Steam Initialized: ", Steam.steamInit(480, true))
	Steam.initRelayNetworkAccess()
	Steam.lobby_created.connect(_on_lobby_created)
	Steam.lobby_joined.connect(_on_lobby_joined)

func _on_lobby_created(result : int, _lobby_id : int) -> void:
	if result == Steam.Result.RESULT_OK:
		lobby_id = _lobby_id
		peer = SteamMultiplayerPeer.new()
		peer.server_relay = true
		peer.create_host()
		
		multiplayer.multiplayer_peer = peer
		multiplayer.peer_connected.connect(_add_player)
		multiplayer.peer_disconnected.connect(_del_player)

func _on_lobby_joined(_lobby_id : int, permissions : int, locked : bool, response : int) -> void:
	if !is_joining:
		return
	
	lobby_id = _lobby_id
	peer = SteamMultiplayerPeer.new()
	peer.server_relay = true
	peer.create_client(Steam.getLobbyOwner(lobby_id))
	multiplayer.multiplayer_peer = peer
	
	is_joining = false

func _add_player(id : int = 1) -> void:
	var player := PlayerCharacter.new()
	player.name = str(id)
	call_deferred("add_child", player_spawn_node, player)

func _del_player(id : int) -> void:
	if !player_spawn_node.has_node(str(id)):
		return
	
	player_spawn_node.get_node(str(id)).queue_free()

#----------------#
# Public Methods #
#----------------#

func host_lobby(lobby_type : Steam.LobbyType = Steam.LobbyType.LOBBY_TYPE_PUBLIC) -> void:
	Steam.createLobby(lobby_type)
	is_host = true

func join_lobby(_lobby_id : int) -> void:
	is_joining = true
	Steam.joinLobby(_lobby_id)
