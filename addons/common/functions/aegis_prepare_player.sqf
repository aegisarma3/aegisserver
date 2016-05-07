private ["_name","_uid","_player"];
_uid = _this select 0;
_name = _this select 1;
_mapname = format["%1",worldName];

"Procurando o player..." call aegis_log;
_player	= [_name, _uid] call aegis_get_player_by_id;

// Adiciona o handler de killed em todas as unidades para que zere a posicao delas no mapa e delete equipamentos
format["Adicionando eventhandler de KILLED para %1", _name] call aegis_log;
_player addMPEventHandler ["MPKilled", {(_this select 0) remoteExecCall ["aegis_reset_position",2]}];

_playerPosition = format["getPlayerPosition:%1:%2", _mapname, _uid] call aegis_select_array;
format["Posição do Player: %1",_playerPosition] call aegis_log;

if (!isNull _playerPosition) then {
  _player setDir (_playerPosition select 0);
  _player setPos [(_playerPosition select 1), (_playerPosition select 2), (_playerPosition select 3)];
  format["Player %1 (UID %2) reposicionado!", _name, _uid] call aegis_log;
};


  _playerdata = format["loadPlayer:%1:%2", _uid, _mapname] call aegis_select_array;

if (!isNull _playerdata) then {
  _playerMedicalCondition = _playerdata select 0;
  _playerInventory = _playerdata select 1;
  format["Loadout do Player: %1",_playerInventory] call aegis_log;

  [_player, _playerInventory, false, true] remoteExecCall ["ace_common_fnc_setAllGear", _player];
  format["Loadout do Player %1 (UID %2) realizado!", _name, _uid] call aegis_log;


  [_player, _playerMedicalCondition] call aegis_set_medical_condition;
  format["MedCond do Player %1 (UID %2) realizada!", _name, _uid] call aegis_log;
} else {
  _initialinventory = ["","","U_AEGIS_BLK_POLO_JEANS",["ACE_fieldDressing","ACE_fieldDressing","ACE_morphine"],"V_aegis_carrier_lite_blk",["ACRE_PRC343_ID_1","MiniGrenade","MiniGrenade","SmokeShell","SmokeShellRed","Chemlight_red","Chemlight_red","RH_15Rnd_9x19_SIG","SMA_30Rnd_556x45_M855A1","SMA_30Rnd_556x45_M855A1","SMA_30Rnd_556x45_M855A1","SMA_30Rnd_556x45_M855A1"],"",[],"SMA_M4afg_BLK1_SM",["","","",""],["SMA_30Rnd_556x45_M855A1"],"",["","","",""],[],"RH_p226",["","","",""],["RH_15Rnd_9x19_SIG"],["ItemRadioAcreFlagged"],"",""];
  [_player, _initialinventory, false, true] remoteExecCall ["ace_common_fnc_setAllGear", _player];
};

// envia o saldo
[0, _player, "saldo"] call aegis_transaction;
