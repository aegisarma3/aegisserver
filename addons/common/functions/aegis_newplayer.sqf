private ["_name","_uid","_player"];
_uid = _this select 0;
_name = _this select 1;

"Procurando o novo player..." call aegis_log;
_player	= [_name, _uid] call aegis_get_player_by_id;

// Adiciona o handler de killed em todas as unidades para que zere a posicao delas no mapa e delete equipamentos
format["Adicionando eventhandler de KILLED para %1", _name] call aegis_log;
_player addMPEventHandler ["MPKilled", {(_this select 0) remoteExecCall ["aegis_reset_position",2]}]; 

// TODO: Deixar dinamico
[1000, _player, "deposito"] call aegis_transaction;
