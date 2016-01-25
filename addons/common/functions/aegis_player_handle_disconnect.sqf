private["_unit","_id","_pos"];
_unit = _this select 0;
_id = _this select 1;
_uid = _this select 2;
_name = _this select 3;
_pos = getPosATL _unit;
_posx = _pos select 0;
_posy = _pos select 1;
_posz = _pos select 2;
_direction = direction _unit;
_mapname = format["%1",worldName];

if !(_uid in ["", "__SERVER__", "__HEADLESS__"]) then
{

  // Pega o inventário do player
  _inventory = str formatText ["%1", ([_unit] call ace_common_fnc_getAllGear)];

  diag_log format ["inv antes: %1", _inventory];

  // Escape no inventario
  //_inventory = ([_inventory, '"', '""'] call CBA_fnc_replace);
  diag_log format ["inv depois: %1", _inventory];

  // Pega a condicao médica do player
  _medical_condition = str formatText ["%1", (_unit call aegis_get_medical_condition)];
  format["Condicao medica de %1 (UID %2):  %3", _name, _uid, _medical_condition] call aegis_log;







  format["endAccountSession:%1", _uid] call aegis_write_data;
  _hasPlayerPositionOnMap = format["hasPlayerPositionOnMap:%1", _mapname] call aegis_select_field;

  if (_hasPlayerPositionOnMap) then
  {
    format["updatePlayerPosition:%1:%2:%3:%4:%5:%6", _uid, _mapname, _direction, _posx, _posy, _posz] call aegis_write_data;
    format["updatePlayer:%1:%2:%3:%4", _medical_condition, _inventory, _uid, _mapname] call aegis_write_data;
  }
  else
  {
    format["insertPlayerPosition:%1:%2:%3:%4:%5:%6", _uid, _mapname, _direction, _posx, _posy, _posz] call aegis_write_data;
    format["createPlayer:%1:%2:%3:%4", _uid, _mapname, _medical_condition, _inventory] call aegis_write_data;
  };

	//_unit setVariable ["AegisSessionID", nil];
	//_unit call aegis_object_player_database_update;
	deleteVehicle _unit;
};
false
