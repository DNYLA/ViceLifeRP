/*
	Author: Chris(tian) "infiSTAR" Lorenzen
	Contact: infiSTAR23@gmail.com // www.infiSTAR.de
*/
if(missionNameSpace getVariable ["infistar_run",false])exitWith{
	diag_log format["<infiSTAR.de> infiSTAR was already started! Make sure that your mission is not looping due to config errors.."];
	diag_log format["<infiSTAR.de> You need to restart your server properly to start infiSTAR. Just restarting the mission does not work."];
};
missionNameSpace setVariable ["infistar_run",true];

#include "infiSTAR_config.sqf"
comment 'Antihack & AdminTools - Christian Lorenzen - www.infiSTAR.de - License: (CC)';
true