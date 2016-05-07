_arsenal = allMissionObjects "B_supplyCrate_F";
format["Arsenal encontrados:  %1", _arsenal] call aegis_log;
_atm = allMissionObjects "Land_Laptop_unfolded_F";
format["ATM encontrados:  %1", _atm] call aegis_log;


format["Qtd arsenal:  %1", count _arsenal] call aegis_log;
format["Qtd atm:  %1", count _atm] call aegis_log;



// ## Valores ################################################################################################

// TODO: Colocar dinamico
START_MONEY = 25000; 			// Dinheiro inicial para quem ainda não ganhou nada.

// Arsenal ///////////////////////////////////////////////////////////////////////////////////////////////////////

// TODO: Colocar dinamico
ARSENAL_COST = 10250;			// Custo de acesso ao Arsenal
publicVariable "ARSENAL_COST";
// #################################################################################################################


if (count _arsenal > 0) then {

	// Ativa o arsenal
  {
    clearMagazineCargoGlobal _x;
    clearWeaponCargoGlobal _x;
    clearItemCargoGlobal _x;
    clearBackpackCargoGlobal _x;



    _x allowDamage false;
  	[
  		[
  			_x,
  			[
  				"<t color='#FF0000'>Solicitar equipamento ($"+format["%1", ARSENAL_COST]+")</t>",
  				{

            _player = _this select 1;

            if (ARSENAL_COST > SALDO ) then {

              ["saldo_insuficiente"] call aegis_notice;

            } else {
              [ARSENAL_COST, _player, "retirada"] remoteExecCall ["aegis_transaction",2];
              ["Preload"] call BIS_fnc_arsenal;
              ["Open",true] call BIS_fnc_arsenal;
              playSound "cash";
            };
  				},
  				nil,
  				6,
  				true,
  				true,
  				"",
  				"_this distance _target < 5"
  			]
  		],
  		"addAction",
  		true,
  		true,
  		false
  	] call BIS_fnc_MP;

  } forEach _arsenal;
};



if (count _atm > 0) then {
  {
    _x allowDamage false;
    [
      [
        _x,
        [
          "<t color='#009900'>Verificar fundos</t>",
          {
            _player = _this select 1;
            [0, _player, "saldo"] remoteExecCall ["aegis_transaction",2];
            ["saldo",SALDO] call aegis_notice;

          },
          nil,
          6,
          true,
          true,
          "",
          "_this distance _target < 5"
        ]
      ],
      "addAction",
      true,
      true,
      false
    ] call BIS_fnc_MP;
  } forEach _atm;
};
