"A missao esta carregando" call aegis_log;
finishMissionInit;
"A missao carregou!" call aegis_log;

_MySql_connection = [] call aegis_database_init;
if !(_MySql_connection) exitWith
{
	"extDB2" callExtension "9:SHUTDOWN";
	false
};
addMissionEventHandler ["HandleDisconnect", { _this call aegis_player_handle_disconnect; }];
["aegis_id", "onPlayerConnected", {[_uid, _name] call aegis_player_connected}] call BIS_fnc_addStackedEventHandler;

/*onPlayerDisconnected {[_uid, _name] call ExileServer_system_network_event_onPlayerDisconnected};
if !(getRemoteSensorsDisabled) then
{
	disableRemoteSensors true;
};*/
PublicServerIsLoaded = false;
