/*
	File: infiSTAR_config.sqf
	Author: Chris(tian) "infiSTAR" Lorenzen
	Contact: infiSTAR23@gmail.com
	
	Description:
	Arma AntiHack & AdminTools - infiSTAR.de
	
	ON LINUX YOU NEED THIS PARAMETER: -profiles
*/


/*
	"serverCommandPassword" is serverCommandPassword - in your servers config.cfg
	if your config.cfg does not have serverCommandPassword yet, simply add it in a new line:
	serverCommandPassword = "changeme";
	
	This is   VERY IMPORTANT   as it is needed to KICK & BAN people.
*/
_serverCommandPassword = 'CommandPass1234';

/*
	"_passwordAdmin" is passwordAdmin - in your servers config.cfg, needed for servercommands from client
	
	This is used to be able to use the "login" function ingame. Will log you in as Arma "Admin".
*/
_passwordAdmin = 'Life1234';
/* _serverCommandPassword and _passwordAdmin should always be different passwords or it could cause problems! */



/*//
	_MOD can be 'Epoch', 'AltisLife', 'KOTH', 'WASTELAND' or 'Other'.
	You have to set the mod you run manually
	e.g.
	_MOD = 'Other';

	(should be AltisLife for any "Life" Mod - if it doesn't work you can still change it to other / empty string)
*/
_MOD = 'AltisLife';







/* "_OPEN_ADMIN_MENU_KEY": Key to open the menu (google DIK_KeyCodes (0x3B is F1))   */
_OPEN_ADMIN_MENU_KEY = 0x3B;

/* What ESCAPE Menu shows */
_ESCMNUTOP = 'ViceLifeRP';
_ESCMNUBOT = 'By Dan Rochmin & Nuddalovi';
_BRIEFING_MSG = false;	/* use mission briefing message: if   "_BRIEFING_MSG = false;"   then the message will be replaced by infiSTAR */

/* shows RESTART IN X MINS */
_USE_RESTART_TIMER = true;	/* true or false */
_RESTART_TIME_IN_M = 240;		/* restart time in minutes */
_SHOW_TIMER_IN_MIN = [1,2,3,5,10,15,20,30];	/* minutes before restart, when message is shown */

/* The following 3 options can be disabled by putting the value to -1. For example "_TGV = -1;" */
/* Terrain Grid Value   */ _TGV = 40;		/* 50, 25, 12.5  */	/* if set to 50 grass will be very low for better client FPS.. default is 25 ~35 is good performance and grass :) */
/* ViewDistance Value   */ _VDV = 1000;
/* ObjectViewDistance   */ _VOV = 800;

/* "_LogAdminActions": Sends actions done by each admin to the server to log it to the .txt file and .rpt file + sends it back to all other admins. */
_LogAdminActions = true;	/* true or false */
_enableIngameLogs = true;	/* true or false */

/* Use infiSTAR Tild (CommandingMenu) */
_useTildMenu = true;	/* true or false */

/* "_startAsNormal": if you add admin UIDs in here as well, they will start as almost "normal" player instead of with admin menu and such. */
_startAsNormal =
[
	'0','0','0'
];
/* if one of the admins with the UIDs in "_startAsNormal" uses the !admin command to login as admin, it will be announced to ANYONE on the server if "_announce_adminstate_changed" is true. */
_announce_adminstate_changed = true;	/* true or false */
_use_html_load_on_adminmenu = true;		/* default and recommended is TRUE. infiSTAR updates and news are announced in the top right corner when you open the AdminMenu if this is true! */


_adminUIDandAccess =
[
	[
		['76561198172055451','76561198095943386'],	// hig
		[
			'Teleport On Map Click','Teleport - Target To Me','Teleport - Me To Target','Teleport In Facing Direction (10m steps)',
			'spectating','AdminConsole','Delete Vehicle','FlyUp','EjectTarget','ToggleVehLock','ShowGear',
			'HealSelf','HealRepairNear','AdminStart','AdminLog','Freeze Target','UnFreeze Target',
			'==== Loadouts ====','==== WeatherLord ====','==== Base Deleter ====','==== VirtualItems ====',
			'==== Weapons ====','==== Magazines ====','==== Bags ====','==== Vehicles ====','==== Objects ====','==== AltisLife Money ====',
			'Remove Gear','Revive','Heal','Restore','Move In My Vehicle','Move In Target Vehicle','Parachute Target',
			'Spawn UAV','Spawn Cloak','Spawn Sapper','Spawn SapperB','Eject','Eject Crew','Kill','Explode','MineField (around target)','Zeus','Force Disconnect',
			'Kick (Silent)','Kick (Announce)','Ban (Silent)','Ban (Announce)',
			'Default Epoch Player ESP','Default Epoch Vehicle ESP','infiSTAR Player ESP 1',
			'infiSTAR Player ESP 2','infiSTAR Dead ESP','infiSTAR AI ESP',
			'infiSTAR LockBox ESP','infiSTAR Shelf ESP','infiSTAR PlotPole ESP','Fake Epoch group to nearest PlotPole',
			'infiSTAR MapIcons','PlotPole Marker','Vehicle Marker','Construction Marker','LockBox Marker','DeadPlayer Marker',
			'God Mode','Vehicle God Mode','Lower Terrain','Vehboost','UnlimAmmo','noRecoil','FastFire','Stealth / Invisible',
			'Disable Announces','Show FPS','Give All Licenses','Call EMP','Mass Message','DayTime','NightTime','Add / Remove Crypto',
			'Spawn Epoch-Box','Spawn Support-Box1','Spawn Support-Box2','Spawn Support-Box3',
			'Spawn Ammo','showinfo','Login as Arma Admin','BIS FreeRoam Cam (works with ESP)','FreeRoam Cam (does not work with ESP)',
			'Request Steam Name','Dump unique client variables',
			'Restrain','Unrestrain',
			'Arsenal'	// Adds Arsenal to the mousewheel actions if you press "," on the Numpad!
		]
	],
	[
		['UID1',76561198095902501],	// med
		[
			'Teleport On Map Click','Teleport - Target To Me','Teleport - Me To Target','Teleport In Facing Direction (10m steps)',
			'spectating','AdminConsole','Delete Vehicle','FlyUp','EjectTarget','ToggleVehLock','ShowGear',
			'HealSelf','HealRepairNear','AdminStart','AdminLog','Freeze Target','UnFreeze Target',
			'==== Loadouts ====','==== WeatherLord ====','==== Base Deleter ====','==== VirtualItems ====',
			'==== Weapons ====','==== Magazines ====','==== Bags ====','==== Vehicles ====','==== Objects ====','==== AltisLife Money ====',
			'Remove Gear','Revive','Heal','Restore','Move In My Vehicle','Move In Target Vehicle','Parachute Target',
			'Spawn UAV','Spawn Cloak','Spawn Sapper','Spawn SapperB','Eject','Eject Crew','Kill','Explode','MineField (around target)','Zeus','Force Disconnect',
			'Kick (Silent)','Kick (Announce)','Ban (Silent)','Ban (Announce)',
			'Default Epoch Player ESP','Default Epoch Vehicle ESP','infiSTAR Player ESP 1',
			'infiSTAR Player ESP 2','infiSTAR Dead ESP','infiSTAR AI ESP',
			'infiSTAR LockBox ESP','infiSTAR Shelf ESP','infiSTAR PlotPole ESP','Fake Epoch group to nearest PlotPole',
			'infiSTAR MapIcons','PlotPole Marker','Vehicle Marker','Construction Marker','LockBox Marker','DeadPlayer Marker',
			'God Mode','Vehicle God Mode','Lower Terrain','Vehboost','UnlimAmmo','noRecoil','FastFire','Stealth / Invisible',
			'Disable Announces','Show FPS','Give All Licenses','Call EMP','Mass Message','DayTime','NightTime','Add / Remove Crypto',
			'Spawn Epoch-Box','Spawn Support-Box1','Spawn Support-Box2','Spawn Support-Box3',
			'Spawn Ammo','showinfo','BIS FreeRoam Cam (works with ESP)','FreeRoam Cam (does not work with ESP)',
			'Request Steam Name','Dump unique client variables',
			'Restrain','Unrestrain',
			'Arsenal'	// Adds Arsenal to the mousewheel actions if you press "," on the Numpad!
		]
	],
	[
		['76561198259894107'],	// low
		[
			'HealSelf',
			'Heal','infiSTAR Player ESP 1','infiSTAR Player ESP 2','Lower Terrain','noRecoil'
		]
	]
];


