private ["_name","_uid","_player"];
_name	= _this select 0;
_uid	= _this select 1;
_player	= objNull;

"Iniciando pesquisa por UID e Nome..." call aegis_log;

if (_name != "__SERVER__") then {
	while {isNull _player} do {
		{
			if (!isNull _x && getPlayerUID _x == _uid) exitWith {
				_player = _x;
			};

		} forEach playableUnits;
	};
};

format["Player encontrado: %1", _player] call aegis_log;
_player
