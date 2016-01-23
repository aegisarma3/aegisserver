
private["_parameters","_query","_result"];
_parameters = _this;
_query = [0, AegisDatabaseSessionId, _parameters] joinString ":";
_result = call compile ("extDB2" callExtension _query);
format["Busca: %1", _result] call aegis_log;
switch (_result select 0) do
{
	case 0:
	{
		(format["Erro no banco de dados: %1", (_result select 1)]) call aegis_log;
	};
	case 2:
	{
		_result = (_result select 1) call aegis_handleBig;
	};
};
(_result select 1) select 0