/*
	What is this?
	infiSTAR has a global ban system so hackers don't jump around servers and learn how to bypass infiSTAR.

	There was a situation where a group of people asked why their friend could not join the server.
	Well he was globally banned for hacking.. anyways - if you as a server admin want him to get in even tho he is globally banned,
	just ask for his UID and add the UID in the array below.
*/
_USE_GLOBAL_BAN_CHECK = true;		/* if false, it can not kick or ban global banned people but it will still "log" them. So you know a globally banned person joined your server. */
_BAN_GLOBAL_BANNED_LOCALLY = false;	/* if false, it will kick global banned people */
_UID_SKIP_GLOBAL_BAN_CHECK = 
[
	"UID1","UID2","UID3","..."
];
/* ********************************************************************************* */
/*            many checks should be set to true instead of false.                    */
/*     These are just diabled because the average user doesn't read this file..      */
/* ********************************************************************************* */
/*  Items Added Check    */ _IAC = false;	/* true or false */	/* checks if Items are being added unrightful! */
/*  Local Vehicle Check  */ _LVC = true;	/* true or false */
/*  unitRecoil checks    */ _URC = false;	/* true or false */	/* checks unitRecoilCoefficient and resets default unitRecoilCoefficient */
/*  Notification check   */ _UNC = false;	/* true or false */	/* _UNC = false; on AltisLife! - showNotification check */
/*  Use MPInterrupt check*/ _UMP = false;	/* true or false */
/*  Check BTTNs on D49   */ _B49 = false;	/* true or false */	/* will announce: BadButton on 49 */
/*  whitelist for _B49   */ _excludedButtons = [];	/* Will Kick for BadButton XYZ if a customnized button is not white-listed here. Example: _excludedButtons = [1010]; */
/*  Block Hold Actions   */ _BHA = false;	/* true or false */	/* recommended:  true  Used for Hackmenus. */
/*  Check Actions Plr    */ _CAP = false;	/* true or false */	/* "Actions: xxx/xxx possible scroll menu hack (or you added custom actions..)" */
/*  Remove Actions Plr   */ _OAP = false;	/* true or false */	/* Remove ALL Actions on Player Object: (mousewheel actions) needs to be  false  for AltisLife for e.g. gathering */
/*  Remove Actions Objs  */ _OAO = false;	/* true or false */	/* Remove ALL Actions on Objects near Player: (mousewheel actions) needs to be  false  when using e.g. IgiLoad */
/*  Check Attached Objs  */ _CAO = false;	/* true or false */	/* needs to be  false  when using e.g. IgiLoad */
/*  Use Anti Teleport    */ _UAT = false;	/* true or false */	/* might need to be set to false on other mods than Epoch! */
/*  Chat-Vote Day/Night  */ _VDN = true;	/* true or false */
/*  Check Vision Mode    */ _CVM = false;	/* true or false */
/*  check view distance  */ _CVD = false;	/* true or false */	/* if the viewdistance is not 1600 - ban. */
/*  check cameraOn       */ _CCO = false;	/* true or false */	/* needs to be false for UAV drones and such things.. */
/*  Map Icon Check       */ _MIC = false;	/* true or false */	/* Needs to be  false  on some WasteLand versions */
/*  Remove All Mines     */ _RAM = false;	/* true or false */
/*  Remove All UAVs      */ _RUS = false;	/* true or false */
/*  custom HandleDamage  */ _CHD = {};		/* this needs to be CODE */
/*  Revert allowDamage   */ _RAD = false;	/* true or false */	/* if you have safezones using "player allowDamage false;" or similar.. set _RAD = false; */
/*  Revert HandleDamage  */ _RHD = false;	/* true or false */	/* Needs to be  false  for Paintball script */
/*  EH_Draw3D check      */ _C3D = false;	/* true or false */	/* announces: "EH_Draw3D x should be y" */
/*  Revert KeyUp         */ _RUK = false;	/* true or false */	/* recommended:  true  Removes custom KeyUps and sets back the default ones (false with Task Force Radio ?) */
/*  Revert KeyDown       */ _RDK = false;	/* true or false */	/* recommended:  true  Removes custom KeyDowns and sets back the default ones (false with Task Force Radio ?) */
/*  Check Keybinds       */ _CKB = false;	/* true or false */	/* recommended:  true  _RKB needs to be true! Checks Keybinds, if it finds added ones it shows: "KeyBinds added   %1 should be %2" */
/*  check MapSingleClick */ _OMC = false;	/* true or false */	/* announces: "MapSingleClick modified", if modification is found - NEEDS _MBC to be true! */
/*  Remove Hit Handler   */ _REH = false;	/* true or false */	/* Needs to be  false  for Paintball script */
/*  Revert InventoryOpen */ _RIO = false;	/* true or false */	/* AltisLife only: Sets the custom InventoryOpened Handler */
/*  Revert Killed EH     */ _RKH = false;	/* true or false */
/*  check for RscDisplayArsenal */ _checkRscDisplayArsenal = true;	/* true or false */


/*
	this needs to be CODE
	Example:
	_customOnPlayerConnected = {
		params['_id','_uid','_name','_jip','_owner'];
		diag_log format['%1(%2) connected!',_name,_uid];
	};
*/
_customOnPlayerConnected = {};	




/* ------- MONEY CHECKS - BELOW ------- */
_USE_MONEY_CHECKS = true;			// Enable/disable these checks (off by default)

_LIFE_CASH_VAR = "life_cash";
_LIFE_CASH_ADD_LOG = 1000000;			// Log if x was added within 0.1 seconds
_LIFE_CASH_ADD_KICK = 10000000;			// Kick if x was added within 0.1 seconds

_LIFE_BANK_VAR = "life_bank";
_LIFE_BANK_ADD_LOG = 1000000;			// Log if x was added within 0.1 seconds
_LIFE_BANK_ADD_KICK = 10000000;			// Kick if x was added within 0.1 seconds
/* ------- MONEY CHECKS - ABOVE ------- */



/* ------- SOME EPOCH ONLY FUNCTIONS - BELOW ------- */
/*  Use CombatLog checks */ _CLG = false;	/* true or false */	/* "PLAYERNAME CombatLogged GPS X/Y find the dead body!"
/*  Use Anti Glitch      */ _UAG = true;	/* true or false */	/* a try to stop glitching through walls on Doors/Walls */
/*  Use Anti Wall Look   */ _AWL = false;	/* true or false */	/* *experimental* a try to stop people from watching through Epoch Doors/Walls */
/*  MPHit Log            */ _MPH = false;	/* true or false */	/* will create a A3_MPHIT.txt file where logs hits on players */
/* ------- SOME EPOCH ONLY FUNCTIONS - ABOVE ------- */




/* *** ROPING OPTIONS *** */
/*
	"_KFR" and "_RVR" can run together (both be true) but it is recommended to have both options to false and use "_RPR" with "true" state.
	That will allow players to Lift but they won't be able to drop cars full of people anywhere
*/
/* "_KFR": Will not allow any Rope attached to Vehicle Player - Needs to be  false  for some "towing" scripts.. */
_KFR = false;	/* true or false */

/* "_RVR": Will delete any Rope attached to Vehicle Player and close ones - Needs to be  false  for some "towing" scripts.. */
_RVR = false;	/* true or false */

/* "_RPR": Will only delete Ropes if the roped object has a crew! */
_RPR = false;	/* true or false */


/*  CommandingMenu Check */ _CMC = true;	/* true or false */
/*  Close ALL CMD-Menus  */ _KCM = true;	/* true or false */	/* Just closes All Commandingmenus (ignores the white-list below) */
/* _cMenu: if '_CMC = true;' then this array holds the ALLOWED Commanding Menus */
_cMenu =
[
	'',
	'RscMainMenu','RscMoveHigh','#WATCH','#WATCH0','RscWatchDir','RscWatchMoveDir','#GETIN','#RscStatus','RscCallSupport','#ACTION',
	'RscCombatMode','RscFormations','RscTeam','RscSelectTeam','RscReply','#User:BIS_Menu_GroupCommunication','#CUSTOM_RADIO',
	'RscRadio','RscGroupRootMenu','RscMenuReply','RscMenuStatus','#User:BIS_fnc_addCommMenuItem_menu','RscMenuMove','RscMenuFormations'
];


/*  Check Global Markers */ _CGM = false;	/* true or false */	/* you may need to disable this check for A.I. Missions - or whitelist the used Markers in the _aLocalM Array beneath */
/*  Check Local Markers  */ _CLM = false;	/* true or false */	/* false if you do not want LocalMarker to be checked. */
/*  Use _aLocalM array   */ _UMW = false;	/* true or false */	/* use allowed marker array from below (for example AltisLife uses house_ and others in there) or A.I. Missions */
/* _aLocalM: if '_CLM' && _UMW - this array of names will be allowed */
_aLocalM =
[
	'sek_','_marker','marker_','house_','_dead_marker','_gpstracker','cop','Marker200',
	'SEM_','Plane','Bandit','Strange'
];


