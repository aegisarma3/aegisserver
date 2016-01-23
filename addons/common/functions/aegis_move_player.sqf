private ["_name","_uid","_player"];
_uid = _this select 0;
_name = _this select 1;
_mapname = format["%1",worldName];

_player	= [_name, _uid] call aegis_get_player_by_id;
format ["O PLAYER: %1", _player];
_playerPosition = format["getPlayerPosition:%1:%2", _mapname, _uid] call aegis_select_array;

_player setDir (_playerPosition select 0);
_player setPos [(_playerPosition select 1), (_playerPosition select 2), (_playerPosition select 3)];
