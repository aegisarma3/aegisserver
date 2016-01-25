private["_target","_medical_open_wounds","_medical_bandaged_wounds","_medical_internal_wounds","_medical_tourniquets","_medical_body_status","_medical_pain","_medical_morphine","_medical_blood_volume","_medical_heart_rate","_medical_heart_rate_adj","_medical_blood_pressure","_medical_peripheral_resistance","_medical_fractures","_medical_triage_lvl","_medical_triage_card","_medical_salineIV_volume","_medical_plasmaIV_volume","_medical_bloodIV_volume","_medical_airway_status","_medical_airway_occluded","_medical_airway_collapsed"];

_target = _this;
_medical_open_wounds = _target getvariable ["ace_medical_openWounds",[]];
_medical_bandaged_wounds = _target getvariable ["ace_medical_bandagedWounds",[]];
_medical_internal_wounds = _target getvariable ["ace_medical_internalWounds",[]];
_medical_tourniquets = _target getvariable ["ace_medical_tourniquets", [0,0,0,0,0,0]];
_medical_body_status = _target getvariable ["ace_medical_bodyPartStatus", [0,0,0,0,0,0]];
_medical_pain = _target getvariable ["ace_medical_pain", 0];
_medical_morphine = _target getvariable ["ace_medical_morphine", 0];
_medical_blood_volume = _target getvariable ["ace_medical_bloodVolume", 100];

_medical_heart_rate = _target getvariable ["ace_medical_heartRate", 80];
_medical_heart_rate_adj = _target getvariable ["ace_medical_heartRateAdjustments", []];
_medical_blood_pressure = _target getvariable ["ace_medical_bloodPressure", [80, 120]];
_medical_peripheral_resistance = _target getvariable ["ace_medical_peripheralResistance", 100];

// fractures
_medical_fractures = _target getvariable ["ace_medical_fractures", []];

// triage card and logs
_medical_triage_lvl = _target getvariable ["ace_medical_triageLevel", 0];
_medical_triage_card = _target getvariable ["ace_medical_triageCard", []];

// IVs
_medical_salineIV_volume = _target getvariable ["ace_medical_salineIVVolume", 0];
_medical_plasmaIV_volume = _target getvariable ["ace_medical_plasmaIVVolume", 0];
_medical_bloodIV_volume = _target getvariable ["ace_medical_bloodIVVolume", 0];

// airway
_medical_airway_status = _target getvariable ["ace_medical_airwayStatus", 100];
_medical_airway_occluded = _target getvariable ["ace_medical_airwayOccluded", false];
_medical_airway_collapsed = _target getvariable ["ace_medical_airwayCollapsed", false];

// medical data
_medical_data = [_medical_open_wounds,_medical_bandaged_wounds,_medical_internal_wounds,_medical_tourniquets,_medical_body_status,_medical_pain,_medical_morphine,_medical_blood_volume,_medical_heart_rate,_medical_heart_rate_adj,_medical_blood_pressure,_medical_peripheral_resistance,_medical_fractures,_medical_triage_lvl,_medical_triage_card,_medical_salineIV_volume,_medical_plasmaIV_volume,_medical_bloodIV_volume,_medical_airway_status,_medical_airway_occluded,_medical_airway_collapsed];

_medical_data