/*
	if somebody talks on one of the following channels, his channel will be switched to "direct" channel
	0 = Global
	1 = Side
	2 = Command
	3 = Group
	4 = Vehicle
	5 = Direct <-- this is where people get switched too if they talk in one of the blacklisted channels!
	6-15 = Custom Radio (see radioChannelCreate)
*/
_disAllowVon = [0,1,2];




/* _badIDDsToKick will be checked before _badIDDsToClose, _badIDDsToClose will be checked before _allowedIDDs */
/* _badIDDsToKick: Forbidden Idds that will get you Kicked by the AH */
_badIDDsToKick = [-1337,133,167,1340,1341,1342,1343,1344,1345,1346,1347];

/* _badIDDsToClose: Forbidden Idds that will get closed by the AH */
_badIDDsToClose =
[
	2,3,7,17,19,25,26,27,28,29,30,31,32,37,40,41,43,44,45,51,52,53,56,74,85,
	106,126,127,132,146,147,150,152,153,154,155,159,162,164,262,
	314,632,1320,2121,148,163,129,169,157,69,
	312 // Zeus Menu
];

/* Use IDD White-List ? */ _UDW = false;	/* true or false */
/* _allowedIDDs: Insert IDDs here to prevent them from being closed! */
_allowedIDDs =
[
	// Displays whitelisted for Epoch
	-3000,-1900,-1500,-1338,-1300,-1200,-13,-8,-7,-6,-5,
	0,4,5,6,8,12,18,24,46,49,50,54,55,63,70,72,129,131,148,151,154,163,169,174,262,602,999,
	66600,77700,316000,
	
	// Different Displays from different mods/additions
	// (might not be needed at all but I've gotten so many emails like "INFISTAR CLOSES ATM MENU ON ALTIS LIFE.. people need to read this file..)
	160,
	9990,9992,9993,99440,
	-1,-2,-3,-4,-5,-9,-10,-11,-12,-14,-15,-666,300,301,302,303,304,13377,
	2620,2629,2621,2622,2624,2625,2630,2631,2632,601,2520,2523,2522,
	2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2300,2400,2600,
	2650,2700,2800,2900,3000,3100,3500,7300,38200,38300,38400,38500,39400
];




/*  Use Memoryhack check */ _UMH = false;	/* true or false */
/*  Use on(Un)Load check */ _UOL = false;	/* true or false */
/* _onLoadUnload1: The AntiHack will test if the client has the same entry as the server. (only if _UOL = true;) */
_onLoadUnload1 = [
	'RscDisplayCustomArcade','RscDisplayArcadeMap','RscDisplayArcadeModules','RscDisplayArcadeGroup',
	'RscDisplayArcadeWaypoint','RscDisplayArcadeMarker','RscDisplayArcadeSensor','RscDisplayArcadeEffects',
	'RscDisplayTemplateSave','RscDisplayTemplateLoad','RscDisplayIntel','RscDisplayMultiplayer','RscDisplayHostSettings',
	'RscDisplayRemoteMissionVoted','RscDisplayMultiplayerSetup','RscDisplayMultiplayerSetupParams','RscDisplayMultiplayerSetupParameter',
	'RscDisplayFilter','RscDisplayDebugPublic','RscDisplayOptionsGUI','RscDisplayMovieInterrupt','RscFunctionsViewer','RscDisplayConfigViewer',
	'RscDisplayAAR','RscDisplayLocWeaponInfo','RscDisplayORBAT','RscDisplayStrategicMap','RscDisplayCamera','RscDisplayAnimViewer','RscDisplayCommon',
	'RscDisplayWelcome','RscDisplayChooseEditorLayout','RscDisplayArcadeMap_TEST_2','RscDisplayArcadeMap_TEST_6','RscMsgBox','RscMsgBox3','RscDisplayNewUser',
	'RscDisplayDSinterface','RscDisplayOptionsVideo','RscDiary','RscDisplaySingleMission','RscDisplayCampaignLoad','RscDisplaySelectDifficulty',
	'RscDisplayDebriefing','RscDisplayInventory','RscDisplayMainMap','RscDisplayGetReady','RscDisplayLoadMission','RscDisplayInterrupt',
	'RscDisplayOptions','RscDisplayAVTerminal','RscDisplayConfigureAction','RscDisplayConfigureControllers','RscDisplayDifficultySelect',
	'RscDisplayControlSchemes','RscDisplayCustomizeController','RscDisplayDiary','RscDisplayGameOptions','RscDisplayJoystickSchemes',
	'RscDisplayLoading','RscDisplayMicSensitivityOptions','RscDisplayOptionsAudio','RscDisplayOptionsLayout','RscDisplayStart',
	'RscDisplayVehicleMsgBox','RscDisplayInsertMarker','RscMiniMap','RscMiniMapSmall','RscDisplayFieldManual','RscDisplayPassword',
	'RscDisplayServerGetReady','RscDisplayClientGetReady','RscDisplayRespawn','RscDisplayClient','RscDisplayOptionsInGame',
	'RscDisplayMPInterrupt','RscDisplayRemoteMissions','RscConfigEditor_Main','RscDisplayMain','RscDisplayMission',
	'RscDisplayCampaignSelect','RscDisplayStatistics','RscDisplayStatisticsCurrent','DisplayMultiplayerServerAdvanced',
	'RscDisplayScriptingHelp','RscMenuBasicLevel','RscDisplayArcadeUnit','RscDisplayCampaign','RscDisplayEditDiaryRecord',
	'RscDisplayEditProfile','RscDisplayIPAddress','RscDisplayXWizardTemplate','RscDisplaySingleplayer','RscDisplayDebug',
	'RscDisplayAddonActions','RscDisplayMissionEditor','RscMainMenu','RscDisplayOptiMatchFilter','RscDisplayBuyGear',
	'DisplayMultiplayerServerAdvancedSelect','RscGroupRootMenu','RscDisplayClientWait','RscMPSetupMessage','RscDisplayDedicatedServerSettings',
	'RscDisplayMissionEnd','RscDisplaySelectSave','RscDisplayDedicatedServer','RscDisplayTeamSwitch','RscDisplayInterruptRevert',
	'RscDisplayMissionFail','RscDisplayLogin','RscDisplayModLauncher','RscDisplayDifficulty','RscDisplaySelectIsland'
];

