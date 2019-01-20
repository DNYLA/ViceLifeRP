#include "..\..\script_macros.hpp"
/*  
	File: fn_licenses.sqf  
	Author: Zippy  

	Description:  
	Open the licenses menu  
*/  

params [
    ["_shopNPC", objNull, [objNull]],
    "",
    "",
    ["_shopType", "", [""]]
];

if (isNull _shopNPC || {_shopType isEqualTo ""}) exitWith {};

private _shopSide = M_CONFIG(getText,"LicensesShops",_shopType,"side");

life_shop_type = _shopType;
life_shop_npc = _shopNPC;

private _exit = false;

if !(_shopSide isEqualTo "") then {
    private _flag = switch (playerSide) do {case west: {"cop"}; case independent: {"med"}; default {"civ"};};
    if !(_flag isEqualTo _shopSide) then {_exit = true;};
};

if (_exit) exitWith {};

private _conditions = M_CONFIG(getText,"LicensesShops",_shopType,"conditions");

if !([_conditions] call life_fnc_levelCheck) exitWith {hint localize "STR_Shop_Veh_NotAllowed";};

createDialog "license_shop";

[] call life_fnc_licshop_update;


/*
_display = findDisplay 5546;  
if(isNull _display) exitWith {};  
_listbox = _display displayCtrl 55126;  
_mylic = _display displayCtrl 55131;  
_struct = "";  
*/