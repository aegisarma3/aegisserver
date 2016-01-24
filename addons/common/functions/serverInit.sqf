/*
O método utilizado aqui é um derivativo do método utilizado pelo time do Exile Mod.
Como se trata de uma trabalho derivativo, sua distribuição não é permitida.*/

 if (!isServer) exitWith {};

private ['_code', '_function', '_file'];

{
    _code = '';
    _function = _x select 0;
    _file = _x select 1;
    _code = compileFinal (preprocessFileLineNumbers _file);

    missionNamespace setVariable [_function, _code];
}
forEach
[
  ['aegis_preinit', 'aegisserver\addons\common\functions\aegis_preinit.sqf'],
  ['aegis_database_init', 'aegisserver\addons\common\functions\aegis_database_init.sqf'],
  ['aegis_handleBig', 'aegisserver\addons\common\functions\aegis_handleBig.sqf'],
  ['aegis_select_field', 'aegisserver\addons\common\functions\aegis_select_field.sqf'],
  ['aegis_select_array', 'aegisserver\addons\common\functions\aegis_select_array.sqf'],
  ['aegis_write_data', 'aegisserver\addons\common\functions\aegis_write_data.sqf'],
  ['aegis_log', 'aegisserver\addons\common\functions\aegis_log.sqf'],
  ['aegis_prepare_player', 'aegisserver\addons\common\functions\aegis_prepare_player.sqf'],
  ['aegis_get_player_by_id', 'aegisserver\addons\common\functions\aegis_get_player_by_id.sqf'],
  ['aegis_player_connected', 'aegisserver\addons\common\functions\aegis_player_connected.sqf'],
  ['aegis_player_handle_disconnect', 'aegisserver\addons\common\functions\aegis_player_handle_disconnect.sqf'],
  ['aegis_get_medical_condition', 'aegisserver\addons\common\functions\aegis_get_medical_condition.sqf']
];

call aegis_preinit;

true