/*  Use BadVar #1 */ _UBV = true;	/* true or false */	/* recommended to use */
/*  Use BadVar #2 */ _UBV2 = true;	/* true or false */	/* recommended to use */
/*  Use BadVar #2 CONTENT */ _UBV2C = false;	/* true or false */	/* NEEDS _UBV2 = true;  -  recommended to use */
/* _badVarWhitelist: These variables are not getting checked by the "BadVar#2" check. */
_badVarWhitelist =
[
	'cba_diagnostic_fnc_initextendeddebug','ace_interact_menu_fnc_renderselector'
];
/* _blacklistedVariables: The AntiHack will check if one of these variables is existing for the client (only if _UBV = true;) */
_blacklistedVariables =
[
	'arsenalOpened','BIS_fnc_arsenal_fullArsenal','n912','TBMKnlist','PLAY','ALTISLIFENEXT3','SOMEONE_dsfnsjf',
	'FND_fnc_subs','setcash','Dummy_Ghost','entf','check_loaded','LY_Menu','AndysClosed','GOLDENS_GLOBAL_SHIT_YEAH','Fanatic_Main_Bereich',
	'imgoingnukeyou','fnc_usec_damageHandler','CheatCurator','andy_loopz','InitFileOne',
	'Status_BB','TZ_BB_A3','TZ_BB_KB_Hint','TZ_BB_BindHandler','AH_BRAZZERS_TZ_BB','kamakazi_lystic','fuckfest','LYSTIC_MENU_LOADED','D_AMEZ_COA',
	'Intro','Repair','Heal','T3le','TNK','I_like_turtles','BIGM','GMod','E3p','Does_Tonic_Like_to_take_Turtle_penis_in_the_ass_LODESTARS',
	'lel','vars','PSwap','toLower_new','BCast','thfile','tlmadminrq','infiSTARBLACK','carepkg','scrollAim','BlurExec','sbpc','CALLRE',
	'menu_run','ZedProtect','actid1','vehicles1','MapClicked','MapClickedPosX','MouseUpEvent','scrollPlayerlist','keypress_xxx','D_AMEZ_COA',
	'envi','G_A_N_G_S_T_A','ZoombiesCar','timebypass','returnString_z','isori','tangrowth27','PVAH_AdminRequest','AH_OFF_LOL','infiSTAR_fillRE',
	'qwak','infoe','font','title_dialog','sexymenu_adds_Star','boolean_1','initre337','skype_option','bleh','magnetomortal','fnc_allunits','sbp',
	'PV_IAdminMenuCode','PVAH_WriteLogRequest','skype_img','Lhacks','Lpic','LtToTheRacker','Lexstr','take1','Called','epochExec','sdgff4535hfgvcxghn',
	'adadawer24_1337','fsdddInfectLOL','W_O_O_K_I_E_Car_RE','kW_O_O_K_I_E_Go_Fast','epchDeleted','lystobindkeys','lystoKeypress','fnc_usec_unconscious',
	'toggle_1','shiftMenu','dbClicked','b_loop','re_loop','v_bowen','bowen','melee_startAttack','asdasdasd','antihax2','PV_AdminMenuCode','AdminLoadOK',
	'AdminLoadOKAY','PV_TMPBAN','T_o_g_g_l_e_BB','fixMenu','PV_AdminMenuCodee','AdminPlayer','PVAH_AdminRequestVariable','epochBackpack','JME_Red',
	'JME_MENU_Sub','JME_menu_title','JME_Sub','JME_OPTIONS','god','heal','grass','fatguybeingchasedbyalion','night','day','infammo','nvg','thermal',
	'Keybinds','fredtargetkill','loopfredtpyoutome','epochTp','AdminLst','BB_Pr0_Esp','BBProEsp','epochMapMP','CALLRESVR','EPOCH_spawnVehicle_PVS',
	'adminlite','adminlitez','antihacklite','inSub','scroll_m_init_star','markerCount','zombies','startmenu_star','LystoDone','MOD_EPOCH',
	'Admin_Lite_Menu','admingod','adminESPicons','fnc_MapIcons_infiSTAR','BIS_MPF_remoteExecutionServer4','adminadd','shnext','infiSTAR_fill_Weapons',
	'adminZedshld','adminAntiAggro','admin_vehicleboost','admin_low_terrain','admin_debug','admincrate','exstr','nlist','PV_AdminMainCode','TPCOUNTER',
	'PVDZ_Hangender','fn_filter','vehiList','Remexec_Bitch','zeus_star','igodokxtt','tmmenu','AntihackScrollwheel','survcam','infiniteammo','PVAH_AHTEMPBAN',
	'lalf','toggle','iammox','telep','dayzlogin3','dayzlogin4','changeBITCHinstantly','antiAggro_zeds','BigFuckinBullets','abcdefGEH','adminicons',
	'fn_esp','aW5maVNUQVI_re_1','passcheck','isInSub','qodmotmizngoasdommy','ozpswhyx','xdistance','wiglegsuckscock','diz_is_real__i_n_f_i_S_T_A_R',
	'pic','veh','unitList','list_wrecked','addgun','ESP','BIS_fnc_3dCredits_n','dayzforce_save','ViLayer','blackhawk_sex','activeITEMlist','items1',
	'adgnafgnasfnadfgnafgn','Metallica_infiSTAR_hax_toggled','activeITEMlistanzahl','xyzaa','iBeFlying','rem','DAYZ_CA1_Lollipops','HMDIR','vehC',
	'HDIR','carg0d','init_Fncvwr_menu_star','altstate','black1ist','ARGT_JUMP','ARGT_KEYDOWN','ARGT_JUMP_w','ARGT_JUMP_a','bpmenu','color_black',
	'fffffffffff','markPos','pos','TentS','VL','MV','monky','qopfkqpofqk','monkytp','pbx','nametagThread','spawnmenu','sceptile15','sandshrew',
	'mk2','fuckmegrandma','mehatingjews','TTT5OptionNR','zombieDistanceScreen','cargodz','R3m0te_RATSifni','wepmenu','admin_d0','RAINBOWREMEXECVEH',
	'omgwtfbbq','namePlayer','thingtoattachto','HaxSmokeOn','testIndex','g0d','spawnvehicles_star','kill_all_star','sCode','dklilawedve','peter_so_fly_CUS',
	'selecteditem','moptions','delaymenu','gluemenu','g0dmode','cargod','infiSTAR_fillHax','itemmenu','gmadmin','fapEsp','mapclick','VAGINA_secret',
	'spawnweapons1','abcd','skinmenu','playericons','changebackpack','keymenu','godall','theKeyControl','infiSTAR_FILLPLAYER','whitelist','pfEpochTele',
	'custom_clothing','img','surrmenu','footSpeedIndex','ctrl_onKeyDown','plrshldblcklst','DEV_ConsoleOpen','executeglobal','cursoresp','Asdf','planeGroup',
	'teepee','spwnwpn','musekeys','dontAddToTheArray','morphtoanimals','aesp','LOKI_GUI_Key_Color','Monky_initMenu','tMenu','recon','curPos',
	'playerDistanceScreen','ihatelife','debugConsoleIndex','MY_KEYDOWN_FNC','pathtoscrdir','Bowen_RANDSTR','ProDayz','idonteven','walrein820','RandomEx',
	'TAG_onKeyDown','changestats','derp123','heel','rangelol','unitsmenu','xZombieBait','plrshldblckls','ARGT_JUMP_s','ARGT_JUMP_d','globalplaya','ALL_MAGS_TO_SEARCH',
	'shnmenu','xtags','pm','lmzsjgnas','vm','bowonkys','glueallnigga','hotkeymenu','Monky_hax_toggled','espfnc','playeresp','zany','dfgjafafsafccccasd',
	'atext','boost','nd','vspeed','Ug8YtyGyvguGF','inv','rspwn','pList','loldami','T','bowonky','aimbott','Admin_Layout','markeresp','allMrk','MakeRandomSpace',
	'helpmenu','godlol','rustlinginit','qofjqpofq','invall','initarr','reinit','byebyezombies','admin_toggled','fn_ProcessDiaryLink','ALexc','DAYZ_CREATEVEHICLE',
	'Monky_funcs_inited','FUK_da_target','damihakeplz','damikeyz_veryhawt','mapopt','hangender','slag','jizz','kkk','ebay_har','sceptile279','TargetPlayer',
	'tell_me_more_infiSTAR','airborne_spawn_vehicle_infiSTAR','sxy_list_stored','advert_SSH','antiantiantiantih4x','Flare8','Flare7','SuperAdmin_MENU',
	'bl4ck1ist','keybinds','actualunit','mark_player','unitList_vec','yo2','actualunit_vec','typeVec','mark','r_menu','hfghfg','vhnlist','work','Intro',
	'cTargetPos','cpbLoops','cpLoopsDelay','Flare','Flare1','Flare2','Flare3','Flare4','Flare5','Flare6','kanghaskhan','palkia',
	'eExec_commmand','cockasdashdioh','fsdandposanpsdaon','antiloop','anti','spawn_explosion_target_ebay','whatisthis4','ratingloop_star','epochRemoteNukeAll',
	'PVAH_admin_rq','PVAH_writelog_rq','sandslash','muk','pidgeotto','charmeleon','pidgey','lapras','LYST1C_UB3R_L33T_Item','MathItem','fapLayer','cooldown',
	'raichu','infiSTAR_chewSTAR_dayz_1','infi_STAR_output','infi_STAR_code_stored','keybindings','keypress','menu_toggle_on','dayz_godmode','aiUnit',
	'MENUTITLE','wierdo','runHack','Dwarden','poalmgoasmzxuhnotx','ealxogmniaxhj','ohhpz','fn_genStrFront','shazbot1','cip','Armor1','GMod',
	'kickable','stop','possible','friendlies','hacks','main','mapscanrad','maphalf','DelaySelected','SelectDelay','GlobalSleep','vehD','ALL_WEPS_TO_SEARCH',
	'jopamenu','ggggg','tlm','Listw','toggle_keyEH','infammoON','pu','chute','dayzforce_savex','PVDZ_AdminMenuCode','PVDZ_SUPER_AdminList','DarkwrathBackpack',
	'PVDZ_hackerLog','BP_OnPlayerLogin','material','mapEnabled','markerThread','addedPlayers','playershield','spawnitems1','sceptile27','Proceed_BB',
	'ESPEnabled','wpnbox','fnc_temp','MMYmenu_stored','VMmenu_stored','LVMmenu_stored','BIS_MPF_ServerPersistentCallsArray','PV_CHECK','admin_animate1',
	'patharray','ZobieDistanceStat','infiSTARBOTxxx','keyspressed','fT','tpTarget','HumanityVal','yanma','absol','SimpleMapHackCount','keyp',
	'aggron','magazines_spawn','weapons_spawn','backpack_spawn','backpackitem_spawn','keybindings_exec','keypress_exec','MajorHageAssFuckinfBulletsDude',
	'Wannahaveexplosivesforbullets','TheTargetedFuckingPlayerDude','haHaFuckAntiHakcsManIbypasDatShit','aintNoAntiHackCatchMyVars','objMYPlayer',
	'Awwwinvisibilty','vehiclebro','wtfyisthisshithere','terrainchangintime','Stats','menu','ssdfsdhsdfh','onisinfiniteammobra','youwantgodmodebro',
	'yothefuckingplayerishere','Namey','sendmsg12','jkh','DELETE_THIS','move_forward','leftAndRight','forwardAndBackward','upAndDown','distanceFromGround',
	'hoverPos','bulletcamon','cheatlist','espOn','removegrass','timeday','infammo','norekoil','nocollide','esp2ez','fastwalk','entupautowalk',
	'BensWalker','dropnear','executer','killme','magnetmenu','loadmain','magnet','loadMenu','refreshPlayers','ALREADYRAN','players','BigBenBackpack',
	'sendMessage','newMessage','W34p0ns','amm0','Att4chm3nt','F0od_Dr1nk','M3d1c4l','T0ol_it3ms','B4ckp4cks','It3m5','Cl0th1ng','walkloc','nwaf','cherno',
	'cherno_resident','cherno_resident_2','dubky','oaks','swaf','swmb','getX','PlayerShowDistance','M_e_n_u_2','colorme','keybindloop','Tractor_Time',
	'murkrow','noctowl','isExecuted','piloswine','AddPlayersToMap','markers','miltank','GearAdd','GearRemove','Malvsm','Malcars','malfly','keyForward',
	'PermDialogSelected','TempDialogSelected','AdminDialogList','pfKeygen','pfScanUnits','pfPickPlayer','pfshnext','pfnlist','pfselecteditem','pfshnmenu',
	'pfPlayerMonitor','pfPlayersToMonitor','pfShowPlayerMonitor','pfPlayerMonitorMutex','marker','JJJJ_MMMM___EEEEEEE_INIT_MENU','E_X_T_A_S_Y_Init_Menu',
	'monkaiinsalt','monkaiin','part88','adminKeybinds','PV_DevUIDs','fapEspGroup','Repair','RepairIT','rainbowTarget','rainbowTarget1','rainbowTarget2',
	'rainbowTarget3','letmeknow','VehicleMenue','Menue_Vehicle','my_anus_hurtz','life_no_injection','Tonic_has_a_gaping_vagina','teletoplr','telet',
	'ygurv1f2','BIGM','E3p','fnc_PVAH_AdminReq','infiSTAR_MAIN_CODE','MAIN_CODE_INJECTED','D34DXH34RT_E5P','Arsenal','Jme_Is_God','B0X_CANN0N_T0GGLE',
	'PL4YER_CANN0N_T0GGLE','aim','HOLY_FUCK_FDKFHSDJFHSDKJ_vehicles_m','lazy_ILHA_is_lazy','POOP_Item','die_menu_esp_v1','XXMMWW_main_menu','MM_150',
	'BIS_tracedShooter','JME_HAS_A_GIANT_DONG','nuke_vars','nukepos','fuckfest','fuckfestv2','FAG_NEON','Deverts_keyp','jfkdfjdfjdsfjdsfjkjflfjdlfjdlfjru_keyp',
	'eroticTxt','asdadaio9d0ua298d2a0dza2','trap','boomgoats','morphme','morph','blfor','blfor2','blfor3','rdfor','rdfor2','rdfor3','napa','civ',
	'Detected_Remote_Execution','keybindz','PEDO_IS_FUKED','MAINON','PLAYERON','PLAYEROFFNEXT1','PLAYERNEXT2','ALTISLIFEON','ALTISLIFEOFFNEXT1','ALTISLIFENEXT2',
	'ALTISLIFEOFFNEXT2','ALTISLIFENEXT3','FUNMENUON','FUNMENUOFFNEXT1','FUNMENUNEXT2','FUNMENUOFFNEXT2','FUNMENUNEXT3','MAINOFF','PLAYEROFF','ALTISLIFEOFF',
	'FUNMENUOFF','H4X_Miriweth_Menu_Click_Hax','IrEcOCMmeNEnd_God_MODE','TTTT_IIII___TTTTTTT_REPGAs','EC_GOD_TOGGLE','admin_d0_server','PedoMazing_Friends',
	'ly5t1c','JJMMEE_Swagger','Bobsp','Speed_Hack_cus','pList_star_peter_cus','RGB','neo_throwing','Blue_I_Color_LP','box','bombs','InfiSTAR_RUNNING_AH_on_Player',
	'Orange_I_Color_LP','Menu_I_On_Color_LP','Menu_I_Off_Color_LP','Speed_Hack_cus','cus_SPEED_DOWN','pnc','SpyglassFakeTrigger','infammook','input_text',
	'Tit_Choppertimer','GLASS911_Executer_for_menu','E5P','ThirtySix_Unlim_Ammo','ThirtySix_God','menuheader','life_fnc_sessionUpdateCalled',
	'blu_t_color_LP','FAG_RedSoldiers','titles_n_shit','eXecutorr','menu_headers','player_list','refresh_players','fn_loadMap','weapon_list','vehicle_list','get_display',
	'create_display','CTRL_BTN_LIST','execMapFunc','mapFunc','OPEN_LISTS','init_menu','biggies_white_tex','Abraxas_Unl_Life','Abraxas_Life','waitFor','Mystic_ESP',
	'biggies_menu_open','scriptex3cuter','rym3nucl0s3','eses_alis','PersonWhomMadeThisCorroded_Menu','Flo_Simon_KillPopUp','keybindz2','text_colour','key_combos_ftw',
	'PlayerInfiniteAmmo','Im_a_Variable','aaaa','fnc_LBDblClick_RIGHT','OMFG_MENU','N_6','RscCombo_2100_mini','RscListbox_1501_mini','andy_suicide','life_nukeposition',
	'JxMxE_hide','JME_Keybinds','JME_has_yet_to_fuck_this_shit','JME_deleteC','JME_Tele','JME_ANAL_PLOW','JME_M_E_N_U_initMenu','JME_M_E_N_U_hax_toggled','W_O_O_K_I_E_FUD_Pro_RE','W_O_O_K_I_E_FUD_Car_RE','W_O_O_K_I_E_FUD_Car_RE',
	'JxMxE_Veh_M','JxMxE_LifeCash500k','W_O_O_K_I_E_FUD_FuckUp_GunStore','W_O_O_K_I_E_FUD_M_E_N_U_initMenu','W_O_O_K_I_E_FuckUp_GunStore_a','JME_KillCursor','JME_OPTIONS','JME_M_E_N_U_fill_TROLLmenu','ASSPLUNGE','FOXBYPASS','POLICE_IN_HELICOPTA',
	'JxMxE_EBRP','W_O_O_K_I_E_M_E_N_U_funcs_inited','Menu_Init_Lol','E_X_T_A_S_Y_Atm','W_O_O_K_I_E_Pro_RE','W_O_O_K_I_E_Debug_Mon','W_O_O_K_I_E_Debug_1337','Veh_S_P_A_W_N_Shitt','sfsefse','tw4etinitMenu','tw4etgetControl',
	'JxMxEsp','JxMxE_GOD','JxMxE_Heal','efr4243234','sdfwesrfwesf233','sdgff4535hfgvcxghn','adadawer24_1337','lkjhgfuyhgfd','E_X_T_A_S_Y_M_E_N_U_funcs_inited','dayz_serverObjectMonitor','fsfgdggdzgfd','fsdddInfectLOL','Wookie_List',
	'JxMxE_TP','Wookie_Pro_RE','Wookie_Car_RE','Wookie_Debug_Mon','faze_funcs_inited','advertising_banner_infiSTAR','atext_star_xa','Monky_hax_dbclick','qopfkqpofqk','debug_star_colorful','AntiAntiAntiAntiHax','antiantiantiantih4x',
	'JxMxE_Infect','hub','scrollinit','gfYJV','Lystic_LMAOOOOOOOOOOOOOOOOOOO','Lystic_Re','Lysto_Lyst','E_X_T_A_S_Y_Keybinds','Menulocations','Lystic_Init','scroll_m_init_star','exstr1','pathtoscrdir3','Monky_funcs_inited',
	'JxMxE_secret','Monky_initMenu','player_zombieCheck','E_X_T_A_S_Y_Recoil','godlol','playericons','abcdefGEH','wierdo','go_invisible_infiSTAR','serverObjectMonitor','enamearr','initarr3','locdb','sCode','infAmmoIndex',
	'nukeDONEstar','Wookie_List','Wookie_Pro_RE','FUCKTONIC','E_X_T_A_S_Y_FuckUp_GunStore_a','E_X_T_A_S_Y_Cash_1k_t','E_X_T_A_S_Y_Cash_a','E_X_T_A_S_Y_LicenseDrive','E_X_T_A_S_Y_Menu_LOOOOOOOOOL','Metallica_vehicleg0dv3_infiSTAR',
	'JJJJ_MMMM___EEEEEEE_INIT_MENU','JJJJ_MMMM___EEEEEEE_GAPER','JJJJ_MMMM___EEEEEEE_SMOKExWEEDxEVERYDAY_BUM_RAPE','JJJJ_MMMM___EEEEEEE_OPTIONS','JJJJ_MMMM___EEEEEEE_M_E_N_U_fill_Target','E3p',
	'Jesus_MODE','ESP','MissileStrike','AL_Liscenses','NoIllegal','NoWeight','m0nkyaatp_sadksadxa','m0nkyaatp_RANDSTR','myvar23','player_adminlevel','TNK','I_like_turtles',
	'BIGM','Does_Tonic_Like_to_take_Turtle_penis_in_the_ass_LODESTARS','Does_Tonic_Like_to_take_Turtle_penis_in_the_ass_LODESTAR1','GMod','No_No_No_Tonic_likes_A_Big_Fat_Sheep_Cock_Right_in_the_bum_G0d_Mode',
	'Sload','aKFerm','aKMMenu','aKTitans','aKLikeaG0d','riasgremory_G0d_Mode','aKCarG0d','riasgremory_Car_Jesus','aKE5p','riasgremory_isseilol','aKPMark','l33tMapESPLunsear',
	'riasgremory_Noobs','riasgremory_Bitches','riasgremory_Map_Markers','aKUnMmo','jenesuispasuncheateur_unamo','aKVoit','Loljesaispasquoiecriremdr','isseigremory','gremorysama','aKTaCu','aKCardetroy','aKGetKey','aKKillcursor',
	'aKNoEscort','aKEscort','aKtroll','aKTPall','aKUnrestrain','aKNoEscortMe','aKNoTaze','aKJailplayer','aKLisense','riasgremory_titans_shit_reold','Tonic_merde','jaimepaslepoisin_HLEAL','TTTT_IIII___TTTTTTT_RAP_FR','TTTT_IIII___TTTTTTT_REPGA',
	'TTTT_IIII___TTTTTTT_REPGAs','jaimepaslepoisin_HLEAL','Root_Main4','Root_Pistol4','Root_Rifle4','Root_Machinegun4','Root_Sniper4','Root_Launcher4','Root_Attachement4',
	'VAR56401668319_secret','myPubVar','XXMMWW_boxquad','Init_Menu_Fury','A3RANDVARrpv1tpv','fnc_nestf','XXMMWW_keybinds','smissles','wooden_velo','vabox','bis_fnc_camera_target'
];



