private["_isKnownAccount"];
_uid = _this select 0;
_name = _this select 1;
_mapname = format["%1",worldName];

if !(_uid in ["", "__SERVER__", "__HEADLESS__"]) then
{
	format["O Jogador %1 (UID %2) conectou!", _name, _uid] call aegis_log;
	_isKnownAccount = format["isKnownAccount:%1", _uid] call aegis_select_field;
	format["O jogador ja existe no banco de dados? -> %1", _isKnownAccount] call aegis_log;
	if (_isKnownAccount) then
	{
		format["Iniciando reposicionamento e loadout de %1 (UID %2)", _name, _uid] call aegis_log;

		format["startAccountSession:%1:%2", _uid, _name] call aegis_write_data;

		// Utilizando o spawn para iniciar um SCHEDULED ENV, senão ele ignora o while loop após 10000 iterações...
		[_uid,_name] spawn {
			[_this select 0, _this select 1] call aegis_prepare_player;
		};

	}
	else
	{
		format["Criando conta para %1 (UID %2)", _name, _uid] call aegis_log;
		format["createAccount:%1:%2", _uid, _name] call aegis_write_data;
	};
};
true
