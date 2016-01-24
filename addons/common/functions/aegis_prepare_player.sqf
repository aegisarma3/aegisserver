private ["_name","_uid","_player"];
_uid = _this select 0;
_name = _this select 1;
_mapname = format["%1",worldName];

"Procurando o player..." call aegis_log;
_player	= [_name, _uid] call aegis_get_player_by_id;

_playerPosition = format["getPlayerPosition:%1:%2", _mapname, _uid] call aegis_select_array;
_player setDir (_playerPosition select 0);
_player setPos [(_playerPosition select 1), (_playerPosition select 2), (_playerPosition select 3)];
format["Player %1 (UID %2) reposicionado!", _name, _uid] call aegis_log;

_playerdata = format["loadPlayer:%1:%2", _uid, _mapname] call aegis_select_array;
format["Player data: %1", _playerdata] call aegis_log;

_playerMedicalCondition = _playerdata select 0;
_playerInventory = _playerdata select 1;

[_player, _playerInventory, false, true] remoteExecCall ["ace_common_fnc_setAllGear", _player];
format["Loadout do Player %1 (UID %2) realizado!", _name, _uid] call aegis_log;

[_player, _playerMedicalCondition] remoteExecCall ["aegis_set_medical_condition", _player];
format["MedCond do Player %1 (UID %2) realizada!", _name, _uid] call aegis_log;
