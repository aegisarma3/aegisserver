params ["_player"];

_uid = getPlayerUID _player;
_mapname = format["%1",worldName];

"Removendo posicao no mapa" call aegis_log;
format["removePlayerPosition:%1:%2", _uid, _mapname] call aegis_write_data;

"Removendo condicao medica e inventario" call aegis_log;
format["removePlayer:%1:%2", _uid, _mapname] call aegis_write_data;