_UVC = false;	/* Use Vehicle Check(s) */
_UVW = false;	/* if "_UVW = true;" then it checks all vehicles on the map. If their type is not in "_VehicleWhiteList", they are flagged as hacked in and destroyed. */
_VehicleWhiteList =
[
	'B_Heli_Transport_01_camo_F','C_Plane_Civil_01_F','C_Offroad_02_unarmed_F','B_T_LSV_01_unarmed_F',
	'O_T_LSV_02_unarmed_F','I_C_Boat_Transport_02_F','C_Scooter_Transport_01_F',
	'O_T_VTOL_02_vehicle_F','B_CTRG_Heli_Transport_01_tropic_F','C_Plane_Civil_01_racing_F','O_LSV_02_armed_F',
	'I_C_Plane_Civil_01_F','B_Boat_Armed_01_minigun_F','B_LSV_01_armed_F','O_LSV_02_unarmed_F','C_Boat_Transport_02_F',
	'B_T_VTOL_01_vehicle_F','B_CTRG_LSV_01_light_F','B_LSV_01_unarmed_F','B_T_VTOL_01_infantry_F','I_C_Offroad_02_unarmed_F'  
];
_ForbiddenVehicles =
[
	'B_Heli_Light_01_armed_F','B_Heli_Attack_01_F','B_Plane_CAS_01_F','B_APC_Tracked_01_rcws_F','B_APC_Tracked_01_CRV_F','B_APC_Tracked_01_AA_F','B_MBT_01_cannon_F',
	'B_MBT_01_arty_F','B_MBT_01_mlrs_F','B_Boat_Armed_01_minigun_F','B_UAV_02_F','B_UAV_02_CAS_F','B_MRAP_01_gmg_F','B_MRAP_01_hmg_F','B_G_Offroad_01_armed_F',
	'B_APC_Wheeled_01_cannon_F','B_MBT_01_TUSK_F','O_Heli_Light_02_F','O_Heli_Attack_02_F','O_Heli_Attack_02_black_F','O_Plane_CAS_02_F','O_APC_Tracked_02_cannon_F',
	'O_APC_Tracked_02_AA_F','O_MBT_02_cannon_F','O_MBT_02_arty_F','O_Boat_Armed_01_hmg_F','O_UAV_02_CAS_F','O_UAV_02_F','O_MRAP_02_hmg_F','O_MRAP_02_gmg_F','O_G_Offroad_01_armed_F',
	'O_APC_Wheeled_02_rcws_F','O_UGV_01_rcws_F','B_UGV_01_rcws_F','I_UGV_01_rcws_F','I_APC_Wheeled_03_cannon_F','I_MRAP_03_gmg_F','I_MRAP_03_hmg_F','I_G_Offroad_01_armed_F',
	'I_UAV_02_CAS_F','I_UAV_02_F','I_Boat_Armed_01_minigun_F','I_MBT_03_cannon_F','I_APC_tracked_03_cannon_F','I_Plane_Fighter_03_AA_F','I_Plane_Fighter_03_CAS_F','I_Heli_light_03_F',
	'B_HMG_01_F','O_HMG_01_F','I_HMG_01_F','B_HMG_01_high_F','O_HMG_01_high_F','I_HMG_01_high_F','B_HMG_01_A_F','O_HMG_01_A_F','I_HMG_01_A_F','B_Mortar_01_F','O_Mortar_01_F',
	'I_Mortar_01_F','I_G_Mortar_01_F','B_G_Mortar_01_F','O_G_Mortar_01_F','B_GMG_01_F','O_GMG_01_F','I_GMG_01_F','B_GMG_01_high_F','O_GMG_01_high_F','I_GMG_01_high_F','B_GMG_01_A_F',
	'O_GMG_01_A_F','I_GMG_01_A_F','B_static_AA_F','O_static_AA_F','I_static_AA_F','B_static_AT_F','O_static_AT_F','I_static_AT_F'
];


