private ["_name","_uid","_player"];
_uid = _this select 0;
_name = _this select 1;

"Procurando o novo player..." call aegis_log;
_player	= [_name, _uid] call aegis_get_player_by_id;

// TODO: Deixar dinamico
[1000, _player, "deposito"] call aegis_transaction;
