extends Component

var lobby_id : int = 0
var peer : SteamMultiplayerPeer

var is_host : bool = false
var is_joining : bool = false

signal peer_connected
signal peer_disconnected

func _ready() -> void:
	Steam.initRelayNetworkAccess()
	Steam.lobby_created.connect(_on_lobby_created)
	Steam.lobby_joined.connect(_on_lobby_joined)

func _on_lobby_created(result : int, _lobby_id : int) -> void:
	pass

func _on_lobby_joined(_lobby_id : int, permissions : int, locked : bool, response : int) -> void:
	if !is_joining:
		return
	
	lobby_id = _lobby_id
	peer = SteamMultiplayerPeer.new()
	peer.server_relay = true
	peer.create_client(Steam.getLobbyOwner(lobby_id))
	multiplayer.multiplayer_peer = peer
	
	is_joining = false

#----------------#
# Public Methods #
#----------------#

func host_lobby(lobby_type : Steam.LobbyType = Steam.LobbyType.LOBBY_TYPE_PUBLIC) -> void:
	Steam.createLobby(lobby_type)
	is_host = true

func join_lobby(_lobby_id : int) -> void:
	is_joining = true
	Steam.joinLobby(_lobby_id)