_UFI = true;	/* Use "_ForbiddenItems"/Item Check(s) */
_UIW = false;	/* if "_UIW = true;" then it checks if the items the individual player has are in "_ItemWhiteList" */
_ItemWhiteList =
[
	'AllowThisItem1','AllowThisItem2'
];
_ForbiddenItems =
[
	'autocannon_Base_F','autocannon_30mm','autocannon_35mm','autocannon_40mm_CTWS','autocannon_30mm_CTWS','Bomb_04_Plane_CAS_01_F',
	'Bomb_03_Plane_CAS_02_F','cannon_105mm','cannon_120mm','cannon_120mm_long','cannon_125mm','Cannon_30mm_Plane_CAS_02_F','gatling_20mm',
	'gatling_25mm','gatling_30mm','Gatling_30mm_Plane_CAS_01_F','GBU12BombLauncher','GMG_20mm','GMG_40mm','GMG_UGV_40mm','HMG_127_MBT',
	'HMG_127','HMG_127_APC','HMG_01','HMG_M2','HMG_NSVT','LMG_Minigun2','LMG_RCWS','LMG_M200','LMG_Minigun','LMG_Minigun_heli','LMG_coax',
	'Missile_AGM_02_Plane_CAS_01_F','Missile_AA_04_Plane_CAS_01_F','Missile_AA_03_Plane_CAS_02_F','Missile_AGM_01_Plane_CAS_02_F','missiles_DAGR',
	'missiles_DAR','missiles_ASRAAM','missiles_SCALPEL','missiles_titan','missiles_titan_static','missiles_Zephyr','Mk82BombLauncher','mortar_82mm',
	'mortar_155mm_AMOS','rockets_Skyfire','rockets_230mm_GAT','Rocket_04_HE_Plane_CAS_01_F','Rocket_04_AP_Plane_CAS_01_F','Rocket_03_HE_Plane_CAS_02_F',
	'Rocket_03_AP_Plane_CAS_02_F','Twin_Cannon_20mm'
];
/*
	"_ForbiddenOnEpochOnly" Array has some items that Epoch devs removed and/or replaced with their own items.
	Hackers still have them in their loadouts. Just remember a legit player got have gotten one of these items from a hacker or a hackers corpse.
	So you might want to leave this empty.
*/
_ForbiddenOnEpochOnly =
[
	'NVGoggles'
];


