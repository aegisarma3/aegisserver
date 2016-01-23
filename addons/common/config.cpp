class CfgPatches
{
	class aegis_server
	{
		requiredVersion = 0.1;
		requiredAddons[] = {"ace_main","CBA_XEH"};
		units[] = {};
		weapons[] = {};
		magazines[] = {};
		ammo[] = {};
	};
};


class CfgFunctions
{
	class aegis
	{
		class init
		{
			class serverInit {
				file = "aegisserver\addons\common\functions\serverInit.sqf";
				preInit = 1;
			};
			class playerInit {
				file = "aegisserver\addons\common\functions\playerInit.sqf";
				posInit = 1;
			};
		};
	};
};
