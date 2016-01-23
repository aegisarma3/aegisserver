_target = _this;
_damageBodyParts = _target getvariable ["ace_medical_bodyPartStatus", [0,0,0,0,0,0]];
_damageBodyParts


/*

_target setDamage 0
{
    private _hitPointName = [_target, _x, true] call ace_medical_fnc_translateSelections;
    _target setHitPointDamage [_hitPointName, (_damageBodyParts select _foreachIndex) min 0.95];
} foreach ace_medical_SELECTIONS;

*/
