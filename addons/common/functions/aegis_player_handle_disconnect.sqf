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

  // Pega a condicao médica do player
  _medical_condition = str formatText ["%1", (_unit call aegis_get_medical_condition)];
  format["Condicao medica de %1 (UID %2):  %3", _name, _uid, _medical_condition] call aegis_log;

  format["endAccountSession:%1", _uid] call aegis_write_data;

  _hasPlayerPositionOnMap = format["hasPlayerPositionOnMap:%1:%2", _mapname,_uid] call aegis_select_field;
  format["%1 (UID %2) ja possui marcacao no mapa?  %3", _name, _uid, _hasPlayerPositionOnMap] call aegis_log;

  if (_hasPlayerPositionOnMap) then
  {
    "Atualizando posicao no mapa" call aegis_log;
    format["updatePlayerPosition:%1:%2:%3:%4:%5:%6", _uid, _mapname, _direction, _posx, _posy, _posz] call aegis_write_data;
    "Atualizando condicao medica e inventario" call aegis_log;
    format["updatePlayer:%1:%2:%3:%4", _medical_condition, _inventory, _uid, _mapname] call aegis_write_data;
  }
  else
  {
    "Criando posicao no mapa" call aegis_log;
    format["insertPlayerPosition:%1:%2:%3:%4:%5:%6", _uid, _mapname, _direction, _posx, _posy, _posz] call aegis_write_data;
    "Criando condicao medica e inventario" call aegis_log;
    format["createPlayer:%1:%2:%3:%4", _uid, _mapname, _medical_condition, _inventory] call aegis_write_data;
  };

  if (!isNull _unit) then {
      deleteVehicle _unit;
  };

};
false
