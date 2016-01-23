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

  format["endAccountSession:%1", _uid] call aegis_write_data;
  _hasPlayerPositionOnMap = format["hasPlayerPositionOnMap:%1", _mapname] call aegis_select_field;

  if (_hasPlayerPositionOnMap) then
  {
    format["updatePlayerPosition:%1:%2:%3:%4:%5:%6", _uid, _mapname, _direction, _posx, _posy, _posz] call aegis_write_data;
  }
  else
  {
    format["insertPlayerPosition:%1:%2:%3:%4:%5:%6", _uid, _mapname, _direction, _posx, _posy, _posz] call aegis_write_data;
  };


	//_unit setVariable ["AegisSessionID", nil];
	//_unit call aegis_object_player_database_update;
	deleteVehicle _unit;



};
false
