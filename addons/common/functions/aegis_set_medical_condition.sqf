_target = _this select 0;
_medical_data = _this select 1;

// Zerando damage por vias das dúvidas
_target setDamage 0;

_medical_open_wounds = _medical_data select 0;
_medical_bandaged_wounds = _medical_data select 1;
_medical_internal_wounds = _medical_data select 2;
_medical_tourniquets = _medical_data select 3;
_medical_body_status = _medical_data select 4;
_medical_pain = _medical_data select 5;
_medical_morphine = _medical_data select 6;
_medical_blood_volume = _medical_data select 7;
_medical_heart_rate = _medical_data select 8;
_medical_heart_rate_adj = _medical_data select 9;
_medical_blood_pressure = _medical_data select 10;
_medical_peripheral_resistance = _medical_data select 11;
_medical_fractures = _medical_data select 12;
_medical_triage_lvl = _medical_data select 13;
_medical_triage_card = _medical_data select 14;
_medical_salineIV_volume = _medical_data select 15;
_medical_plasmaIV_volume = _medical_data select 16;
_medical_bloodIV_volume = _medical_data select 17;
_medical_airway_status = _medical_data select 18;
_medical_airway_occluded = _medical_data select 19;
_medical_airway_collapsed = _medical_data select 20;

// Determina condicao medica
_target setVariable ["ace_medical_openWounds", _medical_open_wounds, true];
_target setVariable ["ace_medical_bandagedWounds", _medical_bandaged_wounds, true];
_target setVariable ["ace_medical_internalWounds", _medical_internal_wounds, true];
_target setVariable ["ace_medical_tourniquets", _medical_tourniquets, true];
_target setVariable ["ace_medical_bodyPartStatus", _medical_body_status, true];
_target setVariable ["ace_medical_pain", _medical_pain, true];
_target setVariable ["ace_medical_morphine", _medical_morphine, true];
_target setVariable ["ace_medical_bloodVolume", _medical_blood_volume, true];
_target setVariable ["ace_medical_heartRate", _medical_heart_rate];
_target setVariable ["ace_medical_heartRateAdjustments", _medical_heart_rate_adj];
_target setVariable ["ace_medical_bloodPressure", _medical_blood_pressure];
_target setVariable ["ace_medical_peripheralResistance", _medical_peripheral_resistance];
_target setVariable ["ace_medical_fractures", _medical_fractures, true];
_target setVariable ["ace_medical_triageLevel", _medical_triage_lvl, true];
_target setVariable ["ace_medical_triageCard", _medical_triage_card, true];
_target setVariable ["ace_medical_salineIVVolume", _medical_salineIV_volume, true];
_target setVariable ["ace_medical_plasmaIVVolume", _medical_plasmaIV_volume, true];
_target setVariable ["ace_medical_bloodIVVolume", _medical_bloodIV_volume, true];
_target setVariable ["ace_medical_airwayStatus", _medical_airway_status];
_target setVariable ["ace_medical_airwayOccluded", _medical_airway_occluded];
_target setVariable ["ace_medical_airwayCollapsed", _medical_airway_collapsed];