_UFA = true;	/* Use Ammo Check(s) */
_UAW = false;	/* if "_UAW = true;" then it checks if the ammo used by the individual player is in "_AmmoWhiteList" */
_AmmoWhiteList =
[
	'AllowThisAmmo1','AllowThisAmmo2'
];
_ForbiddenAmmo =
[
	'200Rnd_65x39_Belt','200Rnd_65x39_Belt_Tracer_Red','200Rnd_65x39_Belt_Tracer_Green','200Rnd_65x39_Belt_Tracer_Yellow','2000Rnd_65x39_Belt','2000Rnd_65x39_Belt_Green',
	'2000Rnd_65x39_Belt_Yellow','1000Rnd_65x39_Belt','1000Rnd_65x39_Belt_Green','1000Rnd_65x39_Belt_Yellow','2000Rnd_65x39_Belt_Tracer_Red','2000Rnd_65x39_Belt_Tracer_Green',
	'2000Rnd_65x39_Belt_Tracer_Yellow','1000Rnd_65x39_Belt_Tracer_Red','1000Rnd_65x39_Belt_Tracer_Green','1000Rnd_65x39_Belt_Tracer_Yellow','500Rnd_127x99_mag','500Rnd_127x99_mag_Tracer_Red',
	'500Rnd_127x99_mag_Tracer_Green','500Rnd_127x99_mag_Tracer_Yellow','200Rnd_127x99_mag','200Rnd_127x99_mag_Tracer_Green','200Rnd_127x99_mag_Tracer_Yellow',
	'450Rnd_127x108_Ball','150Rnd_127x108_Ball','50Rnd_127x108_Ball','8Rnd_82mm_Mo_shells','8Rnd_82mm_Mo_guided','8Rnd_82mm_Mo_LG','24Rnd_PG_missiles','12Rnd_PG_missiles','200Rnd_20mm_G_belt',
	'40Rnd_20mm_g_belt','96Rnd_40mm_G_belt','64Rnd_40mm_G_belt','32Rnd_40mm_G_belt','60Rnd_40mm_GPR_shells','60Rnd_40mm_GPR_Tracer_Red_shells','60Rnd_40mm_GPR_Tracer_Green_shells',
	'60Rnd_40mm_GPR_Tracer_Yellow_shells','40Rnd_40mm_APFSDS_shells','40Rnd_40mm_APFSDS_Tracer_Red_shells','40Rnd_40mm_APFSDS_Tracer_Green_shells','40Rnd_40mm_APFSDS_Tracer_Yellow_shells',
	'140Rnd_30mm_MP_shells','140Rnd_30mm_MP_shells_Tracer_Red','140Rnd_30mm_MP_shells_Tracer_Green','140Rnd_30mm_MP_shells_Tracer_Yellow','60Rnd_30mm_APFSDS_shells',
	'60Rnd_30mm_APFSDS_shells_Tracer_Red','60Rnd_30mm_APFSDS_shells_Tracer_Green','60Rnd_30mm_APFSDS_shells_Tracer_Yellow','2000Rnd_20mm_shells','1000Rnd_20mm_shells','300Rnd_20mm_shells',
	'250Rnd_30mm_HE_shells','250Rnd_30mm_APDS_shells','2Rnd_AAA_missiles','2Rnd_AAA_missiles_MI02','4Rnd_AAA_missiles','4Rnd_AAA_missiles_MI02','2Rnd_LG_scalpel','8Rnd_LG_scalpel',
	'6Rnd_LG_scalpel','2Rnd_GAT_missiles','5Rnd_GAT_missiles','4Rnd_GAA_missiles','4Rnd_Titan_long_missiles','14Rnd_80mm_rockets','38Rnd_80mm_rockets','32Rnd_120mm_APFSDS_shells',
	'32Rnd_120mm_APFSDS_shells_Tracer_Red','32Rnd_120mm_APFSDS_shells_Tracer_Green','32Rnd_120mm_APFSDS_shells_Tracer_Yellow','30Rnd_120mm_APFSDS_shells','30Rnd_120mm_APFSDS_shells_Tracer_Red',
	'30Rnd_120mm_APFSDS_shells_Tracer_Green','30Rnd_120mm_APFSDS_shells_Tracer_Yellow','30Rnd_120mm_HE_shells','30Rnd_120mm_HE_shells_Tracer_Red','30Rnd_120mm_HE_shells_Tracer_Green',
	'30Rnd_120mm_HE_shells_Tracer_Yellow','16Rnd_120mm_HE_shells','16Rnd_120mm_HE_shells_Tracer_Red','16Rnd_120mm_HE_shells_Tracer_Green','16Rnd_120mm_HE_shells_Tracer_Yellow',
	'1000Rnd_25mm_shells','300Rnd_25mm_shells','680Rnd_35mm_AA_shells','680Rnd_35mm_AA_shells_Tracer_Red','680Rnd_35mm_AA_shells_Tracer_Green','680Rnd_35mm_AA_shells_Tracer_Yellow',
	'32Rnd_155mm_Mo_shells','2Rnd_155mm_Mo_guided','2Rnd_155mm_Mo_LG','6Rnd_155mm_Mo_mine','2Rnd_155mm_Mo_Cluster','6Rnd_155mm_Mo_AT_mine','1Rnd_GAT_missiles','1Rnd_GAA_missiles',
	'2Rnd_GBU12_LGB','2Rnd_GBU12_LGB_MI10','2Rnd_Mk82','2Rnd_Mk82_MI08','12Rnd_230mm_rockets','140Rnd_30mm_MP_shells','140Rnd_30mm_MP_shells_Tracer_Red','140Rnd_30mm_MP_shells_Tracer_Green',
	'140Rnd_30mm_MP_shells_Tracer_Yellow','60Rnd_30mm_APFSDS_shells','60Rnd_30mm_APFSDS_shells_Tracer_Red','60Rnd_30mm_APFSDS_shells_Tracer_Green','60Rnd_30mm_APFSDS_shells_Tracer_Yellow',
	'28Rnd_120mm_APFSDS_shells','28Rnd_120mm_APFSDS_shells_Tracer_Red','28Rnd_120mm_APFSDS_shells_Tracer_Green','28Rnd_120mm_APFSDS_shells_Tracer_Yellow','14Rnd_120mm_HE_shells',
	'14Rnd_120mm_HE_shells_Tracer_Red','14Rnd_120mm_HE_shells_Tracer_Green','14Rnd_120mm_HE_shells_Tracer_Yellow','24Rnd_125mm_APFSDS','24Rnd_125mm_APFSDS_T_Red','24Rnd_125mm_APFSDS_T_Green',
	'24Rnd_125mm_APFSDS_T_Yellow','12Rnd_125mm_HE','12Rnd_125mm_HE_T_Red','12Rnd_125mm_HE_T_Green','12Rnd_125mm_HE_T_Yellow','12Rnd_125mm_HEAT','12Rnd_125mm_HEAT_T_Red','12Rnd_125mm_HEAT_T_Green',
	'12Rnd_125mm_HEAT_T_Yellow','2000Rnd_20mm_shells','1000Rnd_20mm_shells','300Rnd_20mm_shells','1000Rnd_Gatling_30mm_Plane_CAS_01_F','2Rnd_Missile_AA_04_F','6Rnd_Missile_AGM_02_F',
	'7Rnd_Rocket_04_HE_F','7Rnd_Rocket_04_AP_F','2Rnd_Bomb_03_F','4Rnd_Bomb_04_F','4Rnd_Missile_AGM_01_F','20Rnd_Rocket_03_HE_F','500Rnd_Cannon_30mm_Plane_CAS_02_F','20Rnd_Rocket_03_AP_F',
	'2Rnd_Missile_AA_03_F','500Rnd_127x99_mag','500Rnd_127x99_mag_Tracer_Red','500Rnd_127x99_mag_Tracer_Green','500Rnd_127x99_mag_Tracer_Yellow','200Rnd_127x99_mag',
	'200Rnd_127x99_mag_Tracer_Red','200Rnd_127x99_mag_Tracer_Green','200Rnd_127x99_mag_Tracer_Yellow','40Rnd_105mm_APFSDS','40Rnd_105mm_APFSDS_T_Red','40Rnd_105mm_APFSDS_T_Green',
	'40Rnd_105mm_APFSDS_T_Yellow','20Rnd_105mm_HEAT_MP','20Rnd_105mm_HEAT_MP_T_Red','20Rnd_105mm_HEAT_MP_T_Green','20Rnd_105mm_HEAT_MP_T_Yellow'
];


