#include "..\..\script_macros.hpp"
/*
    File: fn_licshop_update.sqf
    Author: Zippy

    Description:
    License shop Updater
*/
private["_buylic_list","_curlic_list","_shopLicenses","_name","_price","_struct","_side"];
disableSerialization;


//Setup control vars.
_buylic_list = CONTROL(5546,55126);
_curlic_list = CONTROL(5546,55131);

//Purge list
lbClear _buylic_list;
lbClear _curlic_list;

//Buy Licenses
if (!isClass(missionConfigFile >> "LicensesShops" >> life_shop_type)) exitWith {closeDialog 0; hint localize "STR_NOTF_ConfigDoesNotExist";}; //Make sure the entry exists..
ctrlSetText[2403,localize (M_CONFIG(getText,"LicensesShops",life_shop_type,"name"))];
_shopLicenses = M_CONFIG(getArray,"LicensesShops",life_shop_type,"items");

{
    _displayName = M_CONFIG(getText,"Licenses",_x,"displayName");
    _price = M_CONFIG(getNumber,"Licenses",_x,"price");
	
    if (!(_price isEqualTo -1)) then {
        _buylic_list lbAdd format["%1  (£%2)",(localize _displayName),[_price] call life_fnc_numberText];
        _buylic_list lbSetData [(lbSize _buylic_list)-1,_x];
        _buylic_list lbSetValue [(lbSize _buylic_list)-1,_price];
        _icon = M_CONFIG(getText,"Licenses",_x,"icon");
        if (!(_icon isEqualTo "")) then {
            _buylic_list lbSetPicture [(lbSize _buylic_list)-1,_icon];
        };
    };
} forEach _shopLicenses;

//Show licenses

_side = switch (playerSide) do {case west:{"cop"}; case civilian:{"civ"}; case independent:{"med"};};
_struct = "";

{
    _name = getText(_x >> "displayName");

    if (LICENSE_VALUE(configName _x,_side)) then {
        _struct = _struct + format["%1<br/>",localize _name];
    };
} forEach (format["getText(_x >> 'side') isEqualTo '%1'",_side] configClasses (missionConfigFile >> "Licenses"));

if (_struct isEqualTo "") then {
    _struct = "No Licenses";
};
		_curlic_list ctrlSetStructuredText parseText format ["<t size='0.8px'>%1</t>",_struct];