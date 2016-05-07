private ["_name","_uid","_player"];
_uid = _this select 0;
_name = _this select 1;

_initialinventory = ["","","U_AEGIS_BLK_POLO_JEANS",["ACE_fieldDressing","ACE_fieldDressing","ACE_morphine"],"V_aegis_carrier_lite_blk",["ACRE_PRC343_ID_1","MiniGrenade","MiniGrenade","SmokeShell","SmokeShellRed","Chemlight_red","Chemlight_red","RH_15Rnd_9x19_SIG","SMA_30Rnd_556x45_M855A1","SMA_30Rnd_556x45_M855A1","SMA_30Rnd_556x45_M855A1","SMA_30Rnd_556x45_M855A1"],"",[],"SMA_M4afg_BLK1_SM",["","","",""],["SMA_30Rnd_556x45_M855A1"],"",["","","",""],[],"RH_p226",["","","",""],["RH_15Rnd_9x19_SIG"],["ItemRadioAcreFlagged"],"",""];

"Procurando o novo player..." call aegis_log;
_player	= [_name, _uid] call aegis_get_player_by_id;

// Adiciona o handler de killed em todas as unidades para que zere a posicao delas no mapa e delete equipamentos
format["Adicionando eventhandler de KILLED para %1", _name] call aegis_log;
_player addMPEventHandler ["MPKilled", {(_this select 0) remoteExecCall ["aegis_reset_position",2]}];

[_player, _initialinventory, false, true] remoteExecCall ["ace_common_fnc_setAllGear", _player];

// TODO: Deixar dinamico
[25000, _player, "deposito"] call aegis_transaction;
