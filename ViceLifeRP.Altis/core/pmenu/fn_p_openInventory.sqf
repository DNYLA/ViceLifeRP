#include "..\..\script_macros.hpp"
/*
    File: fn_p_openMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Opens the players virtual inventory menu
*/
if (!alive player) exitWith {}; //Prevent them from opening this for exploits while dead.
createDialog "Life_Inventory";
disableSerialization;

[] call life_fnc_p_updateInventory;
