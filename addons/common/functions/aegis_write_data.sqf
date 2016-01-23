private["_parameters","_query"];
_parameters = _this;
_query = [1, AegisDatabaseSessionId, _parameters] joinString ":";
"extDB2" callExtension _query;
true
