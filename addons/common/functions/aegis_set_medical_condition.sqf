_target = _this select 0;
_damageBodyParts = _this select 1;

// Zerando damage por vias das dúvidas
_target setDamage 0;

// Voltando status inicial do player em relação a parte médica
{
    private _hitPointName = [_target, _x, true] call ace_medical_fnc_translateSelections;
    _target setHitPointDamage [_hitPointName, (_damageBodyParts select _foreachIndex) min 0.95];
} foreach ace_medical_SELECTIONS;
