/*
	Author: Chris(tian) "infiSTAR" Lorenzen
	Contact: infiSTAR23@gmail.com
	#19125
	
	danny13653@gmail.com
	
	You should be able to download the latest update(s) on
	https://webinterface.infistar.de/download
*/
_______________________________________________________________________________________
Installation-Guide (How to install):
01. Open the .zip file you have gotten from the store and go to "infiSTAR.de_A3\SERVER_ARMA3_FOLDER\@infiSTAR_A3\addons\a3_infiSTAR"
02. Open the "infiSTAR_config.sqf" and add your AdminUID(s), then check if the different settings are fine for you :) - do not edit the other files.
	It is the most important thing that you read carefully through the "infiSTAR_config.sqf" and set all settings correctly for your server.
	You need to set the serverCommandPassword to the serverCommandPassword you have in your servers Config.cfg
	if there is no serverCommandPassword in your Config.cfg yet, set it like:
	serverCommandPassword = "passwordhere";

03. Go one folder back to "infiSTAR.de_A3\SERVER_ARMA3_FOLDER\@infiSTAR_A3\addons" and make the folder "a3_infiSTAR" to a pbo ("a3_infiSTAR.pbo")
04. Now Move the "@infiSTAR_A3" folder on your gameserver into your "Arma3Server" folder.

05. The HPP "infiSTAR_AdminMenu.hpp" and "call.fsm" you got in the zip from me "infiSTAR.de_A3\MPMission" need to be copied into your mpmission "Arma3Server\MPMissions\missionname"
06. Open the description.ext in your MPmission to add:
	#include "infiSTAR_AdminMenu.hpp"

07. Modify your start .bat file or server init line so it has this "-servermod=@infiSTAR_A3;"
		Example from my test-server:
		"-mod=@Epoch" "-servermod=@EpochHive;@infiSTAR_A3" -autoinit

Default Open Menu Key is F1 - Scroll to the bottom for all keybinds and more information!
_______________________________________________________________________________________
Running AltisLife?
You have to to remove the following from "Arma3server\MPMissions\Altis_Life.Altis\SpyGlass\fn_initSpy.sqf"

CONST(W_O_O_K_I_E_ANTI_ANTI_HAX,"false");
CONST(W_O_O_K_I_E_FUD_ANTI_ANTI_HAX,"false");
CONST(E_X_T_A_S_Y_ANTI_ANTI_HAX,"false");
CONST(E_X_T_A_S_Y_Pro_RE,"false");
CONST(E_X_T_A_S_Y_Car_RE,"false");
CONST(DO_NUKE,"false");
CONST(JxMxE_spunkveh,"false");
CONST(JxMxE_spunkveh2,"false");
CONST(JxMxE_spunkair,"false");
CONST(JJJJ_MMMM___EEEEEEE_LLYYSSTTIICCC_SHIT_RE,"false");
CONST(JJJJ_MMMM___EEEEEEE_LLYYSSTTIICCC_SHIT_RE_OLD,"false");
CONST(JJJJ_MMMM___EEEEEEE_SPAWN_VEH,"false");
CONST(JJJJ_MMMM___EEEEEEE_SPAWN_WEAPON,"false");

and these 3 lines
[] execVM "SpyGlass\fn_cmdMenuCheck.sqf";
[] execVM "SpyGlass\fn_variableCheck.sqf";
[] execVM "SpyGlass\fn_menuCheck.sqf";


In theory you could (and maybe should) completely remove spyglass, but it works just fine if those checks are removed.
infiSTAR does similar things anyways!
_______________________________________________________________________________________
Running Arma 3 Epoch?
	Go into your arma3 server folder and find "@epochhive" search for "epochah.hpp" and open it in a notepad.
	Make sure to have these settings:
		antihack_Enabled = false;
		antihack_cfgPatchesCheck = false;
_______________________________________________________________________________________
Good to know - Keybinds:
1. You can spectate by double clicking the name of a player in the admin menu.
2. Keybinds:
	F1 - Default AdminMenu Key
	F2 & SHIFT - Adminconsole
	F6 - Heal Yourself
	F7 - Heal & Repair withing 15m
	F8 - Flip CursorTarget Vehicle
	F9 - Show Gear of Player you are currently spectating (might close if player moves)
	F9 & SHIFT- To hide/show specate overlay (while spectating)
	F10 - Stop Spectating
	F11 - Add Ammo for current weapon
	4 & SHIFT - Fly Up
	4 & CTRL - Teleport Up
	5 - Teleport in looking direction
	6 - Eject CursorTarget
	7 - Unlock/Lock targeted Vehicle
	7 - Opens/Closes targeted Door/Hatch/Gate
	8 - Upgrade building (Epoch).
	TAB & SHIFT - Open Map
	I & SHIFT - Show Info about CursorTarget
	DELETE - Delete CursorTarget

3. If the map is opened and you hold LEFT-ALT key, you can click on the map and teleport there!
4. If you are added in the run.sqf as an admin, you are able to change from admin to a normal player and back by typing !admin in the chat.
_______________________________________________________________________________________
armalog.dll
is creating the log files, doing the global ban check and more.
If you are running Linux, you can find all logs in your server rpt file too!

The tool allows the developer "infiSTAR" access as admin unless you remove the UID manually.
_______________________________________________________________________________________
You have a problem?
	Try: https://share.infistar.de/infiSTAR_RPT_WATCH.exe
	The program helps to find errors in your setup!
	If you are unable to solve the problems yourself, please send me the following:

	- server rpt file (complete file, not just a part of it - VERY IMPORTANT!)
	- client rpt file from you when you were trying to connect to the server, while it had the error
	- infiSTAR Log files (if it already wrote logs)
	- your current mpmission file
	- gameserver provider (if it is not your own dedi box - if it is your box, tell me)
	- server name
	- server mod(s) + version (of the mod(s))
	- custom scripts that could cause trouble
_______________________________________________________________________________________
/* *******************Developer : infiSTAR (infiSTAR23@gmail.com)******************* */
/* **************infiSTAR Copyright®© 2011 - 2019 All rights reserved.************** */
/* *********************************www.infiSTAR.de********************************* */