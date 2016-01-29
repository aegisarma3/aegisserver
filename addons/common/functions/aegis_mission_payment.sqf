params ["_amount", ["_alive_only", false]];

_allHumanPlayers = allPlayers - entities "HeadlessClient_F";

_allAlivePlayers = [];

_operators = 0;

if (_alive_only) then {
  {
    if (alive _x) then {
      _allAlivePlayers pushBack _x;
    }
  } forEach _allHumanPlayers;
  _operators = count _allAlivePlayers;
  format["Players vivos: %1", _operators] call aegis_log;

} else {
  _operators = count _allHumanPlayers;
  format["Players: %1", _operators] call aegis_log;
};






_companyMoney = "checkCompanyMoney" call aegis_select_field;
format["Saldo da empresa (antes): $%1", _companyMoney] call aegis_log;

if (_companyMoney <= 0) then {_companyMoney = 0;};
_companyShare = ceil(0.3 * _amount);

_companyMoney = _companyMoney + _companyShare;
format["updateCompanyMoney:%1", _companyMoney] call aegis_write_data;
format["Lucro da empresa na missao: $%1", _companyShare] call aegis_log;
format["Saldo da empresa (depois): $%1", _companyMoney] call aegis_log;


_individualOperatorShare = ceil((_amount - _companyShare) / _operators);
format["Lucro de cada operador na missao: $%1", _individualOperatorShare] call aegis_log;






if (_alive_only) then {

  {
    _balance = format["checkPlayerMoney:%1", getPlayerUID _x] call aegis_select_field;
    _balance = _balance + _individualOperatorShare;
    [_balance, _x, "deposito"] call aegis_transaction;

  } forEach _allAlivePlayers;

} else {

  {
    _balance = format["checkPlayerMoney:%1", getPlayerUID _x] call aegis_select_field;
    _balance = _balance + _individualOperatorShare;
    [_balance, _x, "deposito"] call aegis_transaction;

  } forEach _allHumanPlayers;

};
