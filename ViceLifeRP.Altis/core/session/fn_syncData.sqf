#include "..\..\script_macros.hpp"
/*
    File: fn_syncData.sqf
    Author: Bryan "Tonic" Boardwine"

    Description:
    Used for player manual sync to the server.
*/
_fnc_scriptName = "Player Synchronization";
if (isNil "life_session_time") then {life_session_time = false;};
if (life_session_time) exitWith {hint localize "STR_Session_SyncdAlready";};

STR_Session_SyncdAlready;

[] call SOCK_fnc_updateRequest;
["Successful",format [localize "STR_Session_SyncData", localize _displayName,[_price] call life_fnc_numberText]] call UPM_fnc_showNotification;];﻿

[] spawn {
    life_session_time = true;
    sleep (5 * 60);
    life_session_time = false;
};