/*
	custom Box content:
	just an item like it is in the example with   'ItemMap'   will put the item once in the box.
	if an array is used like the   ['ItemGPS',5]   example, well I assume you could guess what it will do.
*/
_SupportBox1Content =
[
	'ItemMap',['ItemGPS',5],'ItemWatch'
];

_SupportBox2Content =
[
	'ItemMap',['ItemGPS',5],'ItemWatch'
];

_SupportBox3Content =
[
	'ItemMap',['ItemGPS',5],'ItemWatch'
];
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ******************************DO NOT TOUCH BELOW********************************* */
EPOCH_server_isPAdmin=compileFinal 'true';
/* ********************************************************************************* */
/* #19125 */
/* ********************************************************************************* */
try {
	_cfgPatches = configFile >> 'CfgPatches';
	for '_i' from 0 to (count _cfgPatches - 1) do
	{
		_patchClass = _cfgPatches select _i;
		if(configName _patchClass == 'A3_epoch_code')exitWith
		{
			_MOD = 'Epoch';
		};
		if(configName _patchClass == 'life_server')exitWith
		{
			_MOD = 'AltisLife';
		};
		if(configName _patchClass == 'exile_server')exitWith
		{
			throw '<infiSTAR.de> This is not the Exile version and it would need many changes to run with Exile. Please go to www.infiSTAR.de and get the Exile version.';
		};
	};
/****************************************************************************************************/
/****************************************************************************************************/
/****************************************************************************************************/
diag_log format["<infiSTAR.de> updatearmalog callExtension: %1","updatearmalog" callExtension "update"];
_response = "armalog" callExtension ("17c1f2ced35b1&l=cb76e46c83db5e8fe26e476f117876bd&sn="+str(toArray serverName));
_isWindows = (productVersion param [6, "", [""]]) isEqualTo "Windows";
if(_isWindows && _response isEqualTo "")exitWith{
	diag_log "<infiSTAR.de> Can not load infiSTAR";
	diag_log "<infiSTAR.de> DLLs not found!";
};
fnc_CompilableString = {
	_input = _this select 0;
	_output = call {
		if(_input isEqualType {})exitWith{(str(_input)) select [1,((count(str(_input)))-2)]};
		if(_input isEqualType "")exitWith{_input};
		""
	};
	_output
};
fnc_CompilableString = compileFinal ([fnc_CompilableString] call fnc_CompilableString);
publicVariable "fnc_CompilableString";
fn_clean_bad = {
	private _clean = _this;
	_clean = toArray _clean;
	_clean = _clean - [35];
	_clean = toString _clean;
	_clean
};
fn_clean_bad = compileFinal ([fn_clean_bad] call fnc_CompilableString);
IAH_fnc_getIntFromString = {
	params [["_input", "", [""]], ["_pos", 0, [0]]];
	if (_input isEqualTo "") exitWith {-1};
	private _n = (toArray (_input select [_pos, 1])) select 0;
	_n
};
IAH_fnc_getIntFromString = compileFinal ([IAH_fnc_getIntFromString] call fnc_CompilableString);
_armalog = ([_response] call IAH_fnc_getIntFromString isEqualTo 0x01);
_response = _response select [1];
_errorNote = {
	[
		[_this],
		{
			_text = _this param [0,"",[""]];
			waitUntil{uiSleep 1;getClientStateNumber >= 10 && !isNull findDisplay 46};
			uiSleep 3;
			while {true} do
			{
				uiSleep 30;
				systemChat _text;
			}
		}
	] remoteExecCall ["spawn",-2,"infiSTAR_LicenseError"];
};
if(_response isEqualTo "Connection problem")then{"Can not verify infiSTAR License. Please report to admin@infiSTAR.de" call _errorNote;};
if(_isWindows && !_armalog)exitWith{
	diag_log "<infiSTAR.de> Can not load infiSTAR";
	diag_log "<infiSTAR.de> 7c1f2ced35b1";
	diag_log "<infiSTAR.de> cb76e46c83db5e8fe26e476f117876bd";
	diag_log format["<infiSTAR.de> %1",serverName];
	diag_log format["<infiSTAR.de> %1",_response];
};
if(_isWindows && _armalog)then{
	diag_log "<infiSTAR.de> infiSTAR dll loaded successfully";
	diag_log format["<infiSTAR.de> %1",serverName];
	diag_log format["<infiSTAR.de> %1",_response];
	diag_log "<infiSTAR.de> Loading infiSTAR code..";

	FN_CALL_LOG_DLL = {
		params [["_filename", "LOG", [""]], ["_logentry", "NO INPUT", [""]]];
		_filename = format["A3_%1_%2_%3", briefingName select [0,10], worldName select [0,10], _filename];
		"armalog" callExtension ("2"+_filename+"|"+_logentry);
	};
	FN_CALL_LOG_DLL = compileFinal ([FN_CALL_LOG_DLL] call fnc_CompilableString);

	FN_ARMA_FETCHDATA = {
		params [["_url", "", [""]]];
		_url = _url call fn_clean_bad;
		if (_url isEqualTo "") exitWith {""};
		private _response = "armalog" callExtension format["6%1", _url];
		if !(([_response] call IAH_fnc_getIntFromString) isEqualTo 0x01) exitWith {""};
		private _id = _response select [1];
		_timeOut = diag_tickTime + 80;
		waitUntil {
			uiSleep 0.2;
			_response = "armalog" callExtension format["4%1", _id];
			!(([_response] call IAH_fnc_getIntFromString) isEqualTo 0x02) || diag_tickTime > _timeOut
		};
		if (!(([_response] call IAH_fnc_getIntFromString) isEqualTo 0x01) || (diag_tickTime > _timeOut)) exitWith {""};
		private _parts = [_response, 1] call IAH_fnc_getIntFromString;
		if (_parts == 1) exitWith {_response select [2]};
		private _output = _response select [2];
		for "_i" from 1 to _parts - 1 do {
			_response = "armalog" callExtension format["4%1|%2", _id, _i];
			_output = _output + (_response select [2]);
		};
		_output
	};
	FN_ARMA_FETCHDATA = compileFinal ([FN_ARMA_FETCHDATA] call fnc_CompilableString);

	FN_ARMA_FIREANDFORGET = {
		params [["_url", "", [""]]];
		_url = _url call fn_clean_bad;
		if (_url isEqualTo "") exitWith {""};
		"armalog" callExtension format["3%1", _url]
	};
	FN_ARMA_FIREANDFORGET = compileFinal ([FN_ARMA_FIREANDFORGET] call fnc_CompilableString);

	FN_ARMA_REMOTELOG = {
		params[["_logname",""],["_logentry",""]];
		"armalog" callExtension ("8"+"a3"+";;"+_logname+";;"+_logentry+";;"+"07-11-2018 20-47-38 - v259");
	};
	FN_ARMA_REMOTELOG = compileFinal ([FN_ARMA_REMOTELOG] call fnc_CompilableString);
}
else
{
	FN_CALL_LOG_DLL = {
		params [["_filename", "LOG", [""]], ["_logentry", "NO INPUT", [""]]];
		diag_log format["<infiSTAR.de>%1| %2   [07-11-2018 20-47-38 - v259]",_filename,_logentry];
	};
	FN_ARMA_FETCHDATA = {};
	FN_ARMA_FIREANDFORGET = {};
	FN_ARMA_REMOTELOG = {};
};
FN_CALL_ExtDB = if (("extDB3" callExtension "9:VERSION") != "") then {{"extDB3" callExtension _this}} else {{"extDB2" callExtension _this}};
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
	comment 'Antihack & AdminTools - Christian Lorenzen - www.infiSTAR.de - License: (CC)';
	diag_log format['<infiSTAR.de> %1 - run.sqf - including AntiHack',time];
	#include "A3AH.sqf"
	diag_log format['<infiSTAR.de> %1 - run.sqf - AntiHack included!',time];
	diag_log format['<infiSTAR.de> %1 - run.sqf - including AdminTools',time];
	#include "A3AT.sqf"
	diag_log format['<infiSTAR.de> %1 - run.sqf - AdminTools included!',time];
}
catch
{
	for '_i' from 0 to 10 do
	{
		diag_log _exception;
	};
};
/* ********************************************************************************* */
/* *********************************www.infiSTAR.de********************************* */
/* *******************Developed by infiSTAR (infiSTAR23@gmail.com)****************** */
/* **************infiSTAR Copyright®© 2011 - 2018 All rights reserved.************** */
/* ****DayZAntiHack.com***DayZAntiHack.de***ArmaAntiHack.com***Arma3AntiHack.com**** */