_ammount = _this select 0;
_player = _this select 1;
_transaction_type = _this select 2;
_name = name _player;
_uid = getPlayerUID _player;

switch (toLower(_transaction_type)) do {
    case "saldo":  {

    _result = format["checkPlayerMoney:%1", _uid] call aegis_select_field;
    format["Saldo de %1(%2): $%3", _name, _uid, _result] call aegis_log;

    };
    case "retirada": {

      _current_balance = format["checkPlayerMoney:%1", _uid] call aegis_select_field;
      _current_balance = _current_balance - _ammount;

      if (_current_balance <= 0) then {
          _current_balance = 0;
          format["updatePlayerMoney:%1:%2", _current_balance, _uid] call aegis_write_data;
          format["Retirada de $%1 de %2(%3). Saldo: $%4", _ammount, _name, _uid, _current_balance] call aegis_log;
      } else {
          format["updatePlayerMoney:%1:%2", _current_balance, _uid] call aegis_write_data;
          format["Retirada de $%1 de %2(%3). Saldo: $%4", _ammount, _name, _uid, _current_balance] call aegis_log;
      };

    };
    case "deposito": {

      _current_balance = format["checkPlayerMoney:%1", _uid] call aegis_select_field;
      _current_balance = _current_balance + _ammount;

      format["updatePlayerMoney:%1:%2", _current_balance, _uid] call aegis_write_data;
      format["Deposito de $%1 feito para %2(%3). Saldo: $%4", _ammount, _name, _uid, _current_balance] call aegis_log;

    };
    default { "Um tipo de transacao deve ser definida na call" call aegis_log; };
};
