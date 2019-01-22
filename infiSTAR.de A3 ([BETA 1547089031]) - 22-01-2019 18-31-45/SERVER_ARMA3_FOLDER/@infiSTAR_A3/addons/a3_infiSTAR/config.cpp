/*
	Author: Chris(tian) "infiSTAR" Lorenzen
	EMail: admin@infiSTAR.de
	Homepage: https://infiSTAR.de

	Copyright infiSTAR. All rights reserved.
*/
class CfgPatches
{
	class a3_infiSTAR
	{
		requiredVersion = 0.19125;
		requiredAddons[] = {};
		units[] = {};
		weapons[] = {};
		magazines[] = {};
		ammo[] = {};
		author[]= {"Chris(tian) 'infiSTAR' Lorenzen"};
		website[]= {"https://infiSTAR.de"};
		contact[]= {"admin@infiSTAR.de","infiSTAR23@gmail.com"};
		version = '[BETA 1547089031]';
		licensed = "danny13653@gmail.com";
	};
};
class CfgFunctions
{
	class a3_infiSTAR
	{
		class main
		{
			file = "a3_infiSTAR";
			class postInit { postInit = 1; };
		};
	};
};