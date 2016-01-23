private["_log"];
_log = format["AEGIS - %1", _this];
if(isNil "MAR_fnc_log")then
{
	diag_log _log;
}
else
{
	[_log,"info"] call MAR_fnc_log;
		diag_log _log;
};
true
