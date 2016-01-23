private["_key","_result","_pipe"];
_key = _this;
_result = "";
while{true} do
{
	_pipe = "extDB2" callExtension format["5:%1", _key];
	if(_pipe isEqualTo "") exitWith {};
	_result = _result + _pipe;
};
call (compile _result)
