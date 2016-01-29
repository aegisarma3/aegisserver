_amount = _this select 0;
_player = _this select 1;
_transaction_type = _this select 2;

_name = name _player;
_uid = getPlayerUID _player;
_owner = owner _player;

switch (toLower(_transaction_type)) do {
    case "saldo":  {

    _result = format["checkPlayerMoney:%1", _uid] call aegis_select_field;
    SALDO = _result;
    _owner publicVariableClient "SALDO";

    format["Saldo de %1(%2): $%3", _name, _uid, _result] call aegis_log;


    };
    case "retirada": {

      _current_balance = format["checkPlayerMoney:%1", _uid] call aegis_select_field;
      _current_balance = _current_balance - _amount;

      if (_current_balance <= 0) then {
          _current_balance = 0;
          SALDO = _current_balance;
          _owner publicVariableClient "SALDO";
          format["updatePlayerMoney:%1:%2", _current_balance, _uid] call aegis_write_data;
          format["Retirada de $%1 de %2(%3). Saldo: $%4", _amount, _name, _uid, _current_balance] call aegis_log;
      } else {
          SALDO = _current_balance;
          _owner publicVariableClient "SALDO";
          format["updatePlayerMoney:%1:%2", _current_balance, _uid] call aegis_write_data;
          format["Retirada de $%1 de %2(%3). Saldo: $%4", _amount, _name, _uid, _current_balance] call aegis_log;
      };

    };
    case "deposito": {

      _current_balance = format["checkPlayerMoney:%1", _uid] call aegis_select_field;
      _current_balance = _current_balance + _amount;
      SALDO = _current_balance;
      _owner publicVariableClient "SALDO";
      format["updatePlayerMoney:%1:%2", _current_balance, _uid] call aegis_write_data;

      ["Transaction", ["Você recebeu um pagamento.", format["Foram depositados $%1 em sua conta.",_amount]]] remoteExecCall ["BIS_fnc_showNotification", _player];
      "cash" remoteExecCall ["playSound", _player];

      format["Deposito de $%1 feito para %2(%3). Saldo: $%4", _amount, _name, _uid, _current_balance] call aegis_log;

    };
    default { "Um tipo de transacao deve ser definida na call" call aegis_log; };
};
