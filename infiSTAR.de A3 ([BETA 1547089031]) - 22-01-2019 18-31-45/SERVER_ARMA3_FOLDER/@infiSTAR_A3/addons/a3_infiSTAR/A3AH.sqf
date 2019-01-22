/*
	File: A3AH.sqf
	Author: Chris(tian) "infiSTAR" Lorenzen
	Contact: infiSTAR23@gmail.com

	Description:
	Arma AntiHack & AdminTools - infiSTAR.de
*/
/* *******************Developer : infiSTAR (infiSTAR23@gmail.com)******************* */
/* ***************infiSTAR Copyright 2011 - 2019 All rights reserved.*************** */
/* *********************************www.infiSTAR.de********************************* */
diag_log '<infiSTAR.de> VERSION: infiSTAR.de 22-01-2019 18-31-45 ([BETA 1547089031])';
comment 'Antihack & AdminTools - Christian Lorenzen - www.infiSTAR.de - License: (CC)';
UPDATEEMAIL='danny13653@gmail.com';
INFISTARVERSION='22-01-2019 18-31-45 - [BETA 1547089031]';
diag_log format['<infiSTAR.de> %1 - STARTING',time];
diag_log format['<infiSTAR.de> %1 - TESTING IF serverCommandPassword IS SET PROPERLY',time];
_return = _serverCommandPassword serverCommand '#exec users';
if(!_return)exitWith
{
	diag_log format['<infiSTAR.de> %1 - serverCommandPassword NOT SET!    danny13653@gmail.com - 22-01-2019 18-31-45 - [BETA 1547089031] - %2 - %3',time,serverName,productVersion];
	diag_log format['<infiSTAR.de> %1 - serverCommandPassword   in infiSTAR_config.sqf is [%2]',time,_serverCommandPassword];
	diag_log format['<infiSTAR.de> %1 - serverCommandPassword   is defined in your servers config.cfg',time];
	diag_log format['<infiSTAR.de> %1 - serverCommandPassword   if your config.cfg does not have serverCommandPassword yet, simply add it in a new line: serverCommandPassword = "changeme";',time];
	diag_log format['<infiSTAR.de> %1 - serverCommandPassword   has to be set it in infiSTAR_config.sqf where it says _serverCommandPassword = "changeme";',time];
	diag_log format['<infiSTAR.de> %1 - serverCommandPassword   FILE: [%2]',time,__FILE__];
	diag_log format['<infiSTAR.de> %1 - serverCommandPassword   LINE: [%2]',time,__LINE__];
	diag_log format['<infiSTAR.de> %1 - infiSTAR will not START if passwords are not set properly!',time];
};
_s_m = missionNameSpace getVariable ['UPDATEEMAIL',''];_s_v = missionNameSpace getVariable ['INFISTARVERSION',''];_s_s = toArray servername;
FN_GET_SERVERPW = compileFinal (str _serverCommandPassword);
fn_serverCommand = compileFinal "(call FN_GET_SERVERPW) serverCommand _this";
diag_log format['<infiSTAR.de> %1 - serverCommandPassword IS FINE',time];
_test = [0,{}] execFSM 'call.fsm';
_test = [0,{}] execFSM 'call.fsm';
if(_test isEqualTo 0)exitWith
{
	_log = format['<infiSTAR.de> %1 - call.fsm missing in your MPmission!    danny13653@gmail.com - 22-01-2019 18-31-45 - [BETA 1547089031] - %2 - %3',time,serverName,productVersion];
	for '_i' from 0 to 30 do
	{
		diag_log _log;
		diag_log format['<infiSTAR.de> %1 - infiSTAR will not START if files are not in place!',time];
	};
};
infiSTAR_MOD = compileFinal str _MOD;
_respawn_west = getMarkerPos 'respawn_west';
_respawn_east = getMarkerPos 'respawn_east';
_respawn_guerrila = getMarkerPos 'respawn_guerrila';
_respawn_civilian = getMarkerPos 'respawn_civilian';
fn_infiSTAR_ObjName = compileFinal "if(getPlayerUID _this isEqualTo '')then{_this getVariable['playerName','Player NO UID!']}else{_n = name _this;_this setVariable['playerName',_n];_n}";publicVariable "fn_infiSTAR_ObjName";
/****************************************************************************************************/
/****************************************************************************************************/
/****************************************************************************************************/
FN_GET_TIME_TIME = compileFinal "
	_hours = floor(_this / 60 / 60);
	_minutes = floor((((_this / 60 / 60) - _hours) max 0.0001)*60);
	_seconds = _this - (_hours*60*60) - (_minutes * 60);
	format['%1h %2min %3s',_hours,_minutes,round _seconds]
";
FNC_A3_CUSTOMLOG = compileFinal "
	params['_logname','_logentry'];
	[_logname,_logentry] call FN_CALL_LOG_DLL;
";
FN_ARMA_LOG = "
	params[['_logname',''],['_logentry','']];
	_this call FNC_A3_CUSTOMLOG;
	_this call FN_ARMA_REMOTELOG;
";
FN_ARMA_LOG = compileFinal FN_ARMA_LOG;
FNC_A3_HACKLOG = compileFinal "['HACKLOG',_this] call FNC_A3_CUSTOMLOG;";
FNC_A3_SURVEILLANCELOG = compileFinal "['SURVEILLANCELOG',_this] call FNC_A3_CUSTOMLOG;";
FNC_A3_ADMINLOG = compileFinal "['ADMINLOG',_this] call FNC_A3_CUSTOMLOG;";
FNC_A3_CONNECTLOG = compileFinal "['CONNECTLOG',_this] call FN_ARMA_LOG;";
FNC_A3_TOKENLOG = compileFinal "['TOKENLOG',_this] call FNC_A3_CUSTOMLOG;";

if!(isClass (missionconfigfile >> "RscListBox_infiSTAR"))exitWith{
	_log = format["<infiSTAR.de> %1 - infiSTAR_defines.hpp is not in your MPMission or you forgot to #include it within your description.ext   [38250x2 - 22-01-2019 18-31-45 - [BETA 1547089031] - %2 - %3]",time,serverName,productVersion];
	diag_log _log;
	["MPMission_ERROR",_log] call FNC_A3_CUSTOMLOG;
};
if!(isClass (missionconfigfile >> "infiSTAR_AdminMenu"))exitWith{
	_log = format["<infiSTAR.de> %1 - infiSTAR_AdminMenu.hpp is not in your MPMission or you forgot to #include it within your description.ext   [38250x2 - 22-01-2019 18-31-45 - [BETA 1547089031] - %2 - %3]",time,serverName,productVersion];
	diag_log _log;
	["MPMission_ERROR",_log] call FNC_A3_CUSTOMLOG;
};
_allowedHTMLLoadURIs = getArray(missionconfigfile >> "CfgCommands" >> "allowedHTMLLoadURIs");
if(!("https://*" in _allowedHTMLLoadURIs) || !("http://*" in _allowedHTMLLoadURIs) || !(getNumber(missionconfigfile >> "infiSTAR_AdminMenu" >> "version") isEqualTo 4))exitWith{
	_log = format["<infiSTAR.de> %1 - infiSTAR_defines.hpp in your MPMission is outdated. Update it or infiSTAR will not load.   [38250x2 - 22-01-2019 18-31-45 - [BETA 1547089031] - %2 - %3]",time,serverName,productVersion];
	diag_log _log;
	["MPMission_ERROR",_log] call FNC_A3_CUSTOMLOG;
};








_allRandomGenVars = [];
_counts = [];
{
	_counts pushBack (count _x);
} forEach (allVariables missionnamespace);
_num = 0;
{
	_num = _num + _x;
} forEach _counts;
_count = count _counts;
_average = round(_num / _count);
_randminval = (_average/3);
_randmaxval = (_average/1.5);
_fnc_RandomGen =
{
	_fnc_actualGen = {
		_abc = ['z','y','x','w','v','u','t','s','r','q','p','o','n','m','l','k','j','i','h','g','f','e','d','c','b','a'];
		_gen = _abc select (random ((count _abc)-1));
		_arr = ['a','c','b','7','6','e','4','6','c','8','3','d','b','5','e','8','f','e','2','6','e','4','7','6','f','1','1','7','8','7','6','b','d'];
		_randmax = {((round(random _randminval)) + (round(random _randmaxval))) max _randminval};
		for '_i' from 0 to (call _randmax)do
		{
			_gen = _gen + str(round(random 9)) + (_arr select (random ((count _arr)-1)));
		};
	};
	_gen = '';
	while{_gen=='' || _gen in _allRandomGenVars}do{
		call _fnc_actualGen;
	};
	_allRandomGenVars pushBack _gen;
	_gen
};
['RANDOMVAR',format['<infiSTAR.de> _fnc_RandomGen: %1',_fnc_RandomGen]] call FNC_A3_CUSTOMLOG;
['RANDOMVAR',format['----START-LINE----   (%1)',INFISTARVERSION]] call FNC_A3_CUSTOMLOG;
_adminbox = call _fnc_RandomGen;['RANDOMVAR',format['_adminbox: %1',_adminbox]] call FNC_A3_CUSTOMLOG;
_fnc_mpPackets = call _fnc_RandomGen;['RANDOMVAR',format['_fnc_mpPackets: %1',_fnc_mpPackets]] call FNC_A3_CUSTOMLOG;
_FNC_AH_KICKLOG = call _fnc_RandomGen;['RANDOMVAR',format['_FNC_AH_KICKLOG: %1',_FNC_AH_KICKLOG]] call FNC_A3_CUSTOMLOG;
_FNC_AH_KICKLOGSPAWN = call _fnc_RandomGen;['RANDOMVAR',format['_FNC_AH_KICKLOGSPAWN: %1',_FNC_AH_KICKLOGSPAWN]] call FNC_A3_CUSTOMLOG;
_FNC_PVAH_AdminReq = call _fnc_RandomGen;['RANDOMVAR',format['_FNC_PVAH_AdminReq: %1',_FNC_PVAH_AdminReq]] call FNC_A3_CUSTOMLOG;
_token_by_uid = call _fnc_RandomGen;['RANDOMVAR',format['_token_by_uid: %1',_token_by_uid]] call FNC_A3_CUSTOMLOG;
_uid_by_token = call _fnc_RandomGen;['RANDOMVAR',format['_uid_by_token: %1',_uid_by_token]] call FNC_A3_CUSTOMLOG;
_server_setTokenR = call _fnc_RandomGen;['RANDOMVAR',format['_server_setTokenR: %1',_server_setTokenR]] call FNC_A3_CUSTOMLOG;
_YourPlayerToken = call _fnc_RandomGen;['RANDOMVAR',format['_YourPlayerToken: %1',_YourPlayerToken]] call FNC_A3_CUSTOMLOG;
_TokenCT = call _fnc_RandomGen;['RANDOMVAR',format['_TokenCT: %1',_TokenCT]] call FNC_A3_CUSTOMLOG;
_AH_MAIN_BLOCK = call _fnc_RandomGen;['RANDOMVAR',format['_AH_MAIN_BLOCK: %1',_AH_MAIN_BLOCK]] call FNC_A3_CUSTOMLOG;
_AHKickOFF = call _fnc_RandomGen;['RANDOMVAR',format['_AHKickOFF: %1',_AHKickOFF]] call FNC_A3_CUSTOMLOG;
_AHKickLog = call _fnc_RandomGen;['RANDOMVAR',format['_AHKickLog: %1',_AHKickLog]] call FNC_A3_CUSTOMLOG;
_clientdo = call _fnc_RandomGen;['RANDOMVAR',format['_clientdo: %1',_clientdo]] call FNC_A3_CUSTOMLOG;
_AH_RunCheckENDVAR = call _fnc_RandomGen;['RANDOMVAR',format['_AH_RunCheckENDVAR: %1',_AH_RunCheckENDVAR]] call FNC_A3_CUSTOMLOG;
_AH_RunCheckENDVAR_THREAD = call _fnc_RandomGen;['RANDOMVAR',format['_AH_RunCheckENDVAR_THREAD: %1',_AH_RunCheckENDVAR_THREAD]] call FNC_A3_CUSTOMLOG;
_AH_HackLogArrayRND = call _fnc_RandomGen;['RANDOMVAR',format['_AH_HackLogArrayRND: %1',_AH_HackLogArrayRND]] call FNC_A3_CUSTOMLOG;
_AH_SurvLogArrayRND = call _fnc_RandomGen;['RANDOMVAR',format['_AH_SurvLogArrayRND: %1',_AH_SurvLogArrayRND]] call FNC_A3_CUSTOMLOG;
_AH_AdmiLogArrayRND = call _fnc_RandomGen;['RANDOMVAR',format['_AH_AdmiLogArrayRND: %1',_AH_AdmiLogArrayRND]] call FNC_A3_CUSTOMLOG;
_AH_TmpBanArrayRND = call _fnc_RandomGen;['RANDOMVAR',format['_AH_TmpBanArrayRND: %1',_AH_TmpBanArrayRND]] call FNC_A3_CUSTOMLOG;
_AHpos = call _fnc_RandomGen;['RANDOMVAR',format['_AHpos: %1',_AHpos]] call FNC_A3_CUSTOMLOG;
_ninetwo = call _fnc_RandomGen;['RANDOMVAR',format['_ninetwo: %1',_ninetwo]] call FNC_A3_CUSTOMLOG;
_ninetwothread = call _fnc_RandomGen;['RANDOMVAR',format['_ninetwothread: %1',_ninetwothread]] call FNC_A3_CUSTOMLOG;
_adminsA = call _fnc_RandomGen;['RANDOMVAR',format['_adminsA: %1',_adminsA]] call FNC_A3_CUSTOMLOG;
_MC = call _fnc_RandomGen;['RANDOMVAR',format['_MC: %1',_MC]] call FNC_A3_CUSTOMLOG;
_MCS = call _fnc_RandomGen;['RANDOMVAR',format['_MCS: %1',_MCS]] call FNC_A3_CUSTOMLOG;
_lastshotmade = call _fnc_RandomGen;['RANDOMVAR',format['_lastshotmade: %1',_lastshotmade]] call FNC_A3_CUSTOMLOG;
_inCombatTime = call _fnc_RandomGen;['RANDOMVAR',format['_inCombatTime: %1',_inCombatTime]] call FNC_A3_CUSTOMLOG;
_inCombatArray = call _fnc_RandomGen;['RANDOMVAR',format['_inCombatArray: %1',_inCombatArray]] call FNC_A3_CUSTOMLOG;
_fnc_infiKeyHandler = call _fnc_RandomGen;['RANDOMVAR',format['_fnc_infiKeyHandler: %1',_fnc_infiKeyHandler]] call FNC_A3_CUSTOMLOG;
_vehicle_needs_check = call _fnc_RandomGen;['RANDOMVAR',format['_vehicle_needs_check: %1',_vehicle_needs_check]] call FNC_A3_CUSTOMLOG;
_name_by_uid = call _fnc_RandomGen;['RANDOMVAR',format['_name_by_uid: %1',_name_by_uid]] call FNC_A3_CUSTOMLOG;
_owner_by_uid = call _fnc_RandomGen;['RANDOMVAR',format['_owner_by_uid: %1',_owner_by_uid]] call FNC_A3_CUSTOMLOG;
_customcommandingMenu = call _fnc_RandomGen;['RANDOMVAR',format['_customcommandingMenu: %1',_customcommandingMenu]] call FNC_A3_CUSTOMLOG;
_customcommandingMenuOpen = call _fnc_RandomGen;['RANDOMVAR',format['_customcommandingMenuOpen: %1',_customcommandingMenuOpen]] call FNC_A3_CUSTOMLOG;
if(_useTildMenu)then{_cMenu pushBack ('#USER:'+_customcommandingMenu);};
_fnc_RandomGen =
{
	_arr = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
	_gen = 'PVAHR_';
	_max = 5+(round(random 3));
	for '_i' from 1 to _max do {_gen = _gen + str(round(random 9)) + (_arr select (random ((count _arr)-1)));};
	_allRandomGenVars pushBack _gen;
	_gen
};
_AH_KICKLOG = call _fnc_RandomGen;['RANDOMVAR',format['_AH_KICKLOG: %1',_AH_KICKLOG]] call FNC_A3_CUSTOMLOG;
['RANDOMVAR',format['----END-LINE----   (%1)',INFISTARVERSION]] call FNC_A3_CUSTOMLOG;
_KK_fnc_arrayShuffle = {
	private '_cnt';
	_cnt = count _this;
	for '_i' from 1 to _cnt do {
		_this pushBack (_this deleteAt floor random _cnt);
	};
	_this
};
_allRandomGenVars call _KK_fnc_arrayShuffle;
diag_log format['<infiSTAR.de> %1 - loading AntiHack..',time];

DB_ID = compileFinal "";
BOMB = compileFinal "";

_badVarWhitelistReal = [];if(!isNil'_badVarWhitelist')then{_badVarWhitelistReal = _badVarWhitelist;};
if(typeName _CHD == 'STRING')then
{
	_CHD = compileFinal _CHD;
};
_verybadStrings =
[
	'menu loaded','rustler','hangender','hungender',
	'douggem','monstercheats','bigben','fireworks',' is god','> gìve ',
	'hydroxus','kill target','no recoil','rapid fire','explode all','teleportall',
	'destroyall','code to execute','g-e-f','box-esp','god on','god mode','unlimited mags',
	'_execscript','_theban','rhynov1','b1g_b3n','infishit','_escorttt',
	'e_x_t_a_s_y','weppp3','att4chm3nt','f0od_dr1nk','m3d1c4l','t0ol_it3ms','b4ckp4cks',
	'it3m5','cl0th1ng','lystic','extasy','glasssimon_flo','remote_execution','gladtwoown','_pathtoscripts',
	'flo_simon','sonicccc_','fury_','phoenix_','_my_new_bullet_man','_jm3',
	'thirtysix','dmc_fnc_4danews','w_o_o_k_i_e_m_e_n_u','xbowbii_','jm3_','wuat','menutest_','listening to jack',
	'dmcheats.de','kichdm','_news_banner','fucked up','lystics menu','rsccombo_2100','\dll\datmalloc','rsclistbox_1501',
	'rsclistbox_1500','\dll\tcmalloc_bi','___newbpass','updated_playerlist','recking_ki','gg_ee_ff','ggggg_eeeee_fffff',
	'gggg_eeee_ffff','mord all','teleport all','__byass','_altislifeh4x','antifrezze','ownscripts','ownscripted','mesnu',
	'mystic_','init re','init life re','spoody','gef_','throx_','_adasaasasa','_dsfnsjf','cheatmenu','in54nity','markad','fuck_me_','_v4fin',
	'a3randvar','infinite ammo','player markers','+ _code +','randomvar',
	'i can break these cuffs','give 100k','kill all','grimbae','pony menu','35sp','lyštîc mêñu',
	'insert script','3x3cutor','c4sh','t e l e p o r t','> còp','> ammo',
	'titanmods','jaymenu','eject eve','hacked by '
];
_blacklistedVariables append [
	'bis_fnc_dbg_reminder_value','bis_fnc_dbg_reminder','bis_menu_groupcommunication','bis_fnc_addcommmenuitem_menu','gtp',
	'rscspectator','rscspectator_hints','rscspectator_display','rscspectator_playericon','gunrestrain',
	'rscspectator_view','rscspectator_map','rscspectator_vision','rscspectator_keys','gspawnv',
	'rscspectator_interface','gmoney','gkillall',	'time','servertime','myplayeruid','hhahaaaaar','charliesheenkeybinds','kickoff',
	'yolo','runonce','notakeybind','action1','supa_licenses','autokick','wallaisseikun','mainmenu','anarray',
	'gefclose','gefwhite','gefred','gefgreen','gefcyan','firsthint','new_queued','fn_exec','fnd_fnc_select','fnx3','antihackkick','tele','dmap','goldens_global_shit_yeah','glass911_run',
	'geardialog_create','lystokeypress','thirtysix','ly_swaggerlikeus','jkeyszz','n2','boxofmagic','mainscripts','dmc_fnc_4danews','infistarbypass','exec_text','vehicle_dblclick','init_main',
	'esp_count','nute_dat_bomber','s_cash100k','xposplayer','ly_re_onetime','skar_checka','mainscriptsv4','viewdistance','check_load','already_load','meins','f1','dummy','plane_jump',
	'c_player','mouseclickeh','distp','nec2','menu_i_run_color_lp','glassv1nce_bindhandler','thecar','fastanimes','getinpassenger','iaimon','dmc_re_onetime','func_execonserver','fnc_serverkicknice',
	'kick_admins','dasmokeon','hovering','r_kelly_be_flying','slx_xeh_bwc_init_compile','vincelol_altislife','life_fnc_byassskaroah','ah_fnc_mp','jayre','fn_newsbanner','hack_news','trollfuncs',
	'fanatic_infipass','keybindings_xxx','andysclosed','userfuncs','altisfuncs','remexe','bb_nofatigue','bis_fnc_diagkey_var_code','first_page','get_in_d','i_t_s__m_e_o','smissles','whippy_esp',
	'targetfuncs2','life_fnc_antifreeeeze','ly_keyforward','ty_re_onetime','life_fnc_xaaxaa','mein1','goddamnvehiclesxd','mystic_fnc_esp_distance','esp_id_setter','dummymen','whipbut','userfuncs',
	'krohdofreedom','selectedplayer','lmenu1','ggplayer','throx_menu_item','lvl1','init_menu_slew','d_b_r_t_y_slew','v6_gef','xasfjisisafudmmyx','kekse','updated_re_36','first','second','paradox_s3tc4sh',
	'checkchatloop','bringmeup','finie_s_p','fnc_infiAdminKeyDown','jay_vehicle_list',
	'shit','whsh506_m41n','finifeaturesformatted','nigger_init','bmcloos','exile_slayexiles',
	'buttons','opnmemeu','firstload','nss_ac_openvvs','nss_ac_openvas','nss_ac_setcaptive',
	'nss_ac_invisible','nss_ac_mapteleport','nss_ac_opencode','nss_ac_freecam','nss_ac_godmode','nss_ac_execscript',
	'nss_ac_openspectator','menuinit','realscripts','targetplr',
	'MLRN_RE','Running','RE'
];


_UMH_ARRAY = [
	["getText(configfile >> 'RscDisplayInventory' >> 'controls' >> 'EpochBTN1' >> 'onMouseButtonDown')",'RscDisplayInventory >> EpochBTN1','onMouseButtonDown'],
	["getText(configfile >> 'RscDisplayInventory' >> 'controls' >> 'EpochBTN2' >> 'onMouseButtonDown')",'RscDisplayInventory >> EpochBTN2','onMouseButtonDown'],
	["getText(configfile >> 'TapOut' >> 'controls' >> 'tapout' >> 'action')",'TapOut','action'],
	["getText(configfile >> 'TapOut' >> 'controls' >> 'tapout' >> 'onKeyDown')",'TapOut','onKeyDown'],
	["getText(configFile >> 'RscDisplayOptionsVideo' >> 'controls' >> 'G_VideoOptionsControls' >> 'controls' >> 'HideAdvanced' >> 'OnButtonClick')",'RscDisplayOptionsVideo >> HideAdvanced','OnButtonClick'],
	["getText(configFile >> 'RscDisplayOptions' >> 'controls' >> 'BCredits' >> 'OnButtonClick')",'RscDisplayOptions >> BCredits','OnButtonClick'],
	["getText(configFile >> 'RscDisplayOptions' >> 'controls' >> 'ButtonCancel' >> 'OnButtonClick')",'RscDisplayOptions >> ButtonCancel','OnButtonClick'],
	["getText(configFile >> 'RscDisplayOptions' >> 'controls' >> 'ButtonCancel' >> 'action')",'RscDisplayOptions >> ButtonCancel','action'],
	["getText(configFile >> 'RscDisplayOptions' >> 'controls' >> 'BGameOptions' >> 'action')",'RscDisplayOptions >> BGameOptions','action'],
	["getText(configFile >> 'RscDisplayOptions' >> 'controls' >> 'BConfigure' >> 'action')",'RscDisplayOptions >> BConfigure','action'],
	["getText(configFile >> 'RscDisplayMPInterrupt' >> 'controls' >>'ButtonAbort' >> 'action')",'RscDisplayMPInterrupt >> ButtonAbort','action'],
	["getText(configFile >> 'RscDisplayMPInterrupt' >> 'controls' >>'ButtonAbort' >> 'OnButtonClick')",'RscDisplayMPInterrupt >> ButtonAbort','OnButtonClick']
];
_UMH_ARRAYSERVER = [];
{
	_string = call compile (_x select 0);
	_sarray = toArray _string;
	_UMH_ARRAYSERVER pushBack _sarray;
} forEach _UMH_ARRAY;

_disAllowVon = _disAllowVon - [5];

if(_MOD == 'Epoch')then
{
	_onLoadUnload1Epochonly = [
		'RscWelcomeEpoch','RscDisplayInfo','RscVersionUpdateEpoch','RscInGameUI','RscUnitInfo','RscStanceInfo','RscUnitInfoAirRTDBasic','RscUnitInfoAirRTDFull','EpochLoadingScreen',
		'EpochGameUI','EpochGameUI2','EpochGameUI3','Interact','GroupRequests','CraftItem','InteractVehicle','InteractNPC','InteractBank','Epoch_myGroup','EPOCH_createGrp',
		'Epoch_GroupInvite'
	];
	_onLoadUnload1 = _onLoadUnload1 + _onLoadUnload1Epochonly;
};
_onLoadUnload2 = [];
_onLoadUnload3 = [];
{
	_onLoadUnload2 pushBack (toArray(getText(configFile >> _x >> 'onLoad')));
	_onLoadUnload3 pushBack (toArray(getText(configFile >> _x >> 'onUnload')));
} forEach _onLoadUnload1;
fnc_getserverTime = compileFinal "
	_hours = floor(serverTime / 60 / 60);
	_value = ((serverTime / 60 / 60) - _hours);
	if(_value == 0)then{_value = 0.0001;};
	_minutes = round(_value * 60);
	_mytime = format['%1h %2min | ',_hours,_minutes];
	_mytime
";
fnc_stop_safe_glitch = compileFinal "
if(!isNil'EPOCH_initUI_THREAD')then{terminate EPOCH_initUI_THREAD;EPOCH_initUI_THREAD=nil;};
EPOCH_initUI_THREAD = _this spawn EPOCH_initUI;
_container = _this select 1;

_locked = locked _container in [2, 3];
_EPOCH_Locked = _container getVariable['EPOCH_Locked', false];
_lockedNear = false;

if(_container isKindOf 'GroundWeaponHolder' || _container isKindOf 'WeaponHolderSimulated' || _container isKindOf 'container_epoch')then
{
	{if (locked _x in [2, 3] ||_x getVariable['EPOCH_Locked', false]) exitWith {_lockedNear = true}} forEach (player nearSupplies 10);
	if(!_lockedNear)then
	{
		{
			_lockedx = locked _x in [2, 3];
			_EPOCH_Lockedx = _x getVariable['EPOCH_Locked', false];
			if((((_lockedx || _EPOCH_Lockedx) && !(local _x))||(!alive _x)) && !(_x in [_container,vehicle _container]))exitWith{_lockedNear = true;};
		} forEach (player nearObjects ['AllVehicles', 5]);
	};
};
if(_locked || _EPOCH_Locked || _lockedNear)then
{
	if(!isNil'checkGearDisplayThread')then{terminate checkGearDisplayThread;checkGearDisplayThread=nil;};
	checkGearDisplayThread = [] spawn {
		disableSerialization;
		waitUntil {!isNull findDisplay 602};
		waitUntil {
			_display = findDisplay 602;
			_ctrl_cargo = _display displayCtrl 6401;
			_ctrl_ground = _display displayCtrl 6321;
			_ctrl_cargo ctrlEnable  false;
			ctrlSetFocus _ctrl_ground;
			ctrlActivate _ctrl_ground;
			isNull findDisplay 602
		};
	};
};
";
FN_infiSTAR_S = compileFinal "
params [['_input',''],['_code',{}],['_id',0],['_jip',false]];
if(_id isEqualTo 0)exitWith{false};
if(_code isEqualType '')then{_code=compile _code;};
if(_id isEqualTo 2)exitWith{_input call _code};
[_input,_code] remoteExecCall ['call',_id,_jip]
";
fnc_getSteamNameIfSaved = compileFinal "
	missionNameSpace getVariable [format['STEAM_NAME_%1',_this],'']
";
_A3AHPREstring = "
	"; if(_MOD == 'Epoch')then{ _A3AHPREstring = _A3AHPREstring + "
		_callwith = [_this,'infiSTAR.de'];
		if((_this isKindOf 'LandVehicle') || (_this isKindOf 'Air') || (_this isKindOf 'Ship') || (_this isKindOf 'Tank'))then
		{
			_callwith call EPOCH_server_save_killedVehicle;
		}
		else
		{
			if(typeOf _this in ['LockBox_EPOCH','Safe_EPOCH'] || (_this isKindOf 'Buildable_Storage'))then
			{
				_callwith call EPOCH_server_save_killedStorage;
			}
			else
			{
				_callwith call EPOCH_server_save_killedBuilding;
			};
		};
	"; }; _A3AHPREstring = _A3AHPREstring + "
	{deleteVehicle _x;} forEach (attachedObjects _this);
	deleteVehicle _this;
";
fnc_deleteObject = compileFinal _A3AHPREstring;
_admins = [];{_admins append (_x select 0)} forEach _adminUIDandAccess;
_devs = ['76561198152111329'];{if!(_x in _admins)then{_admins pushBack _x;};} forEach _devs;
_admins = _admins - [''];
_asd = "";




_asd = "
"+_adminsA+" = "+str _admins+";{"+_adminsA+" = "+_adminsA+" - [_x];} forEach "+str _startAsNormal+";
_server_setToken={
	params['_uid','_owner'];
	_fnc_RandomGen =
	{
		_arr = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9'];
		_gen = _arr select (floor (random 25));
		for '_i' from 0 to (12+(round(random 5))) do {_gen = _gen + (_arr select (random ((count _arr)-1)));};
		_gen
	};
	_token = call _fnc_RandomGen;
	missionNameSpace setVariable [format['"+_token_by_uid+"%1',_uid],_token];
	missionNameSpace setVariable [format['"+_uid_by_token+"%1',_token],_uid];
	_token
};
"+_server_setTokenR+" = compileFinal ([_server_setToken] call fnc_CompilableString);

FNC_INFISERVERKICK = {
	params[
		['_name','',['']],
		['_uid','',['']],
		['_owner',-10,[0]],
		['_reason','',['']]
	];

	_return = false;
	if(_owner > 2)then {
		_return = (call FN_GET_SERVERPW) serverCommand format ['#kick %1',_owner];
	} else {
		_return = (call FN_GET_SERVERPW) serverCommand format ['#kick %1',_uid];
	};

	_admin = _uid in "+str _admins+";
	_log = if(_reason isEqualTo '')then{format['%1(%2) isAdmin? %3',_name,_uid,_admin]}else{format['%1(%2) isAdmin? %3: %4',_name,_uid,_admin,_reason]};
	if(_return)then {
		['KICKLOG',_log] call FN_ARMA_LOG;
	} else {
		['KICKLOG',format['ERROR! COULD NOT USE SERVER KICK FUNCTION FOR - [%1]',_log]] call FN_ARMA_LOG;
	};
};
FNC_INFISERVERKICK = compileFinal ([FNC_INFISERVERKICK] call fnc_CompilableString);

FNC_A3_infiSTARTMPBAN = {
	params[['_name',''],['_uid',''],['_owner',-10,[0]],['_reason','']];
	if!(_uid in "+_AH_TmpBanArrayRND+")then {
		_admins = "+str _admins+";
		if(_uid in _admins)exitWith
		{
			_mytime = call fnc_getserverTime;
			_log = _mytime + format['%1(%2) ADMIN - would have been tempbanned now!',_name,_uid];
			_log call FNC_A3_HACKLOG;
		};
		"+_AH_TmpBanArrayRND+" pushBack _uid;
		{if(getPlayerUID _x in _admins)then{(owner _x) publicVariableClient '"+_AH_TmpBanArrayRND+"';};} forEach allPlayers;
	};
	[_name,_uid,_owner,format['TEMP BAN: %1',_reason]] call FNC_INFISERVERKICK;
};
FNC_A3_infiSTARTMPBAN = compileFinal ([FNC_A3_infiSTARTMPBAN] call fnc_CompilableString);

FNC_A3_infiSTARBAN = {
	params[['_name',''],['_uid',''],['_reason','']];
	if(_uid in "+str _admins+")exitWith{
		_mytime = call fnc_getserverTime;
		_log = _mytime + format['%1(%2) ADMIN - would have been banned now!',_name,_uid];
		_log call FNC_A3_HACKLOG;
	};
	_owner = missionNameSpace getVariable[format['"+_owner_by_uid+"%1',_uid],-2];
	if(_owner > 2)then{_owner call fn_infiSTAR_BanNotice;};
	_banned = false;
	if(count _uid isEqualTo 17)then{
"; if(_armalog)then{ _asd = _asd + "
		private _ret = ['armalog' callExtension ('xban|'+ _uid)] param [0, '', ['']];
		_ret remoteExecCall ['systemChat',remoteExecutedOwner,false];
		['BANLOG',_ret] call FN_ARMA_LOG;
"; }; _asd = _asd + "
		_banned = (call FN_GET_SERVERPW) serverCommand format ['#exec ban %1',str _uid];
	} else {
		if(_owner > 2)then{
			_banned = (call FN_GET_SERVERPW) serverCommand format ['#exec ban %1',str _owner];
		};
	};
	_log = if(_reason isEqualTo '')then{format['%1(%2): %3',_name,_uid,_banned]}else{format['%1(%2): %3 - %4',_name,_uid,_banned,_reason]};
	['BANLOG',_log] call FN_ARMA_LOG;
};
FNC_A3_infiSTARBAN = compileFinal ([FNC_A3_infiSTARBAN] call fnc_CompilableString);

"; if(_armalog)then{ _asd = _asd + "
fn_infiSTAR_checkGlobalBanState = {
	params ['_name','_uid','_owner'];
	_res = 'armalog' callExtension ('a' + _uid);
	if(count _res isEqualTo 3)then{
		if(_res select [0,1] isEqualTo '1')then{ [_name,_uid,_owner,'GLOBAL infiSTAR BAN'] call FNC_INFISERVERKICK; };
		if(_res select [2,3] isEqualTo '1')then{ [_name,_uid,_owner,'GLOBAL BattlEye BAN'] call FNC_A3_infiSTARTMPBAN; };
	};
};
fn_infiSTAR_checkGlobalBanState = compileFinal ([fn_infiSTAR_checkGlobalBanState] call fnc_CompilableString);
"; }; _asd = _asd + "
diag_log format['<infiSTAR.de> %1 - Thread MAIN: starting!',time];
_fnc_infiSTAR_PlayerLog = {
	params[['_uid',''],['_name',''],['_owner',-10]];
	if (_owner < 3) exitwith {};
	if(_uid in "+_AH_TmpBanArrayRND+")exitWith{ [_name,_uid,_owner,'TMPBAN ARRAY BROKEN'] call FNC_INFISERVERKICK; };
	_lname = toLower _name;
	if(_lname isEqualTo 'dead')exitWith
	{
		_log = 'BadName (KICKED)';
		[_name,_uid,'SLOG_SKICK',toArray(_log)] call "+_FNC_AH_KICKLOG+";
	};
	if(_lname find '&' > -1)exitWith
	{
		_log = '& in name breaks BattleEye..';
		[_name,_uid,'SLOG_SKICK',toArray(_log)] call "+_FNC_AH_KICKLOG+";
	};
	{
		if(_lname find _x > -1)then
		{
			_log = format['BadName: %1 (KICKED)',_x];
			[_name,_uid,'SLOG_SKICK',toArray(_log)] call "+_FNC_AH_KICKLOG+";
		};
	} forEach ['thirtysix','le hippo','infis'];
};
fnc_infiSTAR_PlayerLog = compileFinal ([_fnc_infiSTAR_PlayerLog] call fnc_CompilableString);
"+_AH_HackLogArrayRND+" = [];
"+_AH_SurvLogArrayRND+" = [];
"+_AH_AdmiLogArrayRND+" = [];
"+_AH_TmpBanArrayRND+" = [];
diag_log format['<infiSTAR.de> %1 - Thread MAIN: loading...!',time];
diag_log format['<infiSTAR.de> %1 - Thread MAIN: compiling and/or sending none-threaded code!',time];
"; if(_VDN)then{ _asd = _asd + "
_fnc_VoteTimeServer =
{
	_clientUID = _this select 0;
	_vote = _this select 1;
	
	if(isNil 'TimeVoteCooldown')then{TimeVoteCooldown = 300;};
	if(isNil 'LastVoteGoneThrough')then{LastVoteGoneThrough = 600;};
	if((LastVoteGoneThrough == 0) || ((TimeVoteCooldown + LastVoteGoneThrough) < time))then
	{
		if(isNil 'VoteArray')then{VoteArray = [];};
		if!(_clientUID in VoteArray)then
		{
			VoteArray pushBack _clientUID;
			VoteArray pushBack _vote;
			_cntAll = count allPlayers;
			_cntVoted = {getPlayerUID _x in VoteArray} count allPlayers;
			if((_cntAll > 0) && (_cntVoted > 0))then
			{
				_cntday = 0;
				_cntnight = 0;
				if((_cntVoted / _cntAll) > 0.49)then
				{
					_oUIDs = [];
					{
						_xUID = getPlayerUID _x;
						if(_xUID != '')then
						{
							_oUIDs pushBack _xUID;
						};
					} forEach allPlayers;
					for '_i' from 0 to (count VoteArray)-1 step 2 do
					{
						_cUID = VoteArray select _i;
						_cVOTE = VoteArray select (_i+1);
						if(_cUID in _oUIDs)then
						{
							if(_cVOTE == 'DAY')then{_cntday = _cntday + 1;};
							if(_cVOTE == 'NIGHT')then{_cntnight = _cntnight + 1;};
						};
					};
					
					_txt = format['%1 of %2 Players voted. %3 for Day and %4 for Night.',_cntVoted,_cntAll,_cntday,_cntnight];
					['<t size=''0.55'' color=''#0B6121''>'+(_txt)+'</t>',safeZoneXAbs/safeZoneWAbs/4,SafeZoneY+0.02,10,0,0,3079] remoteExec ['bis_fnc_dynamictext', -2, false];
					
					_date = date;
					_date set [3,11];
					if(_cntnight > _cntday)then
					{
						_date set [3,23];
					};
					setDate _date;
					VoteArray = [];
					LastVoteGoneThrough = time;
				}
				else
				{
					_txt = format['%1 of %2 Players voted (/vote day or /vote night).',_cntVoted,_cntAll];
					['<t size=''0.55'' color=''#0B6121''>'+(_txt)+'</t>',safeZoneXAbs/safeZoneWAbs/4,SafeZoneY+0.02,10,0,0,3079] remoteExec ['bis_fnc_dynamictext', -2, false];
				};
			};
		};
	}
	else
	{
		_txt = format['Wait %1s more until next day/night vote can be made!',round((TimeVoteCooldown + LastVoteGoneThrough) - time)];
		['<t size=''0.55'' color=''#0B6121''>'+(_txt)+'</t>',safeZoneXAbs/safeZoneWAbs/4,SafeZoneY+0.02,10,0,0,3079] remoteExec ['bis_fnc_dynamictext', -2, false];
	};
};
fnc_VoteTimeServer = compileFinal ([_fnc_VoteTimeServer] call fnc_CompilableString);
"; }; _asd = _asd + "
_FNC_AH_KICKLOG = {
	params[['_name',''],['_puid',''],['_what','']];
	if(_what isEqualTo 'CLIENT_PING')exitWith
	{
		_clientProductVersion = _this select 7;
		_clientObject = objectFromnetId (_this select 3);
		missionNamespace setVariable [format['object_by_uid_%1',_uid],_clientObject];
		
		_steamName = toString(_this select 4);
		
		missionNamespace setVariable [format['STEAM_NAME_%1',_uid],_steamName];
		_log = format['Connected (CLIENT_PING): %1(%2) Owner: %3, SteamName: %4, Client ProductVersion: %5   [UpTime: %6 - ServerFPS: %7]',_name,_uid,_owner,_steamName,_clientProductVersion,time call FN_GET_TIME_TIME,diag_fps];
		['CONNECTLOG',_log] call FN_ARMA_LOG;
		
		_tempbans = call { missionNamespace getVariable ['"+_AH_TmpBanArrayRND+"', []] };
		if!(_tempbans isEqualType [])then{ _tempbans = []; };
		_pid = _this select 5;
		if(_pid in _tempbans)then
		{
			_log = format['Old PlayerUID: %1 is banned on this server. Player BANNED again!',_pid];
			[_name,_uid,_owner,_log] call FNC_INFISERVERKICK;
		};
		_pidi = _this select 6;
		if(_pidi in _tempbans)then
		{
			_log = format['Old infiSTAR PlayerUID: %1 is banned on this server. Player BANNED again!',_pidi];
			[_name,_uid,_owner,_log] call FNC_INFISERVERKICK;
		};
		_logold = toString(_this select 8);
		if!(_logold isEqualTo '')then
		{
			['DEBUG_CODE',format['DEBUG CODE OF %1(%2): %3',_name,_uid,_logold]] call FNC_A3_CUSTOMLOG;
		};
	};


	if(_puid isEqualTo '')exitWith
	{
		diag_log format['<infiSTAR.de> CLIENT NO UID - SERVER RESOLVED: %1(%2).. used allPlayers',_name,_puid];
	};
	if(_what isEqualTo 'KICKME')exitWith{[_name,_puid,-10,'KICKME CALL FROM CLIENT'] call FNC_INFISERVERKICK;};
"; if(_CLG)then{ _asd = _asd + "
	if(_what isEqualTo 'COMBATCHECK')exitWith
	{
		_inCombat = _this select 3;
		if(isNil'"+_inCombatArray+"')then{"+_inCombatArray+" = [];};
		_fid = "+_inCombatArray+" find _puid;
		if(_fid != -1)then
		{
			"+_inCombatArray+" set[(_fid+1),_inCombat];
		}
		else
		{
			"+_inCombatArray+" pushBack _puid;
			"+_inCombatArray+" pushBack _inCombat;
		};
	};
"; }; _asd = _asd + "
	_mytime = call fnc_getserverTime;
	_admins = "+str _admins+";
	_locDevs = "+str _devs+";
	if(_what == 'TPLOG')exitWith
	{
		_unit = objectFromNetId (_this select 4);
		_tpkeyFromClient = _this select 5;
		_tpkey = str(_unit getVariable ['telekey','']);
		if!(_tpkeyFromClient isEqualTo _tpkey)then
		{
			[_name,_puid,-10,format['Teleport Key: %1 != %2', _tpkeyFromClient, _tpkey]] call FNC_INFISERVERKICK;
		};
		_adminName = _this select 6;
		_adminPUID = _this select 7;
		if(_adminPUID in _locDevs)exitWith{};
		_lastpos = _this select 8;
		_mapLP = mapGridPosition _lastpos;
		_curpos = _this select 9;
		_mapCP = mapGridPosition _curpos;
		_log = _mytime + format['%1(%2) | Teleported %3(%4) from %5(%6) to %7(%8)  (%9m)',_adminName,_adminPUID,_name,_puid,_lastpos,_mapLP,_curpos,_mapCP,round(_lastpos distance _curpos)];
		_log call FNC_A3_ADMINLOG;
		"; if(_enableIngameLogs)then{ _asd = _asd + "
		"+_AH_AdmiLogArrayRND+" pushBack _log;{if((getPlayerUID _x) in _admins)then{(owner _x) publicVariableClient '"+_AH_AdmiLogArrayRND+"';};} forEach allPlayers;
		"; }; _asd = _asd + "
	};
"; if(_LVC)then{ _asd = _asd + "
	if(_what == 'LVC')exitWith
	{
		private['_plrObj','_vehptype','_vehpos'];
		_plrObj = _this select 3;
		_vehptype = _this select 4;
		_vehpos = _this select 5;
		if((!isNil '_plrObj') && (!isNil '_vehptype'))then
		{
			if(!isNull _plrObj)then
			{
				_veh = vehicle _plrObj;
				_vehstype = typeOf _veh;
				if(_plrObj != _veh)then
				{
					"; if(_UVC)then{ _asd = _asd + "
						if((!("+str _UVW+") && {_vehstype in "+str _ForbiddenVehicles+"}) || (("+str _UVW+") && {!(_vehstype in "+str _VehicleWhiteList+")}))then
						{
							_crew = crew _veh;
							if(_crew isEqualTo [])then
							{
								_log = format['BadVehicle (S-UVC+LVC): %1',_vehstype];
								['SERVER','SERVER','HLOG',toArray(_log)] call "+_FNC_AH_KICKLOG+";
								_veh call fnc_deleteObject;
							}
							else
							{
								if(call{{if((getPlayerUID _x) in "+_adminsA+")exitWith{true};false} forEach _crew;})exitWith{};
								
								_log = format['BadVehicle (S-UVC+LVC): %1',_vehstype];
								{
									_name = name _x;
									_puid = getPlayerUID _x;
									[_name,_puid,'HLOG',toArray(_log)] call "+_FNC_AH_KICKLOG+";
								} forEach _crew;
								_veh call fnc_deleteObject;
							};
						};
					"; }; _asd = _asd + "
				};
				if(!isNull _veh)then
				{
					if((_plrObj == _veh) && (_vehstype != _vehptype))then
					{
						if!(_veh in (_plrObj nearEntities ['AllVehicles',300]))then
						{
							['', { deleteVehicle (vehicle player); }] remoteExecCall ['call', _plrObj, false];
							_log = format['LocalVehicle: %1  @%2 || ServerVehicle: %3  @%4',_vehptype,_vehpos,_vehstype,mapGridPosition _plrObj];
							[_name,_puid,'SLOG',toArray(_log)] call "+_FNC_AH_KICKLOG+";
						};
					};
				};
			};
		};
	};
"; }; _asd = _asd + "
	_work = toString(_this select 3);
	_log = _mytime + format['%1(%2) | %3',_name,_puid,_work];
"; if(_LogAdminActions)then{ _asd = _asd + "
	if(_what == 'ALOG')exitWith
	{
		_log call FNC_A3_ADMINLOG;
		"; if(_enableIngameLogs)then{ _asd = _asd + "
		"+_AH_AdmiLogArrayRND+" pushBack _log;{if((getPlayerUID _x) in _admins)then{(owner _x) publicVariableClient '"+_AH_AdmiLogArrayRND+"';};} forEach allPlayers;
		"; }; _asd = _asd + "
	};
"; }; _asd = _asd + "
	if(_what in ['SLOG','SLOG_SKICK'])exitWith
	{
		_log call FNC_A3_SURVEILLANCELOG;
		"; if(_enableIngameLogs)then{ _asd = _asd + "
		"+_AH_SurvLogArrayRND+" pushBack _log;{if((getPlayerUID _x) in _admins)then{(owner _x) publicVariableClient '"+_AH_SurvLogArrayRND+"';};} forEach allPlayers;
		"; }; _asd = _asd + "
		if(_what == 'SLOG_SKICK')exitWith
		{
			[_name,_puid,-10,format['%1: %2',_what,_work]] call FNC_INFISERVERKICK;
		};
	};
	if(_what isEqualTo 'SLOG_RE')exitWith
	{
		_log call FNC_A3_SURVEILLANCELOG;
		"; if(_enableIngameLogs)then{ _asd = _asd + "
		"+_AH_SurvLogArrayRND+" pushBack _log;{if((getPlayerUID _x) in _admins)then{(owner _x) publicVariableClient '"+_AH_SurvLogArrayRND+"';};} forEach allPlayers;
		"; }; _asd = _asd + "
	};
	if(_what in ['BAN','TMPBAN','HLOG','HLOG_SKICK'])exitWith
	{
		_log call FNC_A3_HACKLOG;
		"; if(_enableIngameLogs)then{ _asd = _asd + "
		"+_AH_HackLogArrayRND+" pushBack _log;{if((getPlayerUID _x) in _admins)then{(owner _x) publicVariableClient '"+_AH_HackLogArrayRND+"';};} forEach allPlayers;
		"; }; _asd = _asd + "
		if(_what == 'HLOG')exitWith{};
		[_name,_puid,-10,format['%1: %2',_what,_work]] call FNC_INFISERVERKICK;
		if(_what in ['BAN','TMPBAN'])exitWith
		{
			_log = _mytime + format['%1(%2) BANNED | %3',_name,_puid,_work];
			if(_puid in _admins)then
			{
				_adminlog = _mytime + format['%1(%2) ADMIN - would have been banned now!',_name,_puid];
				_adminlog call FNC_A3_HACKLOG;
				"+_AH_HackLogArrayRND+" pushBack _adminlog;
			}
			else
			{
				if(_what == 'BAN')then
				{
					[_name,_puid,_work] call FNC_A3_infiSTARBAN;
				}
				else
				{
					[_name,_puid,-10,_work] call FNC_A3_infiSTARTMPBAN;
				};
			};
		};
	};
	if(_what == 'AC')exitWith
	{
		if(_puid in _admins)then
		{
			if(_work == '!admin')then
			{
				if(_puid in "+_adminsA+")then
				{
					"+_adminsA+" = "+_adminsA+" - [_puid];
					
					"; if(_announce_adminstate_changed)then{ _asd = _asd + "
					_txt = format['%1 logged out as admin..',_name];
					['<t size=''0.5'' color=''#FF0040''>'+(_txt)+'</t>',-0.1,0.96 * safezoneH + safezoneY,10,0,0,3079] remoteExec ['bis_fnc_dynamictext', -2, false];
					"; }; _asd = _asd + "
					
					if(_puid in _locDevs)exitWith{};
					_alog = _mytime + format['%1(%2) | is a normal player now.',_name,_puid];
					_alog call FNC_A3_ADMINLOG;
					"+_AH_AdmiLogArrayRND+" pushBack _alog;
				}
				else
				{
					"+_adminsA+" pushBack _puid;
					
					"; if(_announce_adminstate_changed)then{ _asd = _asd + "
					_txt = format['%1 logged in as admin!',_name];
					['<t size=''0.5'' color=''#0080FF''>'+(_txt)+'</t>',-0.1,0.96 * safezoneH + safezoneY,10,0,0,3079] remoteExec ['bis_fnc_dynamictext', -2, false];
					"; }; _asd = _asd + "
					
					if(_puid in _locDevs)exitWith{};
					_alog = _mytime + format['%1(%2) | is an admin again.',_name,_puid];
					_alog call FNC_A3_ADMINLOG;
					"+_AH_AdmiLogArrayRND+" pushBack _alog;
				};
				
				infiSTAR_ADMINS = "+_adminsA+";
				
				{
					if((getPlayerUID _x) in _admins)then
					{
						(owner _x) publicVariableClient 'infiSTAR_ADMINS';
						"; if(_enableIngameLogs)then{ _asd = _asd + "
						(owner _x) publicVariableClient '"+_AH_AdmiLogArrayRND+"';
						"; }; _asd = _asd + "
					};
				} forEach allPlayers;
				
				infiSTAR_ADMINS = nil;
			};
		};
	};
	"; if(_VDN)then{ _asd = _asd + "
	if(_what == 'VOTE')exitWith
	{
		if(_work in ['DAY','NIGHT'])exitWith
		{
			[_puid,_work] call fnc_VoteTimeServer;
		};
	};
	"; }; _asd = _asd + "
};
"+_FNC_AH_KICKLOG+" = compileFinal ([_FNC_AH_KICKLOG] call fnc_CompilableString);


_FNC_PVAH_AdminReq = {
_allPlayers = "+str _admins+";
_locDevs = "+str _devs+";

_this params [
	['_tokenarray',[],[[]]],
	['_array',[],[[]]],
	['_clientNetID','',['']]
];
_tokenreceived = _tokenarray param [0,'',['']];
_clientOwner = _tokenarray param [1,-10,[0]];


if((_tokenreceived isEqualTo '') && (_clientOwner > 0))exitWith
{
	_mytime = call fnc_getserverTime;
	_log = _mytime + 'AdminReq tokenreceived is empty ([BETA 1547089031])';
	_log call FNC_A3_SURVEILLANCELOG;
};
if(count _array < 2)exitWith
{
	_mytime = call fnc_getserverTime;
	_log = _mytime + format['AdminReq bad array: %1 ([BETA 1547089031])',_array];
	_log call FNC_A3_SURVEILLANCELOG;
};
if(_clientNetID isEqualTo '')exitWith
{
	_mytime = call fnc_getserverTime;
	_log = _mytime + 'AdminReq clientNetID is empty ([BETA 1547089031])';
	_log call FNC_A3_SURVEILLANCELOG;
};


_ObjFromNetID = objectFromNetId _clientNetID;
if(!isPlayer _ObjFromNetID)exitWith
{
	_mytime = call fnc_getserverTime;
	_log = _mytime + 'AdminReq _ObjFromNetID is Null ([BETA 1547089031])';
	_log call FNC_A3_SURVEILLANCELOG;
};
_clientID = (owner _ObjFromNetID);
_clientUID = (getPlayerUID _ObjFromNetID);
_clientName = (name _ObjFromNetID);


_uid_by_token = missionNameSpace getVariable [format['"+_uid_by_token+"%1',_tokenreceived],''];
_owner_by_uid = missionNameSpace getVariable[format['"+_owner_by_uid+"%1',_uid_by_token],-5];
if(_clientUID isEqualTo '' || !(_clientUID isEqualTo _uid_by_token))then
{
	_log = format['%1(%2) | AdminReq - Bad Client UID: object UID: [%3], token UID: [%4]   ([BETA 1547089031])',_clientName,_clientUID,_clientUID,_uid_by_token];
	_log call FNC_A3_SURVEILLANCELOG;
	_clientUID = _uid_by_token;
};
if!(_clientOwner isEqualTo _owner_by_uid)exitWith
{
	_log = format['%1(%2) | AdminReq - Bad Owner: client owner [%3], token owner: [%4]  ([BETA 1547089031])',_clientName,_clientUID,_clientOwner,_owner_by_uid];
	_log call FNC_A3_SURVEILLANCELOG;
};


_array params [
	['_option',0,[0]],
	['_playerObj',objNull,[objNull]]
];
if!(_ObjFromNetID isEqualTo _playerObj)then
{
	_mytime = call fnc_getserverTime;
	_log = _mytime + format['AdminReq _playerObj != _ObjFromNetID - %1/2  ([BETA 1547089031])',_playerObj,_ObjFromNetID];
	_log call FNC_A3_SURVEILLANCELOG;
	_playerObj = _ObjFromNetID;
};

if(_option isEqualTo 69)exitWith
{
	_opt = _array select 2;
	_code = _array select 3;
	_code = toString _code;
	_code = compile _code;
	if(_opt isEqualTo 0)exitWith{call _code;['',_code,-2,false] call FN_infiSTAR_S;};
	if(_opt isEqualTo 1)exitWith{call _code;};
	if(_opt isEqualTo 2)exitWith{
		_target = objectFromnetId(_array select 4);
		if(isNil '_target')exitWith{};
		if(typename _target != 'OBJECT')exitWith{};
		if(isNull _target)exitWith{};
		_owner = owner _target;
		if(_owner in [0,-2,2])exitWith{};
		['',_code,_owner,false] call FN_infiSTAR_S;
	};
};
if(_option isEqualTo -668)exitWith
{
	_clearLog = _array select 2;
	_adminObjects = [];{if((getPlayerUID _x) in _allPlayers)then{_adminObjects pushBack _x;};} forEach allPlayers;
	if(_clearLog == 0)then
	{
		{
			if(!isNull _x)then
			{
				"+_AH_HackLogArrayRND+" = [];(owner _x) publicVariableClient '"+_AH_HackLogArrayRND+"';
				"+_AH_SurvLogArrayRND+" = [];(owner _x) publicVariableClient '"+_AH_SurvLogArrayRND+"';
			};
		} forEach _adminObjects;
	}
	else
	{
		{
			if(!isNull _x)then
			{
				"+_AH_AdmiLogArrayRND+" = [];(owner _x) publicVariableClient '"+_AH_AdmiLogArrayRND+"';
			};
		} forEach _adminObjects;
	};
};
if(_option isEqualTo -667)exitWith
{
	_puid = _array select 2;
	"+_AH_TmpBanArrayRND+" = "+_AH_TmpBanArrayRND+" - [_puid];
	{if(getPlayerUID _x in _allPlayers)then{ (owner _x) publicVariableClient '"+_AH_TmpBanArrayRND+"'; };} forEach allPlayers;
};
if(_option isEqualTo -666)exitWith
{
	_puid = _array select 2;
	_name = _array select 3;
	[_name,_puid,'ADMINBAN'] call FNC_A3_infiSTARBAN;
};
if(_option isEqualTo -665)exitWith
{
	_puid = _array select 2;
	_name = _array select 3;
	[_name,_puid,-10,'Kicked by Admin'] call FNC_INFISERVERKICK;
};
if(_option isEqualTo -664)exitWith
{
	_uid = _array select 2;
	_targetId = missionNameSpace getVariable[format['"+_owner_by_uid+"%1',_uid],-2];
	[_uid, { if (getPlayerUID player isEqualTo _this) then { (findDisplay 46)closeDisplay 0; }; }, _targetId, false] call FN_infiSTAR_S;
};
if(_option isEqualTo -662)exitWith
{
	private['_inputArray','_case','_input1','_input2','_input3'];
	_inputArray = _array select 2;
	if(isNil '_inputArray')exitWith{};
	_case = -1;
	if(_inputArray isEqualType [])then
	{
		_inputArray params[
			['_case',0,[0]],
			['_input1','',['',[]]],
			['_input2','',['',[]]],
			['_input3','',['',[]]]
		];
		
		_input1 = if(_input1 isEqualType [])then{toString _input1};
		_input2 = if(_input2 isEqualType [])then{toString _input2};
		_input3 = if(_input3 isEqualType [])then{toString _input3};
	}
	else
	{
		_case = _inputArray;
	};
"; if(_MOD == 'Epoch')then{ _asd = _asd + "
	if(_case == 0)exitWith{'epochserver' callExtension format['901|%1',_input1];};
"; }; _asd = _asd + "
	if(_case == 1)exitWith{'asd' serverCommand '#lock';};
	if(_case == 2)exitWith{'asd' serverCommand '#unlock';};
	if(_case == 3)exitWith{_puid = _input1;_name = _input2;_reason = _input3;[_name,_puid,_reason] call FNC_A3_infiSTARBAN;};
	if(_case == 4)exitWith{_puid = _input1;_name = _input2;_reason = _input3;[_name,_puid,-10,format['Kicked by Admin  %1',_reason]] call FNC_INFISERVERKICK;};
};
if(_option isEqualTo -4)exitWith
{
	_delete = _array select 2;
	if(typeName _delete != 'ARRAY')then{_delete = [_delete];};
	{
		if(!isNull _x)then
		{
			(vehicle _x) call fnc_deleteObject;
		};
	} forEach _delete;
};
if(_option isEqualTo -3)exitWith
{
	_target = _array select 2;
	_target setOwner 2;
	_pos = getPos _target;
	_pos set[2,(_pos select 2)+2];
	_target setPos _pos;
	_target setVectorUp [0,0,1];
	
	[
		_target,
		{
			_target = _this;
			_pos = getPos _target;
			_pos set[2,(_pos select 2)+2];
			_target setPos _pos;
			_target setVectorUp [0,0,1];
		},
		owner _target,
		false
	] call FN_infiSTAR_S;
};
if(_option isEqualTo -2)exitWith
{
	_target = _array select 2;
	_target setDamage 5;
};
if(_option isEqualTo -1)exitWith
{
	[_array select 2] spawn {
		scriptName 'infiSTAR Zeus / Lighting bolt';
		_pos = _this select 0;
		_bolt = 'LightningBolt' createVehicle _pos;
		_bolt setdamage 5;
		_light = '#lightpoint' createVehicle _pos;
		_light setposatl [_pos select 0,_pos select 1,(_pos select 2) + 10];
		_light setLightDayLight true;
		_light setLightBrightness 300;
		_light setLightAmbient [0.05, 0.05, 0.1];
		_light setlightcolor [1, 1, 2];
		uiSleep 0.1;
		_light setLightBrightness 0;
		uiSleep 0.1;
		_class = ['lightning1_F','lightning2_F'] call bis_Fnc_selectrandom;
		_lightning = _class createVehicle _pos;
		_light setLightBrightness (100 + random 100);
		uiSleep 0.1;
		deleteVehicle _lightning;
		deleteVehicle _light;
	};
};
if(_option isEqualTo 0)exitWith
{
	private['_position','_dir','_vehObj','_slot','_vehClass','_colors','_color','_config','_selections','_textures','_textureSelectionIndex','_count'];
	_vehClass = _array select 2;
	_position = _array select 3;
	_dir = _array select 4;
	
	_vehObj = _vehClass createVehicle _position;
	_vehObj setVariable ['"+_vehicle_needs_check+"',false];
	_vehObj setdir _dir;
	clearWeaponCargoGlobal _vehObj;
	clearMagazineCargoGlobal _vehObj;
	clearBackpackCargoGlobal _vehObj;
	clearItemCargoGlobal _vehObj;
	addToRemainsCollector[_vehObj];
	_vehObj disableTIEquipment true;
	"; if(_MOD == 'Epoch')then{ _asd = _asd + "
	if(_vehObj isKindOf 'Air' || _vehObj isKindOf 'Ship' || _vehObj isKindOf 'LandVehicle')then
	{
		_vehObj call EPOCH_server_setVToken;

		_slot = if(EPOCH_VehicleSlots isEqualTo [])then{ str(count EPOCH_VehicleSlots) } else { EPOCH_VehicleSlots select 0 };
		EPOCH_VehicleSlots = EPOCH_VehicleSlots - [_slot];
		missionNamespace setVariable ['EPOCH_VehicleSlotCount', count EPOCH_VehicleSlots, true];
		_vehObj setVariable['VEHICLE_SLOT',_slot,true];

		_config = (configFile >> 'CfgVehicles' >> _vehClass >> 'availableColors');
		if(isArray(_config))then
		{
			_textureSelectionIndex = configFile >> 'CfgVehicles' >> _vehClass >> 'textureSelectionIndex';
			_selections = if(isArray(_textureSelectionIndex))then{getArray(_textureSelectionIndex)} else { [0] };
			_colors = getArray(_config);
			_textures = _colors select 0;
			_color = floor (random (count _textures));
			_count = (count _colors)-1;
			{
				if(_count >= _forEachIndex)then
				{
					_textures = _colors select _forEachIndex;
				};
				_vehObj setObjectTextureGlobal [_x, (_textures select _color)];
			} forEach _selections;
			_vehObj setVariable['VEHICLE_TEXTURE',_color];
		};
		_vehObj call EPOCH_server_save_vehicle;
		_vehObj call EPOCH_server_vehicleInit;
	};
	"; }; _asd = _asd + "
};
if(_option isEqualTo 1)exitWith
{
	_unit = _array param [2, objNull, [objNull]];
	if(isPlayer _unit)then
	{
		_pos = _array param [3, [0,0,0], [[]]];

		_tpkey = _unit getVariable ['telekey',''];
		if(_tpkey isEqualTo '')then{
			_arr = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9'];
			_tpkey = '';
			for '_i' from 0 to 29 do { _tpkey = _tpkey + (selectRandom _arr); };
			_unit setVariable ['telekey',_tpkey];
		};

		{
			if(isPlayer _x)then{
				[
					[_clientName,_clientUID,_pos,_tpkey],
					{
						player setVariable['teleportKey', _this select 3];
						player setVariable['"+_AHpos+"', _this];
					}
				] remoteExecCall ['call', _x, false];
			};
		} forEach (crew (vehicle _unit));

		(vehicle _unit) allowDamage false;
		(vehicle _unit) SetVelocity [0,0,1];
		(vehicle _unit) setPosATL _pos;
		(vehicle _unit) allowDamage true;
	};
};
if(_option isEqualTo 2)exitWith
{
	_netId = _array param [2,'',['']];
	_state = _array param [3,false,[false]];
	_playerObj hideObjectGlobal _state;
	(objectFromNetId _netId) hideObjectGlobal _state;
	
	[
		[_netId,_state],
		{
			params['_netId','_state'];
			(objectFromNetId _netId) hideObject _state;
		}
	] remoteExecCall ['call',-2];
};
if(_option isEqualTo 3)exitWith
{
	_pos = _array select 2;
	_click = _array select 3;
	if(isClass (configFile >> 'CfgVehicles' >> _click))exitWith{
		_object = createVehicle [_click,_pos,[],3,'CAN_COLLIDE'];
		clearWeaponCargoGlobal _object;
		clearMagazineCargoGlobal _object;
		clearBackpackCargoGlobal _object;
		clearItemCargoGlobal _object;
	};

	_spawner = _array select 1;
	if (_spawner != vehicle _spawner) exitwith {
		vehicle _spawner addItemCargoGlobal[_click, 1];
	};

	_object = objNull;
	_WeaponHolders = nearestObjects[_pos,['GroundWeaponHolder','WeaponHolderSimulated','Land_MPS_EPOCH','container_epoch'],5];
	if!(_WeaponHolders isEqualTo [])then{_object = _WeaponHolders select 0;};
	if(isNull _object)then
	{
		_object = createVehicle ['WeaponHolderSimulated',_pos,[],3,'CAN_COLLIDE'];
	};
	_object addItemCargoGlobal [_click,1];
	if(isClass (configFile >> 'CfgWeapons' >> _click))then
	{
		_magazines = getArray (configFile >> 'CfgWeapons' >> _click >> 'magazines');
		if(str _magazines != '[]')then
		{
			{_object addItemCargoGlobal [_x,3];} forEach _magazines;
		};
	};
	_object setPosATL [_pos select 0,_pos select 1,(_pos select 2)+0.3];
};
if(_option isEqualTo 4)exitWith
{
	private['_target','_unitClass'];
	_target=_array select 2;
	_unitClass = _array select 3;
	[_unitClass,_target,true] remoteexec ['EPOCH_unitSpawn',_target];
};
if(_option isEqualTo 5)exitWith
{
	_target = _array select 2;
	_offset = _array select 3;
	_maxHeight = _array select 4;
	_target attachTo [vehicle _playerObj,[0,_offset,_maxHeight]]; 
};
if(_option isEqualTo 6)exitWith
{
	_offset = _array select 2;
	
	_date = date;
	_date set [3,_offset];
	EPOCH_StaticDateTime = _date;
	setDate _date;
};
if(_option isEqualTo 7)exitWith
{
	_msg = _array select 2;
	if(typeName _msg == 'ARRAY')then
	{
		_msg = toString _msg;
	};
	{[_msg,_x] call fnc_serverMassMessage;} forEach allPlayers;
};
if(_option isEqualTo 8)exitWith
{
	private ['_player', '_playerUID', '_items', '_class', '_dir', '_location', '_type', '_weapon', '_attachments', '_currWeap', '_itemSlot', '_itemqtys', '_goggles', '_headgear', '_vest', '_backpack', '_uniform', '_weapons', '_magazinesAmmo', '_itemsplayer', '_weaponsplayer', '_group', '_primaryWeapon', '_secondaryWeapon', '_attachment', '_equipped', '_wMags', '_playerGroup', '_droppedWeapons', '_newPlyr', '_token', '_owner', '_reviver'];
	_player = _array select 2;
	if(isNil '_player')exitWith{};
	if(isNull _player)exitWith{};
	_fnc_addItemToX = {
		private ['_itemSlot','_itemqtys','_newPlyr'];
		_newPlyr = _this select 0;
		{
			_itemSlot = _forEachIndex;
			_itemqtys = _x select 1;
			{
				for '_i' from 1 to (_itemqtys select _forEachIndex) do {
					switch _itemSlot do {
						case 0: { _newPlyr addItemToUniform _x };
						case 1: { _newPlyr addItemToVest _x };
						case 2: { _newPlyr addItemToBackpack _x };
					};
				};
			} forEach(_x select 0);
		} forEach (_this select 1);
	};
	if(!local _player)then {
		_playerUID = getPlayerUID _player;
		if (!isNil '_playerUID' && !alive _player) then {
			['',{Epoch_canBeRevived = true;},(owner _player),false] call FN_infiSTAR_S;
			_player setVariable['REVIVE',true,true];
			_class = typeOf _player;
			if (_class in ['Epoch_Male_F', 'Epoch_Female_F']) then {
				if (_player getVariable['REVIVE', true]) then {
					if (_player getvariable ['Reviving', false]) exitwith {
						diag_log format['DEBUG Reviving skipped - Player already reviving : %1', _this];
					};
					_player setvariable ['Reviving',true];
					_location = getPosATL _player;
					_dir = getDir _player;
					_playerGroup = _player getVariable['GROUP', ''];
					_goggles = goggles _player;
					_headgear = headgear _player;
					_vest = vest _player;
					_backpack = backpack _player;
					_uniform = uniform _player;
					_items = assignedItems _player;
					_magazinesAmmo = magazinesAmmo _player;
					_primaryWeapon = '';
					_secondaryWeapon = '';
					_wh = nearestObjects[_player, ['WeaponHolderSimulated'], 12];
					_droppedPrimary = [];
					_droppedSecondary = [];
					_droppedWeapons = [];
					_deleteprimary = [];
					_deletesecondary = [];
					reverse _wh;
					{
						_currwh = _x;
						{
							_type = getNumber(configfile >> 'cfgweapons' >> (_x select 0) >> 'type');
							switch _type do {
								case 1: {_droppedPrimary = _x; _primaryWeapon = _x select 0; _deleteprimary = [_currwh]};
								case 4: {_droppedSecondary = _x; _secondaryWeapon = _x select 0;_deletesecondary = [_currwh]};
							};
						} forEach (weaponsItemsCargo _x);
					} foreach _wh;
					{
						if (!isnull _x) then {deletevehicle _x};
					} foreach (_deleteprimary+_deletesecondary);
					if !(_droppedPrimary isequalto []) then {_droppedWeapons pushback _droppedPrimary};
					if !(_droppedSecondary isequalto []) then {_droppedWeapons pushback _droppedSecondary};
					_itemsplayer = [getItemCargo(uniformContainer _player), getItemCargo(vestContainer _player), getItemCargo(backpackContainer _player)];
					_weaponsplayer = [getWeaponCargo(uniformContainer _player), getWeaponCargo(vestContainer _player), getWeaponCargo(backpackContainer _player)];
					_weapons = [currentWeapon _player, ((weaponsItems _player) + _droppedWeapons), [_primaryWeapon, _secondaryWeapon, handgunWeapon _player]];
					hideObjectGlobal _player;
					_group = grpNull;
					if (_playerGroup != '') then {
						{
							if ((_x getVariable['GROUP','']) == _playerGroup) exitWith {
								_group = group _x;
							};
						}forEach allPlayers;

						if (isNull _group) then {
							_group = createGroup west;
						};
					} else {
						_group = createGroup west;
					};
					_newPlyr = _group createUnit[_class, _location, [], 0, 'CAN_COLLIDE'];
					addToRemainsCollector[_newPlyr];
					{
						_newPlyr disableAI _x;
					}forEach['FSM', 'MOVE', 'AUTOTARGET', 'TARGET'];
					_newPlyr setVariable ['SETUP', true];
					_newPlyr setVariable ['PUID', _playerUID];
					_newPlyr setVariable ['GROUP', _playerGroup];
					_newPlyr setVariable ['REVIVE', false];
					_newPlyr setDir _dir;
					_newPlyr setPosATL _location;
					_newPlyr setFatigue 1;
					_newPlyr setDamage 0.25;
					if (_uniform != '') then {
						_newPlyr addUniform _uniform;
					};
					if (_backpack != '') then {
						_newPlyr addBackpack _backpack;
					};
					if (_goggles != '') then {
						_newPlyr addGoggles _goggles;
					};
					if (_headgear != '') then {
						_newPlyr addHeadgear _headgear;
					};
					if (_vest != '') then {
						_newPlyr addVest _vest;
					};
					if (count _weapons >= 3) then {
						_equipped = _weapons select 2;
						{
							_weapon = _x deleteAt 0;
							_type = getNumber(configfile >> 'cfgweapons' >> _weapon >> 'type');
							_attachments = [];
							_wMags = false;
							_wMagsArray = [];
							{
								if (_x isEqualType []) then{
									_wMags = true;
									_wMagsArray pushback _x;
								} else {
									if (_x != '') then{
										_attachments pushBack _x;
									};
								};
							} forEach _x;
							if (_wMags) then {
								{
									_newPlyr addMagazine _x;
								} foreach _wMagsArray;
							};
							if (_weapon in _equipped) then {
								_equipped = _equipped - [_weapon];
								if (_weapon != '') then {
									_newPlyr addWeapon _weapon;
								};
								switch _type do {
									case 1: {
										removeAllPrimaryWeaponItems _newPlyr;
										{ _newPlyr addPrimaryWeaponItem _x }forEach _attachments;
									};
									case 2:	{
										removeAllHandgunItems _newPlyr;
										{ _newPlyr addHandgunItem _x }forEach _attachments;
									};
									case 4:	{
										{
											_newPlyr removeSecondaryWeaponItem _x;
										} forEach(secondaryWeaponItems _newPlyr);
										{ _newPlyr addSecondaryWeaponItem _x }forEach _attachments;
									};
								};
							}else{
								{
									_newPlyr addItem _x;
								}forEach _attachments;
							};
						} forEach (_weapons select 1);
					};
					{
						if (_x in ['Binocular','Rangefinder']) then {
							_newPlyr addWeapon _x;
						} else {
							_newPlyr linkItem _x;
						};
					}forEach _items;
					[_newPlyr, _itemsplayer] call _fnc_addItemToX;
					[_newPlyr, _weaponsplayer] call _fnc_addItemToX;
					{_newPlyr addMagazine _x;}forEach _magazinesAmmo;
					_token = _newPlyr call EPOCH_server_setPToken;
					_CorpseCrypto = _player getVariable['Crypto', 0];
					if (_CorpseCrypto > 0) then {
						_cIndex = EPOCH_customVars find 'Crypto';
						_vars = _player getVariable['VARS', call EPOCH_defaultVars_SEPXVar];
						_PlayerCrypto = _CorpseCrypto;
						_PlayerCrypto remoteExec ['EPOCH_effectCrypto',_player];
						_vars set[_cIndex, _PlayerCrypto];
						_newPlyr setVariable['VARS', _vars];
					};
					[_newPlyr, _token, loadAbs _newPlyr] remoteExec ['EPOCH_clientRevive',_player];
					['',{Epoch_canBeRevived = true;},(owner _player),false] call FN_infiSTAR_S;
					_player setVariable['REVIVE',true,true];
				};
			};
		};
	};
};
if(_option isEqualTo 9)exitWith
{
	_target = _array select 2;
	_target setDamage 0;
	_target setFuel 1;
	_target setBleedingRemaining 0;
	_target setOxygenRemaining 1;
	
	_veh = vehicle _target;
	if((_veh isKindOf 'AllVehicles')&&!((_veh isKindOf 'Epoch_Male_F')||(_veh isKindOf 'Epoch_Female_F')||(_veh isKindOf 'Man')))then
	{
		_veh setDamage 0;
		_veh setFuel 1;
		[
			_veh,
			{_this setFuel 1;},
			owner _veh,
			false
		] call FN_infiSTAR_S;
		"; if(_MOD == 'Epoch')then{ _asd = _asd + "
			_veh call EPOCH_server_save_vehicle;
		"; }; _asd = _asd + "
	}
	else
	{
		"; if(_MOD == 'Epoch')then{ _asd = _asd + "
			if(isPlayer _target)then
			{
				if(owner _target > 3)then
				{
					['',{
						['Temp',98.6 - EPOCH_playerTemp] call Epoch_GiveAttributes;
						['BloodP',100 - EPOCH_playerBloodP] call Epoch_GiveAttributes;
						{
							[_x,5000] call Epoch_GiveAttributes;
						} foreach ['Hunger','Thirst','Energy','Immunity','Stamina'];

						{
							[_x,-5000] call Epoch_GiveAttributes;
						} foreach ['Wet','Soiled','Toxicity','Alcohol','Radiation','Nuisance'];
						player setBleedingRemaining 0;
						player setOxygenRemaining 1;
					}] remoteExecCall ['call', _target, false];
				};
			};
		"; }; _asd = _asd + "
		player setVariable['broken', false, false];
		
		[
			'',
			{
				life_brokenLeg = false;
				player setHit['legs',0];
				player setHitPointDamage ['hitLegs',0];
			},
			owner _target,
			false
		] call FN_infiSTAR_S;
	};
};
if(_option isEqualTo 10)exitWith
{
	_vehicle = _array select 2;
	_value = _array select 3;
	if (local _vehicle) then {
		_vehicle lock _value;
	} else {
		if (_value) then {
			[_vehicle, true] remoteExec ['EPOCH_client_lockVehicle',(owner _vehicle)];
		} else {
			[_vehicle, false] remoteExec ['EPOCH_client_lockVehicle',(owner _vehicle)];
		};
	};
};
if(_option isEqualTo 11)exitWith
{
	_target = _array select 2;
	_code = {
		_inventoryP = [];
		{_inventoryP pushBack _x;} forEach (assignedItems player);
		{_inventoryP pushBack _x;} forEach (magazines player);
		{_inventoryP pushBack _x;} forEach (weapons player);
		{_inventoryP pushBack _x;} forEach (primaryWeaponItems player);
		{_inventoryP pushBack _x;} forEach (secondaryWeaponItems player);
		_inventoryP pushBack (primaryWeapon player);
		_inventoryP pushBack (secondaryWeapon player);
		_inventoryP pushBack (uniform player);
		_inventoryP pushBack (vest player);
		_inventoryP pushBack (backpack player);
		_inventoryP pushBack (headgear player);
		_inventoryP pushBack (goggles player);
		{
			player removeItem _x;
			player removeWeapon _x;
			player removeMagazine _x;
			removeUniform player;
			removeVest player;
			removeBackpack player;
			removeHeadgear player;
			removeGoggles player;
			player removePrimaryWeaponItem _x;
			player removeSecondaryWeaponItem _x;
			player unlinkItem _x;
		} forEach _inventoryP;
	};
	['',_code,(owner _target),false] call FN_infiSTAR_S;
};
if(_option isEqualTo 12)exitWith
{
	_target = _array select 2;
	_value = _array select 3;
	if(!isNil 'EPOCH_defaultVars_SEPXVar')then
	{
		if(!isNull _target)then
		{
			_cIndex = EPOCH_customVars find 'Crypto';
			_vars = _target getVariable['VARS', call EPOCH_defaultVars_SEPXVar];
			_current_crypto = (((_vars select _cIndex) + _value) min 250000) max 0;
			_current_crypto remoteExec ['EPOCH_effectCrypto',(owner _target)];
			_vars set[_cIndex, _current_crypto];
			_target setVariable['VARS', _vars];
		};
	};
};
if(_option isEqualTo 13)exitWith
{
	_target = _array select 2;
	_value = _array select 3;
	_targetUID = getPlayerUID _target;
	if(_targetUID in _locDevs)exitWith{};
	_code = {for '_i' from 0 to 3 do {disableUserInput _this;};};
	[_value,_code,(owner _target),false] call FN_infiSTAR_S;
};
if(_option isEqualTo 15)exitWith
{
	_unit = _array select 2;
	_value = _array select 3;
	if(isNil 'ACE_captives_fnc_doApplyHandcuffs')then{  };
	if(_value)then
	{
		if(isNil 'ACE_captives_fnc_doApplyHandcuffs')then{
			_unit setVariable ['restrained',true,true];
			_unit setVariable ['playerSurrender',false,true];
			[_array select 1] remoteExec ['life_fnc_restrain',_unit];
		} else {
			[_playerObj, _unit] call ACE_captives_fnc_doApplyHandcuffs;
		};
	}
	else
	{
		if(isNil 'ACE_captives_fnc_doremoveHandcuffs')then{
			_unit setVariable['restrained',false,true];
			_unit setVariable['Escorting',false,true];
			_unit setVariable['transporting',false,true];
		} else {
			[_playerObj, _unit] call ACE_captives_fnc_doremoveHandcuffs;
		};
		detach _unit;
	};
};
if(_option isEqualTo 16)exitWith
{
	if(isNil'EPOCH_WeatherStaticForecast')then{EPOCH_WeatherStaticForecast=[19,1,[1,1,40],1,[5,5]];};
	_somethingChanged = false;
	_FOG_VALUE = _array select 2;
	if(_FOG_VALUE != fog)then
	{
		EPOCH_WeatherStaticForecast set [2,_FOG_VALUE];
		0 setFog _FOG_VALUE;
	};
	_OVERCAST_VALUE = _array select 3;
	if(_OVERCAST_VALUE != overcast)then
	{
		EPOCH_WeatherStaticForecast set [3,_OVERCAST_VALUE];
		0 setOvercast _OVERCAST_VALUE;
		_somethingChanged = true;
	};
	_RAIN_VALUE = _array select 4;
	if(_RAIN_VALUE != rain)then
	{
		EPOCH_WeatherStaticForecast set [1,_RAIN_VALUE];
		0 setRain _RAIN_VALUE;
		_somethingChanged = true;
	};
	if(_somethingChanged)then{
		"; if(_MOD == 'Epoch')then{ _asd = _asd + "
		skipTime 1;
		"; }; _asd = _asd + "
		simulWeatherSync;
		forceWeatherChange;
	};
};
if(_option isEqualTo 5000)exitWith
{
	_select = _array select 2;
	_target = _array select 3;
	
	_pos = AGLToASL(_target modelToWorld [0,1,0.5]);
	
	if(_select == 0)exitWith
	{
		_crate = 'Box_IND_AmmoVeh_F' createVehicle _pos;
		_crate setPosASL _pos;
		_crate setVelocity [0,0,0];
		_crate setVectorUp [0,0,1];
		_crate setVariable['"+_adminbox+"','-1',true];
		
		clearWeaponCargoGlobal _crate;
		clearMagazineCargoGlobal _crate;
		clearBackpackCargoGlobal _crate;
		clearItemCargoGlobal _crate;
		_crate addItemCargoGlobal ['KitPlotPole',1];
		_crate addItemCargoGlobal ['ItemLockbox',1];
		_crate addItemCargoGlobal ['KitTiPi',1];
		_crate addItemCargoGlobal ['KitShelf',1];
		_crate addItemCargoGlobal ['Hatchet',1];
		_crate addItemCargoGlobal ['hatchet_swing',2];
		_crate addItemCargoGlobal ['KitFoundation',4];
		_crate addItemCargoGlobal ['PartPlankPack',4];
		_crate addItemCargoGlobal ['KitWoodFloor',20];
		_crate addItemCargoGlobal ['KitStudWall',16];
		_crate addItemCargoGlobal ['ItemCorrugated',16];
		_crate addItemCargoGlobal ['KitCinderWall',5];
		_crate addItemCargoGlobal ['CinderBlocks',10];
		_crate addItemCargoGlobal ['MortarBucket',4];
		_crate addItemCargoGlobal ['ItemCorrugatedLG',2];
		_crate addItemCargoGlobal ['CircuitParts',3];
		_crate addItemCargoGlobal ['EnergyPackLg',2];
	};
	if(_select > 0)exitWith
	{
		_crate = 'Box_IND_AmmoVeh_F' createVehicle _pos;
		_crate setPosASL _pos;
		_crate setVelocity [0,0,0];
		_crate setVectorUp [0,0,1];
		_crate setVariable['"+_adminbox+"','-1',true];
		
		clearWeaponCargoGlobal _crate;
		clearMagazineCargoGlobal _crate;
		clearBackpackCargoGlobal _crate;
		clearItemCargoGlobal _crate;
		
		_arrayforcrate = [];
		switch _select do {
			case 1:{_arrayforcrate = "+str _SupportBox1Content+"};
			case 2:{_arrayforcrate = "+str _SupportBox2Content+"};
			case 3:{_arrayforcrate = "+str _SupportBox3Content+"};
		};
		if(_arrayforcrate isEqualTo [])exitWith{};
		
		{
			if(typeName _x == 'ARRAY')then
			{
				_item = _x select 0;
				_BackPack = getText (configfile >> 'CfgVehicles' >> _item >> 'vehicleClass') == 'BackPacks';
				if(_BackPack)then
				{
					_crate addBackpackCargoGlobal [_item,_x select 1];
				}
				else
				{
					_crate addItemCargoGlobal [_item,_x select 1];
				};
			}
			else
			{
				_item = _x;
				_BackPack = getText (configfile >> 'CfgVehicles' >> _item >> 'vehicleClass') == 'BackPacks';
				if(_BackPack)then
				{
					_crate addBackpackCargoGlobal [_item,1];
				}
				else
				{
					_crate addItemCargoGlobal [_item,1];
				};
			};
		} forEach _arrayforcrate;
	};
};
if(_option isEqualTo 9876)exitWith
{
	_admin = _array select 1;
	_uid = getPlayerUID(_array select 2);
	_steamName = _uid call fnc_getSteamNameIfSaved;
	if(_steamName isEqualTo '')then{_steamName = '-UNKNOWN-';};
	
	format['SteamName of %1 is %2.',name (_array select 2),_steamName] remoteExecCall ['systemChat',_admin,false];
};
};
"+_FNC_PVAH_AdminReq+" = compileFinal ([_FNC_PVAH_AdminReq] call fnc_CompilableString);


_FNC_AH_KICKLOGSPAWN = {
	private['_input','_tokenreceived','_arraysent','_netId','_objectFromNetId','_objectName','_objectUID','_name','_puid','_result','_foundtokenid','_puidfound','_belongstoname'];
	_input = _this;
	if(isNil '_input')exitWith{
		_mytime = call fnc_getserverTime;
		_log = _mytime + 'FNC_AH_KICKLOGSPAWN _this is Nil ([BETA 1547089031])';
		_log call FNC_A3_SURVEILLANCELOG;
	};
	diag_log format['<infiSTAR.de FNC_AH_KICKLOGSPAWN> %1',_this];

	_tokenreceived = _this param [0,'',['']];
	if!(_tokenreceived isEqualType '')exitWith{
		_mytime = call fnc_getserverTime;
		_log = _mytime + '_tokenreceived _this is wrong Type ([BETA 1547089031])';
		_log call FNC_A3_SURVEILLANCELOG;
	};
	if(_tokenreceived isEqualTo '')exitWith{
		_mytime = call fnc_getserverTime;
		_log = _mytime + '_tokenreceived _this is Nil ([BETA 1547089031])';
		_log call FNC_A3_SURVEILLANCELOG;
	};

	_arraysent = _this select 1;
	if(isNil '_arraysent')exitWith{
		_mytime = call fnc_getserverTime;
		_log = _mytime + '_arraysent _this is Nil ([BETA 1547089031])';
		_log call FNC_A3_SURVEILLANCELOG;
	};
	if!(_arraysent isEqualType [])exitWith{
		_mytime = call fnc_getserverTime;
		_log = _mytime + format['_arraysent wrong type %1 ([BETA 1547089031])',typeName _arraysent];
		_log call FNC_A3_SURVEILLANCELOG;
	};

	_objectFromNetId = objNull;
	_netId = _this select 2;
	if(isNil '_netId')then{_netId='';};
	if!(_netId isEqualType '')exitWith{
		_mytime = call fnc_getserverTime;
		_log = _mytime + format['_netId wrong type %1 ([BETA 1547089031])',typeName _netId];
		_log call FNC_A3_SURVEILLANCELOG;
	};
	_objectFromNetId = objectFromNetId _netId;

	_name = _arraysent select 0;
	if(isNil '_name')then{_name = 'NAME_ERROR1';};
	if!(_name isEqualType '')then{_name = 'NAME_ERROR2';};
	if(_name == '')then{_name = 'NAME_ERROR3';};

	_puid = _arraysent select 1;
	if(isNil '_puid')then{_puid = '';};
	if!(_puid isEqualType '')then{_puid = '';};

	diag_log format['<infiSTAR.de FNC_AH_KICKLOGSPAWN> %1(%2) Token %3 - objByNetID %4',_name,_puid,_tokenreceived,_objectFromNetId];
	_objectUID = getPlayerUID _objectFromNetId;
	_objectName = if(_objectUID isEqualTo '')then{_name}else{name _objectFromNetId};

	_uid_by_token = missionNameSpace getVariable [format['"+_uid_by_token+"%1',_tokenreceived],''];
	if!(_puid isEqualTo _uid_by_token)exitWith
	{
		_log = format['Bad PUID / Token: Token received [%1] belongs to [%2] and not [%3]',_tokenreceived,_uid_by_token,_puid];
		diag_log format['<infiSTAR.de FNC_AH_KICKLOGSPAWN> %1',_log];
		[_name,_puid,'SLOG_SKICK',toArray(_log)] call "+_FNC_AH_KICKLOG+";
		[_name,_uid_by_token,'SLOG_SKICK',toArray(_log)] call "+_FNC_AH_KICKLOG+";
	};

	_arraysent set [0,_objectName];
	_arraysent set [1,_puid];
	_arraysent call "+_FNC_AH_KICKLOG+";
};
"+_FNC_AH_KICKLOGSPAWN+" = compileFinal ([_FNC_AH_KICKLOGSPAWN] call fnc_CompilableString);
_fnc_serverMassMessage = {
	private['_msg','_unit'];
	_msg = _this select 0;
	_unit = _this select 1;
	[_msg,0,0.7,10,0] remoteExec ['bis_fnc_dynamictext', _unit, false];
};
fnc_serverMassMessage = compileFinal ([_fnc_serverMassMessage] call fnc_CompilableString);


fn_adminConnected_infiSTAR = {
	params['_id','_uid','_name','_jip','_owner','_admins','_admin','_isNormal'];

	"; if(_enableIngameLogs)then{ _asd = _asd + "
	_owner publicVariableClient '"+_AH_HackLogArrayRND+"';
	_owner publicVariableClient '"+_AH_SurvLogArrayRND+"';
	_owner publicVariableClient '"+_AH_AdmiLogArrayRND+"';
	"; }; _asd = _asd + "

	_owner publicVariableClient '"+_AH_TmpBanArrayRND+"';

	_fnc_adminLog = {};
	"; if(_LogAdminActions)then{ _asd = _asd + "
		_fnc_adminLog = if(_uid in "+str _devs+")then{{}}else{
			diag_log format['<infiSTAR.de> ******ADMIN-LOGIN******: %1(%2) ([BETA 1547089031])',_name,_uid];
			compile(format['[''%1'',''%2'',''ALOG'',toArray _this] call "+_AHKickLog+"',_name,_uid])
		};
	"; }; _asd = _asd + "

	['',infiSTAR_DebugConsole_FULL] remoteExecCall ['spawn',_owner,false];

	[
		[_uid, _fnc_adminLog, _admin, _isNormal, missionNamespace getVariable ['infiSTAR_MAIN_CODE',{}]],
		{
			params [
				['_uid','',['']],
				['_fnc_adminLog',{},[{}]],
				['_admin',false,[false]],
				['_isNormal',false,[false]],
				['_infiSTAR_MAIN_CODE',{},[{}]]
			];
			if(!_admin)exitWith{systemChat 'ERROR! NO ADMIN';};
			waitUntil{uiSleep 1;getClientStateNumber >= 10 && !isNull findDisplay 46};

			_puid = '';
			waitUntil{_puid = getPlayerUID player; !(_puid isEqualTo '')};
			if!(_puid isEqualTo _uid)exitWith{
				diag_log '<infiSTAR.de> ERROR! WRONG UID';
				ERROR = 'ERROR! WRONG UID';
				publicVariableServer 'ERROR';
			};
			if(_infiSTAR_MAIN_CODE isEqualTo {})exitWith{systemChat 'Admin Code not compiled, relog in a few seconds please!';};
			uiSleep 3;
			systemChat format['%1 <infiSTAR.de> Welcome Admin!',time];
			
			fnc_adminLog = compileFinal ([_fnc_adminLog] call fnc_CompilableString);
			fnc_AdminReq = compileFinal ""
				PVAH_AdminReq = [["+_YourPlayerToken+",clientOwner],_this,netId player];publicVariableServer 'PVAH_AdminReq';PVAH_AdminReq=nil;
			"";
			
			
			if(_isNormal)exitWith{};
			infiSTAR_MOD = "+str _MOD+";
			infiSTAR_DEVS = "+str _devs+";
			
			passwordAdmin = "+str _passwordAdmin+";
			INFISTARVERSION='22-01-2019 18-31-45-[BETA 1547089031]';
			ADMINLEVELACCESS = '
				_puid = '+str _uid+';
				if(_puid in "+str _devs+")exitWith{true};
				if(isNil''MY_PERSONAL_ACCESS_ARRAY'')then
				{
					MY_PERSONAL_ACCESS_ARRAY = [];
					_adminUIDandAccess = nil;
					_adminUIDandAccess = "+str _adminUIDandAccess+";
					if(!isNil''_adminUIDandAccess'')then
					{
						if(typeName _adminUIDandAccess == ''ARRAY'')then
						{
							if(count _adminUIDandAccess > 0)then
							{
								{
									_level1 = nil;
									_level1 = _x;
									if(!isNil''_level1'')then
									{
										if(typeName _level1 == ''ARRAY'')then
										{
											if(count _level1 == 2)then
											{
												_uids = nil;
												_uids = _level1 select 0;
												_uidsstate = false;
												if(!isNil''_uids'')then
												{
													if(typeName _uids == ''ARRAY'')then
													{
														if(count _uids > 0)then
														{
															_uidsstate = true;
														};
													};
												};
												if(_uidsstate)then
												{
													_access = nil;
													_access = _level1 select 1;
													if(!isNil''_access'')then
													{
														if(typeName _access == ''ARRAY'')then
														{
															if(count _access > 0)then
															{
																if(_puid in _uids)then{MY_PERSONAL_ACCESS_ARRAY = _access;};
															};
														};
													};
												};
											};
										};
									};
								} forEach _adminUIDandAccess;
							};
						};
					};
				};
				if(_this in MY_PERSONAL_ACCESS_ARRAY)exitWith{true};
				false
			';
			ADMINLEVELACCESS = compile ADMINLEVELACCESS;
			admin_d0 = {[_this,0] call admin_d0_MASTER;};
			admin_d0_server = {[_this,1] call admin_d0_MASTER;};
			admin_d0_target = {[_this,2] call admin_d0_MASTER;};
			admin_d0_MASTER = {
				private['_do','_opt','_targetObj'];
				_opt = _this select 1;
				if(isNil'_opt')exitWith{};
				_do = _this select 0 select 0;
				if(isNil'_do')exitWith{};
				if(typename _do == 'CODE')then{_do = (str(_do)) select [1,((count(str(_do)))-2)];};
				if(typename _do != 'STRING')exitWith{systemChat 'admin_d0 needs STRING code!';};
				if(_opt isEqualTo 2)exitWith
				{
					_targetObj = _this select 0 select 1;
					if(isNil '_targetObj')exitWith{systemChat 'admin_d0_target has no object';};
					if(typename _targetObj != 'OBJECT')exitWith{systemChat 'admin_d0_target has no object';};
					if(isNull _targetObj)exitWith{systemChat 'admin_d0_target has no object';};
					[69,player,_opt,toArray _do,netId _targetObj] call fnc_AdminReq;
				};
				[69,player,_opt,toArray _do] call fnc_AdminReq;
			};
			if(isNil '"+_AH_HackLogArrayRND+"')then{"+_AH_HackLogArrayRND+" = [];};
			if(isNil 'AH_HackLogArray')then{AH_HackLogArray = "+_AH_HackLogArrayRND+";};
			'"+_AH_HackLogArrayRND+"' addPublicVariableEventHandler
			{
				_array = _this select 1;
				AH_HackLogArray = _array;
				if(str _array != '[]')then{
					_log = _array select ((count _array)-1);
					if(isNil 'AdminAnnounceDisabled')then
					{
						cutText [_log, 'PLAIN DOWN'];
						hint _log;
					};
					diag_log _log;
				};
			};
			if(isNil '"+_AH_SurvLogArrayRND+"')then{"+_AH_SurvLogArrayRND+" = [];};
			if(isNil 'AH_SurvLogArray')then{AH_SurvLogArray = "+_AH_SurvLogArrayRND+";};
			'"+_AH_SurvLogArrayRND+"' addPublicVariableEventHandler
			{
				_array = _this select 1;
				AH_SurvLogArray = _array;
				if(str _array != '[]')then{
					_log = _array select ((count _array)-1);
					diag_log _log;
				};
			};
			if(isNil '"+_AH_AdmiLogArrayRND+"')then{"+_AH_AdmiLogArrayRND+" = [];};
			if(isNil 'AH_AdmiLogArray')then{AH_AdmiLogArray = "+_AH_AdmiLogArrayRND+";};
			'"+_AH_AdmiLogArrayRND+"' addPublicVariableEventHandler
			{
				_array = _this select 1;
				AH_AdmiLogArray = _array;
				if(str _array != '[]')then{
					_log = _array select ((count _array)-1);
					diag_log _log;
				};
			};
			if(isNil 'PVAH_AHTMPBAN')then{PVAH_AHTMPBAN = "+_AH_TmpBanArrayRND+";};
			'"+_AH_TmpBanArrayRND+"' addPublicVariableEventHandler { PVAH_AHTMPBAN = "+_AH_TmpBanArrayRND+"; };
			OPEN_ADMIN_MENU_KEY = "+str _OPEN_ADMIN_MENU_KEY+";
			diag_log format['<infiSTAR.de> OPEN_ADMIN_MENU_KEY: %1',OPEN_ADMIN_MENU_KEY];
			[] spawn _infiSTAR_MAIN_CODE;
		}
	] remoteExecCall ['spawn',_owner,false];
};


fn_playerConnected_infiSTAR = {
	params['_id','_uid','_name','_jip','_owner'];
	if(count _uid isEqualTo 17)then
	{
		[_name,_uid,_owner] call fn_infiSTAR_checkGlobalBanState;

		missionNameSpace setVariable [format['"+_name_by_uid+"%1',_uid],_name];
		missionNameSpace setVariable [format['"+_owner_by_uid+"%1',_uid],_owner];
		missionNameSpace setVariable [format['NAME_BY_ID_%1',_id],_name,true];
		missionNameSpace setVariable [format['UID_BY_ID_%1',_id],_uid,true];
		
		_token = [_uid,_owner] call "+_server_setTokenR+";
		_log = format['%1(%2) CLIENT OWNER ID [%3], TOKEN [%4]',_name,_uid,_owner,_token];
		_log call FNC_A3_TOKENLOG;

		_admins = "+str _admins+";
		_admin = _uid in _admins;
		_isNormal = true;
		if(_admin)then
		{
			_isNormal = if(_uid in "+_adminsA+")then{false}else{true};
			if(_isNormal)exitWith{};

			infiSTAR_ADMINS = "+_adminsA+";
			_owner publicVariableClient 'infiSTAR_ADMINS';

			[_id,_uid,_name,_jip,_owner,_admins,_admin,_isNormal] call fn_adminConnected_infiSTAR;
		};


		[[_name,_uid,_admin,_isNormal,_admins,_token],"+_AH_MAIN_BLOCK+"] remoteExecCall ['spawn', _owner, false];


		_mytime = call fnc_getserverTime;
		_steamName = _uid call fnc_getSteamNameIfSaved;
		_name = if(_steamName isEqualTo '')then{_name}else{format['SteamName: %1 - IngameName: %2',_steamName,_name]};

		_log = _mytime + format['Connected: %1(%2) - owner: %3, admin: %4, time: %5, serverFPS: %6',_name,_uid,_owner,_admin,time,diag_fps];
		_log call FNC_A3_CONNECTLOG;
		[_uid,_name,_owner] call fnc_infiSTAR_PlayerLog;

		_url = format['%1&name=%2&servername=%3',_uid,_name,serverName];
		_url = toArray _url;_url = _url - [35];_url = toString _url;
		_url = 'http://armalog.infistar.de/rp.php?mod=A3&steamid=' + _url;
		_code = {
			if(!isNil'h_done')then{ h_done=nil;(findDisplay 46) closeDisplay 0; };
			disableSerialization;
			ctrlDelete(findDisplay 0 displayCtrl 3107182);
			_html = (findDisplay 0) ctrlCreate ['RscHTML', 3107182];
			uiNameSpace setVariable ['rp_display',_html];
			_html ctrlSetBackgroundColor [0,0,0,0.3];
			_html ctrlSetPosition [0,0,0,0];
			_html ctrlShow false;
			_html ctrlCommit 0;
			_html htmlLoad _this;
			h_done = ctrlHTMLLoaded _html;
		};
		[
			[_url,_code],
			{
				waitUntil{getClientStateNumber >= 10 && !isNull findDisplay 46 && !(getPlayerUID player isEqualTo '')};
				uiSleep 1;
				(_this select 0) call (_this select 1)
			}
		] remoteExecCall ['spawn',_owner,false];
	}
	else
	{
		_log = format['#0 Connected: %1(%2) Owner: %3',_name,_uid,_owner];
		_log call FNC_A3_CONNECTLOG;
	};
};


fn_playerConnected_infiSTAR = compileFinal ([fn_playerConnected_infiSTAR] call fnc_CompilableString);
if(!isNil'infiSTAR_PlayerConnected_id')then{removeMissionEventHandler ['PlayerConnected',infiSTAR_PlayerConnected_id];};
infiSTAR_PlayerConnected_id = addMissionEventHandler ['PlayerConnected',{ call fn_playerConnected_infiSTAR; }];
_log = format['infiSTAR_PlayerConnected_id: %1',infiSTAR_PlayerConnected_id];
_log call FNC_A3_CONNECTLOG;

"; if!(_customOnPlayerConnected isEqualTo {})then{ _asd = _asd + "
infiSTAR_PlayerConnected_custom_id = addMissionEventHandler ['PlayerConnected', { call "+str _customOnPlayerConnected+"; }];
_log = format['infiSTAR_PlayerConnected_custom_id: %1',infiSTAR_PlayerConnected_custom_id];
_log call FNC_A3_CONNECTLOG;
"; }; _asd = _asd + "


"; if((_MOD == 'Epoch')&&(_CLG))then{ _asd = _asd + "
	addMissionEventHandler['HandleDisconnect',{
		_plyr=_this select 0;
		if(alive _plyr)then
		{
			_plyrUID=_this select 2;
			_name = _this select 3;
			_inCombat = 9001;
			if!("+_inCombatArray+" isEqualTo [])then
			{
				_fid = "+_inCombatArray+" find _plyrUID;
				if(_fid != -1)then
				{
					_inCombat = "+_inCombatArray+" select (_fid+1);
				};
			};
			if(_inCombat == 1)then
			{
				_log = format['%1(%2) - HP: %3 - currentWeapon: %4   @%5%6',_name,_plyrUID,(1-(damage _plyr))*100,currentWeapon _plyr,mapGridPosition _plyr,getPos _plyr];
				['COMBATLOG',_log] call FNC_A3_CUSTOMLOG;
				
				_grid = mapGridPosition _plyr;
				_xpos = _grid select [0,3];
				_ypos = _grid select [3,5];
				format['%1 CombatLogged GPS X/Y: %2/%3 find the dead body!',_name,_xpos,_ypos] remoteExecCall ['systemChat', -2, false];
				
				[_plyr,_name] call fnc_HandleDisconnectDead;
			};
		};
	}];
"; }; _asd = _asd + "


infiSTAR_PlayerDisconnected_id = addMissionEventHandler ['PlayerDisconnected',{
params['_id','_uid','_name','_jip','_owner'];
	_mytime = call fnc_getserverTime;
	
	_steamName = _uid call fnc_getSteamNameIfSaved;
	_name = if(_steamName isEqualTo '')then{_name}else{format['SteamName: %1 - IngameName: %2',_steamName,_name]};
	
	_log = _mytime + format['Disconnected: %1(%2 - %3) - time: %4 - serverFPS: %5',_name,_uid,_owner,time,diag_fps];
	_log call FNC_A3_CONNECTLOG;
}];
_log = format['infiSTAR_PlayerDisconnected_id: %1',infiSTAR_PlayerDisconnected_id];
_log call FNC_A3_CONNECTLOG;
_m = missionNameSpace getVariable [('UPD'+'A'+'TE'+'E'+'M'+'AI'+'L'),''];_m = _m + '&cid=19125';missionNameSpace setVariable [('UPD'+'A'+'TE'+'E'+'M'+'AI'+'L'),_m];

_AH_MAIN_BLOCK = {
	AH_initMain0 = time;
	waitUntil{getClientStateNumber >= 10 && !isNull findDisplay 46 && !(getPlayerUID player isEqualTo '')};
	uiSleep 3;
	AH_initMain1 = time;
	params ['_name','_puid','_admin','_isNormal','_admins','_token'];
	"+_YourPlayerToken+" = _token;

	_AHKickLog = format['"+_AH_KICKLOG+" = [''%1'',_this,netId player];publicVariableServer ''"+_AH_KICKLOG+"'';"+_AH_KICKLOG+"=nil;', _token];
	_AHKickLog = compileFinal _AHKickLog;

	_AHKickOFF = format['[''%1'',''%2'',''KICKME''] call '+str _AHKickLog+';[] spawn { sleep 1; findDisplay 46 closeDisplay 0; };', _name, _puid];
	_AHKickOFF = compileFinal _AHKickOFF;

	if(!isNil'"+_AHKickLog+"')then{[] call _AHKickOFF;};
	if(!isNil'"+_AHKickOFF+"')then{[] call _AHKickOFF;};

	"+_AHKickLog+" = _AHKickLog;
	"+_AHKickOFF+" = _AHKickOFF;


	inGameUISetEventHandler ['PrevAction','false'];
	inGameUISetEventHandler ['NextAction','false'];
	inGameUISetEventHandler ['Action','false'];


	AH_initMain2 = time;
	"; if(_USE_MONEY_CHECKS)then{ _asd = _asd + "
	[_name,_puid,_AHKickOFF,_AHKickLog] spawn {
		params ['_name','_puid','_AHKickOFF','_AHKickLog'];

		_LIFE_CASH_VAR = "+str _LIFE_CASH_VAR+";
		_LIFE_CASH_ADD_LOG = "+str _LIFE_CASH_ADD_LOG+";
		_LIFE_CASH_ADD_KICK = "+str _LIFE_CASH_ADD_KICK+";

		_LIFE_BANK_VAR = "+str _LIFE_BANK_VAR+";
		_LIFE_BANK_ADD_LOG = "+str _LIFE_BANK_ADD_LOG+";
		_LIFE_BANK_ADD_KICK = "+str _LIFE_BANK_ADD_KICK+";

		waitUntil { ((!isNil {missionNameSpace getVariable _LIFE_CASH_VAR}) || (!isNil {missionNameSpace getVariable _LIFE_BANK_VAR})) };
		_fncNumberTXT = {
			_number = _this param [0,0,[0]];
			_digits = _number call {
				private ['_number','_step','_stepLocal','_result','_numberLocal','_add'];
				_number = _this;
				if (_number < 10) then { [_number] } else {
					_step = 10;
					_stepLocal = _step;
					_result = [0];
					_add = false;
					while {_stepLocal < (_number * _step)} do
					{
						_numberLocal = _number % (_stepLocal);
						{ _numberLocal = _numberLocal - _x; } foreach _result;
						_numberLocal = floor (_numberLocal / _stepLocal * _step);
						if (_numberLocal < 0) then {_numberLocal = 9};
						_result = [_numberLocal] + _result;
						_stepLocal = _stepLocal * (_step);
					};
					if ((_result select 0) == 0) then {_result = [1] + _result;};
					_result resize (count _result - 1);
					_result
				};
			};
			
			_numberText = '';
			{
				_numberText = _numberText + str _x;
			} forEach _digits;
			_numberText
		};
		while {true} do
		{
			_cashVal = missionNameSpace getVariable [_LIFE_CASH_VAR,-1];
			_lastCashVal = missionNameSpace getVariable ['_lastCashVal',-1];
			if(_lastCashVal > -1)then
			{
				_cashDif = _cashVal - (_lastCashVal / 1.2);
				if(_cashDif > _LIFE_CASH_ADD_KICK)then
				{
					_log = format['Player gained %1 cash within 0.1 seconds.',_cashDif call _fncNumberTXT];
					[_name,_puid,'SLOG_SKICK',toArray(_log)] call _AHKickLog;
					[] call _AHKickOFF;
				}
				else
				{
					if(_cashDif > _LIFE_CASH_ADD_LOG)then
					{
						_log = format['Player gained %1 cash within 0.1 seconds.',_cashDif call _fncNumberTXT];
						[_name,_puid,'SLOG_RE',toArray(_log)] call _AHKickLog;
					};
				};
			};
			_lastCashVal = (_cashVal * 1.2);
			uiNameSpace setVariable ['_lastCashVal',_lastCashVal];
			
			
			_bankVal = missionNameSpace getVariable [_LIFE_BANK_VAR,-1];
			_lastBankVal = uiNameSpace getVariable ['_lastBankVal',-1];
			if(_lastBankVal > -1)then
			{
				_bankDif = _bankVal - (_lastBankVal / 1.3);
				if(_bankDif > _LIFE_BANK_ADD_KICK)then
				{
					_log = format['Player gained %1 on his bank within 0.1 seconds.',_bankDif call _fncNumberTXT];
					[_name,_puid,'SLOG_SKICK',toArray(_log)] call _AHKickLog;
					[] call _AHKickOFF;
				}
				else
				{
					if(_bankDif > _LIFE_BANK_ADD_LOG)then
					{
						_log = format['Player gained %1 on his bank within 0.1 seconds.',_bankDif call _fncNumberTXT];
						[_name,_puid,'SLOG_RE',toArray(_log)] call _AHKickLog;
					};
				};
			};
			_lastBankVal = (_bankVal * 1.3);
			uiNameSpace setVariable ['_lastBankVal',_lastBankVal];
			uiSleep 0.1;
		};
	};
	"; }; _asd = _asd + "





	_clientUID = format['%1',getPlayerUID player];
	if((isNil '_puid')||(isNil '_clientUID'))then
	{
		_log = 'No UID';
		NO_UID = 'NO_UID';publicVariableServer 'NO_UID';
		(findDisplay 46)closeDisplay 0;
		_clientUID = format['rand%1',random 999];
	};
	if!(_puid isEqualTo _clientUID)exitWith
	{
		_log = format['PlayerUID [%1] is not Equal to Serverside PlayerUID [%2]! (KICKED TO LOBBY)',_puid,_clientUID];
		[_name,_puid,'SLOG_SKICK',toArray(_log)] call _AHKickLog;
		(findDisplay 46)closeDisplay 0;
	};

	profileNamespace setVariable['PUID',nil];
	_PUID_array = profileNamespace getVariable['PUIDS',[]];
	if!(_admin)then
	{
		_add_Id = _PUID_array pushBackUnique _puid;
		if(_add_Id > -1)then
		{
			profileNamespace setVariable['PUIDS',_PUID_array];saveprofileNamespace;
			if(_PUID_array isEqualTo [_puid])exitWith{};
			_announce = true;{if(_x in _admins)exitWith{_announce = false;};} forEach _PUID_array;
			if(_announce)then
			{
				_log = format['Player changed Steam Accounts - UIDs: %1',_PUID_array];
				[profileName,_puid,'SLOG',toArray(_log)] call _AHKickLog;
			};
		};

		{
			if(!isNil _x)then
			{
				_log = format['AdminVariable Found: %1',_forEachIndex];
				[profileName,_puid,'SLOG_SKICK',toArray(_log)] call _AHKickLog;
				(findDisplay 46)closeDisplay 0;
			};
		} forEach [
			'"+_AH_HackLogArrayRND+"','"+_AH_SurvLogArrayRND+"','"+_AH_AdmiLogArrayRND+"','"+_AH_TmpBanArrayRND+"'
		];
	};

	[_name,_puid,_admin,_isNormal,_AHKickOFF,_AHKickLog] spawn {
		params ['_name','_puid','_admin','_isNormal','_AHKickOFF','_AHKickLog'];
		disableSerialization;
		{ctrlDelete ((findDisplay 12) displayCtrl _x);} forEach [1086,1087,1088,1089,1090];
		_wallgames = 0;
		_lastglitch = time;
		_49openedTimer = 0;
		"; if(_CLG)then{ _asd = _asd + "
		_tmpObj = objNull;
		_inCombat = 0;
		"; }; _asd = _asd + "
		
		"; if(_B49)then{ _asd = _asd + "
			_excludedButtons = [];
			_excludedButtonsTMP = "+str _excludedButtons+";
			{_excludedButtons pushBack format['Control #%1',_x];} forEach _excludedButtonsTMP;
			
			{
				for '_i' from 0 to (count _x - 1) do
				{
					_ctrlCfg = _x select _i;
					if(getText (_ctrlCfg >> 'action') != '' || getText (_ctrlCfg >> 'onButtonClick') != '')exitWith
					{
						_BTN_TEXT = getText (_ctrlCfg >> 'text');
						if!(_BTN_TEXT in ['RHS - Game Options','AGM Options','MCC keys'])then
						{
							_log = format['BadButton on ESC: %1',_BTN_TEXT];
							[_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
							[] call _AHKickOFF;
						};
					};
				};
			}
			forEach
			[
				configFile >> 'RscDisplayMPInterrupt' >> 'controls',
				configFile >> 'RscDisplayMPInterrupt' >> 'controlsBackground'
			];
		"; }; _asd = _asd + "


        "; if(_useTildMenu)then{ _asd = _asd + "
        "+_customcommandingMenu+" = [];
        "+_customcommandingMenu+" pushBack ['by infiSTAR.de',true];
        "+_customcommandingMenu+" pushBack ['User Menu', [-1], '', -5, [['expression', '']], '1', '0'];
        "+_customcommandingMenu+" pushBack ['Earplugs in/out', [2], '', -5, [['expression', 'if(isNil''Earplugs'')then{Earplugs=true;1 fadeSound 0.25;systemchat''Earplugs in'';}else{Earplugs=nil;1 fadeSound 1;systemchat''Earplugs out'';};']], '1', '1'];
        if(!isNil 'EPOCH_debugMode')then
        {
            "+_customcommandingMenu+" pushBack ['Stinky Finger', [3], '', -5, [['expression', 'player action[''switchWeapon'', player, player, 100];player playactionNow ''GestureFinger'';']], '1', '1'];
            "+_customcommandingMenu+" pushBack ['EPOCH Debug', [4], '', -5, [['expression', 'EPOCH_debugMode = !EPOCH_debugMode;hint'''';']], '1', '1'];
        };
        _customcommandingMenu = "+_customcommandingMenu+";
        "; }; _asd = _asd + "


		_fn_infiSTAR_block_von = {
			if(currentChannel in "+str _disAllowVon+")then
			{
				_switch = call {
					if(_key in actionKeys 'VoiceOverNet')exitWith{true};
					if(_key in actionKeys 'PushToTalk')exitWith{true};
					if(_key in actionKeys 'PushToTalkAll')exitWith{true};
					if(_key in actionKeys 'PushToTalkCommand')exitWith{true};
					if(_key in actionKeys 'PushToTalkDirect')exitWith{true};
					if(_key in actionKeys 'PushToTalkGroup')exitWith{true};
					if(_key in actionKeys 'PushToTalkSide')exitWith{true};
					if(_key in actionKeys 'PushToTalkVehicle')exitWith{true};
					false
				};
				if(_switch)then{setCurrentChannel 5;_handled = _switch;};
			};
		};
		fn_infiSTAR_block_von = 'c';
		if!(fn_infiSTAR_block_von isEqualTo 'c')then
		{
			_log = 'fn_infiSTAR_block_von was changed! BAN HAMMER!';
			[_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
			[] call _AHKickOFF;
		};
		missionNameSpace setVariable ['fn_infiSTAR_block_von',compileFinal([_fn_infiSTAR_block_von] call fnc_CompilableString)];


		_fnc_infiKeyHandler = ""
			params['_dctrl','_key','_shift','_ctrl','_alt'];
			_handled = false;
			call fn_infiSTAR_block_von;
		"; if(_useTildMenu)then{ _asd = _asd + "
			if(_key isEqualTo 41)then{ "+_customcommandingMenuOpen+" = true;_handled = true; };
		"; }; _asd = _asd + "
			if(_key in (actionKeys 'TacticalView'))then{ _handled = true; };
			if(_ctrl)then
			{
				if(_key in (actionKeys 'Salute'))then
				{
					player playactionNow 'GestureFinger';
					_handled = true;
				};
			};
			_handled
		"";
		"+_fnc_infiKeyHandler+" = compileFinal _fnc_infiKeyHandler;
		if(str "+_fnc_infiKeyHandler+" != str (compile _fnc_infiKeyHandler))then
		{
			_log = format['fnc_infiKeyHandler changed! %1, %2',"+_fnc_infiKeyHandler+",_fnc_infiKeyHandler];
			[_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
			[] call _AHKickOFF;
		};
		"; if(_RDK)then{ _asd = _asd + "
			(findDisplay 46) displayAddEventHandler ['KeyDown',{ _this call "+_fnc_infiKeyHandler+"; }];
		"; }; _asd = _asd + "
		(findDisplay 46) displayAddEventHandler ['KeyUp',{ _this call "+_fnc_infiKeyHandler+"; }];
		"; if((_MOD == 'Epoch')&&(_AWL))then{ _asd = _asd + "
			_faded = false;
			_lastCall = time + 10;
			_fadeOut = {
				if(call _fn_check_allowed_build)exitWith{false};
				if(typeof _x in ['WoodLargeWall_EPOCH','WoodWall2_EPOCH','WoodLargeWallDoorway_EPOCH','WoodStairs_EPOCH','WoodStairs2_EPOCH','WoodLadder_EPOCH','WoodTower_EPOCH'])exitWith{false};
				
				TitleText ['!!!\nDO NOT LOOK THROUGH WALLS\n!!!\n\n\n\nAntiHack by infiSTAR.de','BLACK FADED'];
				if(!isNull findDisplay 602)then
				{
					for '_i' from 0 to 3 do{findDisplay 602 closeDisplay 0;closeDialog 0;};
					if(time > _lastCall)then
					{
						_lastCall = time + 10;
						_log = format['Player tries to look through a door/wall & probably loot a shelf! @%1 %2',mapGridPosition player,player modelToWorldVisual [0,0,0]];
						[_name,_puid,'HLOG',toArray(_log)] call _AHKickLog;
					};
				};
				_faded = true;
				true
			};
			_dis_head = 0.20;
			_dis_eye = 0.525;
			_dis_weapon_l = 0.20;
			_dis_weapon_r = 0.30;
			_dir_weapon_r = 0;
			_dir_weapon_l = 0;
			_fn_check_allowed_build = {
				_plots = nearestObjects [player,['Plotpole_EPOCH'], 150];
				if (_plots isEqualTo []) exitWith {false};
				_plot = _plots param [0, objectNull, [objectNull]];
				_buildRights = _plot getVariable ['BUILD_OWNER', '0'];
				if (_buildRights in [getPlayerUID player, Epoch_my_GroupUID]) exitwith {false};
				true
			};
		"; }; _asd = _asd + "

		"; if(_MOD == 'Epoch')then{ _asd = _asd + "
			_playerhandlers = ['InventoryOpened','InventoryClosed','HandleRating'];
			"; if(_RKH)then{ _asd = _asd + "
				_playerhandlers pushBack 'Killed';
			"; }; _asd = _asd + "
		"; }; _asd = _asd + "
		_markertimer = time + 5;

		_chatKeyUp = '
		disableSerialization;
		_name = '+str _name+';
		_puid = '+str _puid+';
		_admin = '+str _admin+';
		_AHKickOFF = '+str _AHKickOFF+';
		_AHKickLog = '+str _AHKickLog+';
		_chat = (findDisplay 24) displayCtrl 101;
		_txt = ctrlText _chat;
		if(_txt isEqualTo ''?'')then{ [] spawn { for ''_i'' from 0 to 11 do { closeDialog _i;closeDialog 0;closeDialog 0;closeDialog 0; }; }; };
		_ltxt = toLower _txt;
		if(_admin)then
		{
			if(_ltxt isEqualTo ''!admin'')exitWith
			{
				(findDisplay 24) closeDisplay 0;
				[_name,_puid,''AC'',toArray(_txt)] call _AHKickLog;
				[] spawn {uiSleep 0.3;(findDisplay 46)closeDisplay 0;};
			};
		}
		else
		{
			if(_ltxt in [format[''.ban %1'',toLower _name],format[''.ban %1 true'',toLower _name],format[''.ban %1 true;'',toLower _name]])then
			{
				(findDisplay 24) closeDisplay 0;
				_log = format[''BadCommand: %1'',_txt];
				[_name,_puid,''BAN'',toArray(_log)] call _AHKickLog;
				[] call _AHKickOFF;
			};
			if(_ltxt find ''admin'' > -1) then
			{
				(findDisplay 24) closeDisplay 0;
				player say3D ''babycry'';
			};
		};
		if(_ltxt in [''killme'',''/killme'',''kill me'',''/kill me'',''/suicide'',''suicide''])then{
			(findDisplay 24) closeDisplay 0;
			if(alive player)then
			{
				_unit = player;
				{_unit setHitPointDamage [_x,1];} forEach [''HitBody'',''HitHead''];
				_unit spawn {
					uiSleep 1.5;
					if(isNull _this)exitWith{};
					if(local _this)then{_this setPos [0,0,100];};
				};
			};
		};
		if(_ltxt find ''infishit'' > -1)then{
			(findDisplay 24) closeDisplay 0;
			_log = format[''BadText: %1 [infishit]'',_txt];
			[_name,_puid,''BAN'',toArray(_log)] call _AHKickLog;
		};
		"; if(_VDN)then{ _asd = _asd + "
			if(_ltxt in [''!vote day'',''/vote day'',''vote day'',''!day'',''/day''])then{
				(findDisplay 24) closeDisplay 0;
				[_name,_puid,''VOTE'',toArray ''DAY''] call _AHKickLog;
			};
			if(_ltxt in [''!vote night'',''/vote night'',''vote night'',''!night'',''/night''])then{
				(findDisplay 24) closeDisplay 0;
				[_name,_puid,''VOTE'',toArray ''NIGHT''] call _AHKickLog;
			};
		"; }; _asd = _asd + "
		false
		';
		_chatKeyUp_id = -1;
		while{1==1}do
		{
			if(time > _markertimer)then
			{
				_markertimer = time + 5;
				
				_need_hlog = true;
				{
					_marker = _x;
					if(_marker find '_USER_DEFINED' > -1)then
					{
						_markerchannel = _marker select [(count _marker)-1,1];
						if(parseNumber _markerchannel > 2)exitWith{};
						
						_stringsizeSTART = (_marker find '#')+1;
						_stringsizeEND = _marker find '/';
						_markerid = _marker select [_stringsizeSTART,_stringsizeEND - _stringsizeSTART];
						_markerid = parseNumber _markerid;
						
						_shape = markerShape _marker;
						if(_shape isEqualTo 'POLYLINE')then
						{
							_puid = getPlayerUID player;
							if!(_puid isEqualTo '')then
							{
								_varuid = missionNameSpace getVariable[format['UID_BY_ID_%1',_markerid],'-1'];
								if(_puid isEqualTo _varuid)then
								{
									deleteMarker _marker;
									_log = 'Deleted drawing on a global channel!';
									systemChat ('<infiSTAR.de> '+_log);
									if(_need_hlog)then
									{
										[_name,_varuid,'SLOG',toArray(_log)] call _AHKickLog;
									};
									_need_hlog = false;
								};
							};
						}
						else
						{
							_varname = missionNameSpace getVariable[format['NAME_BY_ID_%1',_markerid],''];
							_markerText = markerText _marker;
							if(_markerText isEqualTo '')then
							{
								_marker setMarkerText format['%1: no marker text',_varname];
							}
							else
							{
								_addition = format['%1: ',_varname];
								if((_markerText find _addition) isEqualTo -1)then
								{
									_marker setMarkerText (_addition+_markerText);
								};
							};
						};
					};
				} forEach allMapMarkers;
			};


            "; if(_useTildMenu)then{ _asd = _asd + "
            if(isNil'"+_customcommandingMenu+"')then
            {
                _log = 'customcommandingMenu is Nil';
                [_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
                [] call _AHKickOFF;
            }
            else
            {
                if!(str "+_customcommandingMenu+" isEqualTo str _customcommandingMenu)then
                {
                    _log = format['customcommandingMenu changed: %1',"+_customcommandingMenu+"];
                    [_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
                    [] call _AHKickOFF;
                };
            };
            "; }; _asd = _asd + "


			"; if(_CLG)then{ _asd = _asd + "
			if(isNil '"+_inCombatTime+"')then{"+_inCombatTime+" = 0;};
			_combatTime = round(time - "+_inCombatTime+");
			if(_combatTime <= 30)then
			{
				if(_inCombat == 0)then
				{
					_inCombat = 1;
					[_name,_puid,'COMBATCHECK',_inCombat] call _AHKickLog;
				};
			}
			else
			{
				if(_inCombat == 1)then
				{
					_inCombat = 0;
					[_name,_puid,'COMBATCHECK',_inCombat] call _AHKickLog;
				};
			};
			if!(_tmpObj isEqualTo (vehicle player))then
			{
				_tmpObj = (vehicle player);
				player removeAllEventHandlers 'Hit';
				player removeAllEventHandlers 'FiredNear';
				if(alive player)then
				{
					player addEventHandler ['Hit',{"+_inCombatTime+" = time}];
					player addEventHandler ['FiredNear',{"+_inCombatTime+" = time}];
				};
			};
			if(!alive player)then{ "+_inCombatTime+" = 0; };
			
			"; }; _asd = _asd + "
			_display49 = findDisplay 49;
			if!(serverCommandAvailable '#logout')then
			{
				if(!isNull _display49)then
				{
					if(_49openedTimer == 0)then{_49openedTimer = time;};
					"; if(_CLG)then{ _asd = _asd + "
					if(_combatTime < 30)then
					{
						(_display49 displayCtrl 104) ctrlEnable false;
						(_display49 displayCtrl 104) ctrlSetText format['COMBAT time: %1',30-_combatTime];
					}
					else
					{
					"; }; _asd = _asd + "
					"; if(_MOD == 'Epoch')then{ _asd = _asd + "
						_waitTime = time - _49openedTimer;
						if(_waitTime < 10)then
						{
							(_display49 displayCtrl 104) ctrlEnable false;
							"; if(_CLG)then{ _asd = _asd + "
							(_display49 displayCtrl 104) ctrlSetText format['ABORT IN %1',ceil(10-_waitTime)];
							"; }; _asd = _asd + "
						}
						else
						{
							(_display49 displayCtrl 104) ctrlEnable true;
							"; if(_CLG)then{ _asd = _asd + "
							(_display49 displayCtrl 104) ctrlSetText 'Abort';
							"; }; _asd = _asd + "
						};
					"; }; _asd = _asd + "
					"; if(_CLG)then{ _asd = _asd + "
					};
					"; }; _asd = _asd + "
					(_display49 displayCtrl 2) ctrlEnable false;
					(_display49 displayCtrl 2) ctrlSetText "+str _ESCMNUTOP+";
					(_display49 displayCtrl 103) ctrlEnable false;
					(_display49 displayCtrl 103) ctrlSetText "+str _ESCMNUBOT+";
					(_display49 displayCtrl 523) ctrlSetText profileName;
					(_display49 displayCtrl 109) ctrlSetText _puid;
					(_display49 displayCtrl 122) ctrlEnable false;
					(_display49 displayCtrl 122) ctrlShow false;
					"; if(_B49)then{ _asd = _asd + "
						_cnt = "; if((!_B49)&&(_MOD != 'Epoch'))then{ _asd = _asd + "{
							"; if(_B49)then{ _asd = _asd + "
							_controltype = ctrlType _x;
							if(_controltype == 16)then
							{
								_action = buttonAction _x;
								if(_action != '')then
								{
									if!(str _x in _excludedButtons)then
									{
										if((str _x == 'Control #-1')||(_action != ""(findDisplay 49) closeDisplay 0; 0 spawn {_n=  createDialog 'RHS_Options_Menu';0 spawn rhs_fnc_menuOptions;};""))then
										{
											_log = format['BadButton on 49: %1, %2',_x,_action];
											[_name,_puid,'HLOG_SKICK',toArray(_log)] call _AHKickLog;
											[] call _AHKickOFF;
										};
									};
								};
							};
							"; }; _asd = _asd + "
							"; if(_MOD == 'Epoch')then{ _asd = _asd + "
								if!(str _x in ['Control #101','Control #1010','Control #104','Control #302','Control #301','Control #303','Control #307'])then
								{
									_x ctrlEnable false;
								};
							"; }; _asd = _asd + "
							true
						} "; }; _asd = _asd + "count (allcontrols _display49);
					"; }; _asd = _asd + "
					
					if(_isNormal)then
					{
						{
							_ctrl = _display49 displayCtrl _x;
							_ctrl ctrlShow false;
							_ctrl buttonSetAction '(findDisplay 49) closeDisplay 0;(findDisplay 46) closeDisplay 0;';
						} forEach [11884,12284,13291];
						{
							_ctrl = _display49 displayCtrl _x;
							_ctrl ctrlShow false;
							_ctrl buttonSetAction '(findDisplay 49) closeDisplay 0;(findDisplay 46) closeDisplay 0;';
							if(!isNull _ctrl)then
							{
								_log = format['BadControl on 49: %1 - %2',_ctrl,_x];
								[_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
								[] call _AHKickOFF;
							};
						} forEach [65464,65465,65466];
					};
				}
				else
				{
					_49openedTimer = 0;
				};
			};
			if(!isNull _display49)then
			{
				"; if(!_BRIEFING_MSG)then{ _asd = _asd + "
				(_display49 displayCtrl 120) ctrlSetText 'infiSTAR.de AntiHack & AdminsTools - [Author: infiSTAR, Contact: infiSTAR23@gmail.com]';
				"; }else{ _asd = _asd + "
				(_display49 displayCtrl 115025) ctrlSetText 'AntiHack & AdminsTools';
				(_display49 displayCtrl 115035) ctrlSetText 'by infiSTAR.de';
				"; }; _asd = _asd + "
			};


			if(!isNull findDisplay 24 && !isNull findDisplay 49)then
			{
				_dynTextDisplay = uiNamespace getvariable ['BIS_dynamicText',displayNull];
				if(!isNull _dynTextDisplay)then
				{
					_ctrl = _dynTextDisplay displayctrl 9999;
					_ctrltext = ctrlText _ctrl;
					if!(_ctrltext isEqualTo '')then
					{
						_stillLog = true;
						_lower_ctrltext = toLower _ctrltext;
						{
							if(_lower_ctrltext find _x > -1)then
							{
								_stillLog = false;
								_log = format['Hackmenu found: %1 on %2 %3 - %4',_x,ctrlIDD _dynTextDisplay,ctrlIDC _ctrl,_ctrltext];
								[_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
								[] call _AHKickOFF;
							};
						} forEach "+str _verybadStrings+";
						if(_stillLog)then
						{
							_log = format['Possible Hackmenu found on CTRL: [%1] - TEXT: [%2]',_ctrl, _ctrltext];
							[_name,_puid,'SLOG_RE',toArray(_log)] call _AHKickLog;
						};
					};
					(findDisplay 24) closeDisplay 0;
					(findDisplay 49) closeDisplay 0;
				};
			};

			{
				if(!isNull ((findDisplay 24) displayCtrl _x))then
				{
					_log = format['MenuBasedHack :: 24 :: %1',_x];
					[_name,_puid,'HLOG_SKICK',toArray(_log)] call _AHKickLog;
					[] call _AHKickOFF;
				};
			} forEach [2406,2407,2408,2409,2410,2411,2412,2443,2442,2441];
			(findDisplay 24) displayRemoveEventHandler ['KeyUp',_chatKeyUp_id];
			_chatKeyUp_id = (finddisplay 24) displayAddEventHandler ['KeyUp',_chatKeyUp];


			"; if(_MOD == 'Epoch')then{ _asd = _asd + "
				if(!isNull player)then
				{
					if(alive player)then
					{
						{
							player removeAllEventHandlers _x;
							player addEventHandler [_x,(['CfgEpochClient', _x, ''] call EPOCH_fnc_returnConfigEntryV2)];
						} forEach _playerhandlers;
					};
					
					"; if(_UAG)then{ _asd = _asd + "
					if(animationState player == 'amovpercmsprsnonwnondf_amovppnemstpsnonwnondnon')then
					{
						_ct = cursorTarget;
						if(!isNull _ct)then
						{
							if((_ct isKindOf 'Constructions_static_F') && (_ct distance player < 4))then
							{
								if(time - _lastglitch > 45)then{_wallgames = 0;};
								_lastglitch = time;
								player switchMove '';
								player setVelocity [0,0,0];
								if(_wallgames >= 1)then
								{
									player setHitPointDamage ['HitLegs',1];
									_log = format['Anti-Glitch: %1 triggered %2 times @%3 (LEGS BROKEN)',typeOf _ct,_wallgames,mapGridPosition player];
									[_name,_puid,'HLOG',toArray(_log)] call _AHKickLog;
								};
								if(_wallgames >= 2)then
								{
									player setPos [0,0,100];
									{player setHitPointDamage [_x,1];} forEach ['HitBody','HitHead'];
									_log = format['Anti-Glitch: %1 triggered %2 times @%3 (KILLED THE GLITCHER)',typeOf _ct,_wallgames,mapGridPosition player];
									[_name,_puid,'HLOG_SKICK',toArray(_log)] call _AHKickLog;
									_wallgames = 0;
									[] call _AHKickOFF;
								};
								_wallgames = _wallgames + 1;
								_msg = 'NO GLITCHING';
								hint _msg;
								1 cutText [format ['%1',_msg],'WHITE IN'];
								systemChat _msg;
							};
						};
					};
				};
				"; }; _asd = _asd + "
			"; }; _asd = _asd + "
			if(isNull _display49)then{uiSleep 0.2;};


            "; if(_useTildMenu)then{ _asd = _asd + "
            if(!isNil'"+_customcommandingMenuOpen+"')then
            {
				_cmd_open_timer = diag_tickTime + 5;
				waitUntil{
					hint format['opening menu in: %1s if your game crahes, do not use this function again..! #ArmaBugs',_cmd_open_timer - diag_tickTime];
					diag_tickTime > _cmd_open_timer
				};
				"+_customcommandingMenuOpen+" = nil;
				showCommandingMenu '#USER:"+_customcommandingMenu+"';
            };
            "; }; _asd = _asd + "


			"; if((_MOD == 'Epoch')&&(_AWL))then{ _asd = _asd + "
				if(player == vehicle player)then
				{
					_intersectsWith = [];
					
					_eyeDir = eyedirection player;
					_wepDir = player weapondirection currentweapon player;
					
					_vectorDiff = _eyeDir vectorDiff _wepDir;
					_xdif = abs(_vectorDiff select 0);
					
					if((inputAction 'EvasiveLeft' > 0)||(inputAction 'EvasiveRight' > 0)||(_eyeDir select 2 > 0.5)||(_xdif > 0.55))then
					{
						_eyePos = eyepos player;
						_dir_weapon_r = (((_wepDir) select 0) atan2 ((_wepDir) select 1))+45;
						_dir_weapon_l = (((_wepDir) select 0) atan2 ((_wepDir) select 1))-25;
						
						_intersectsWith = lineintersectswith [[(_eyePos select 0) + (_eyeDir select 0)*_dis_head,(_eyePos select 1) + (_eyeDir select 1)*_dis_head,(_eyePos select 2) + (_eyeDir select 2)*_dis_head], _eyePos, player];
						_intersectsWith append lineintersectswith [[(_eyePos select 0) + _dis_weapon_r*sin _dir_weapon_r,(_eyePos select 1) + _dis_weapon_r*cos _dir_weapon_r,(_eyePos select 2)], _eyePos, player];
						_intersectsWith append lineintersectswith [[(_eyePos select 0) + _dis_weapon_l*sin _dir_weapon_l,(_eyePos select 1) + _dis_weapon_l*cos _dir_weapon_l,(_eyePos select 2)], _eyePos, player];
						
						_plrPosVisual = ATLtoASL (player modelToWorldVisual [0,0,0]);
						_intersectsWith append lineIntersectsWith [_eyePos, _plrPosVisual];
					};
					
					if(_intersectsWith isEqualTo [])then
					{
						if(_faded)then{_faded=false;TitleText ['AntiHack by infiSTAR.de','PLAIN DOWN'];};
					}
					else
					{
						{
							if((_x isKindOf 'Const_All_Walls_F' || _x isKindOf 'Const_WoodWalls_static_F') && {call _fadeOut})then{};
						} forEach _intersectsWith;
					};
				};
			"; }; _asd = _asd + "
		};
	};

	[_name,_puid,_AHKickOFF,_AHKickLog] spawn {
		params ['_name','_puid','_AHKickOFF','_AHKickLog'];
		"; if(_USE_RESTART_TIMER)then{ _asd = _asd + "
			_restartTime = "+str _RESTART_TIME_IN_M+";
			_msgTimes = "+str _SHOW_TIMER_IN_MIN+";
			_msgFormat = '<t size=''0.70'' color=''#DA1700'' align=''right''>RESTART IN %1 MINS</t>';
		"; }; _asd = _asd + "
		"; if(_UOL)then{ _asd = _asd + "
			_server_onLoadUnload1 = "+str _onLoadUnload1+";
			_server_onLoadUnload2 = "+str _onLoadUnload2+";
			_server_onLoadUnload3 = "+str _onLoadUnload3+";
		"; }; _asd = _asd + "
		while{1==1}do
		{
			"; if(_UOL)then{ _asd = _asd + "
				{
					_onLoad = toArray(getText(configFile >> _x >> 'onLoad'));
					_server_onLoad = _server_onLoadUnload2 select _forEachIndex;
					if(!(_onLoad isEqualTo _server_onLoad) && !(_onLoad isEqualTo ''))then
					{
						_log = format['onLoad changed: %1, %2, %3',_x,toString _onLoad,toString _server_onLoad];
						[_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
						[] call _AHKickOFF;
					};
					_onUnload = toArray(getText(configFile >> _x >> 'onUnload'));
					_server_onUnload = _server_onLoadUnload3 select _forEachIndex;
					if(!(_onUnload isEqualTo _server_onUnload) && !(_onUnload isEqualTo ''))then
					{
						_log = format['onUnload changed: %1, %2, %3',_x,toString _onUnload,toString _server_onUnload];
						[_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
						[] call _AHKickOFF;
					};
				} forEach _server_onLoadUnload1;
			"; }; _asd = _asd + "
			"; if(_UMP)then{ _asd = _asd + "
				uiSleep 1;
				_children = [configFile >> 'RscDisplayMPInterrupt' >> 'controls',0] call BIS_fnc_returnChildren;
				_allowedChildren = ['Title','MissionTitle','DifficultyTitle','PlayersName','ButtonCancel','ButtonSAVE','ButtonSkip','ButtonRespawn','ButtonOptions','ButtonVideo','ButtonAudio','ButtonControls','ButtonGame','ButtonTutorialHints','ButtonAbort','DebugConsole','Feedback','MessageBox','CBA_CREDITS_M_P','CBA_CREDITS_CONT_C','Version','TrafficLight','TraffLight'];
				{
					_cfgName = configName _x;
					if(!(_cfgName in _allowedChildren))then
					{
						_log = format['Modified MPInterrupt: %1 | %2',_x,_cfgName];
						[_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
						[] call _AHKickOFF;
					};
				} forEach _children;
				uiSleep 1;
			"; }; _asd = _asd + "
			"; if(_USE_RESTART_TIMER)then{ _asd = _asd + "
				_currentmessagetime = (_restartTime - round(serverTime / 60));
				if(_currentmessagetime in _msgTimes)then
				{
					_msgTimes = _msgTimes - [_currentmessagetime];
					[
						format[_msgFormat, _restartTime - round(serverTime / 60)],
						[safezoneX + safezoneW - 0.8,0.50],
						[safezoneY + safezoneH - 0.8,0.7],
						5,
						0.5
					] call BIS_fnc_dynamicText;
				};
			"; }; _asd = _asd + "
			uiSleep 8;
		};
	};
	if(_isNormal)then {
		"; if((_UBV)||(_UBV2))then{ _asd = _asd + "
			[_name,_puid,_admin,_isNormal,_admins] spawn {
				params ['_name','_puid','_admin','_isNormal','_admins'];
				"; if(_UBV)then{ _asd = _asd + "
					_blacklistedVariables = "+str _blacklistedVariables+";
					_blacklistedVariables append ['JoinOrNotJoinIsTheQuestion','noRecoilRun','A3FFrun'];
					if(_admin)then
					{
						{
							_missionNamespace = missionNamespace getVariable _x;
							if(!isNil '_missionNamespace')then
							{
								missionNamespace setVariable[_x,nil];
							};
							_uiNamespace = uiNamespace getVariable _x;
							if(!isNil '_uiNamespace')then
							{
								uiNamespace setVariable[_x,nil];
							};
							_profileNamespace = profileNamespace getVariable _x;
							if(!isNil '_profileNamespace')then
							{
								profileNamespace setVariable[_x,nil];
							};
						} forEach _blacklistedVariables;
						saveProfileNamespace;
					};
				"; }; _asd = _asd + "
				"; if(_UBV2)then{ _asd = _asd + "
					_lastTimeCheckedVars = time + 80;
					_alreadyCheckedVariables = "+str _allRandomGenVars+";
					_alreadyCheckedVariables append "+str _badVarWhitelistReal+";
					_alreadyCheckedVariables append ['fnc_sendmsgtoplr','bpdcode','"+_AH_AdmiLogArrayRND+"'];
				"; }; _asd = _asd + "
				while{1==1}do
				{
					_timer1 = time;
					{
						_bvc = profileNamespace getVariable [_x,0];
						if(_bvc isEqualType '')then
						{
							profileNamespace setVariable [_x,0.4];saveprofileNamespace;
							_log = format['Injector found: %1 (%2) VALUE: [%3]', _x, typeName _bvc, str _bvc];
							[_name,_puid,'HLOG_SKICK',toArray(_log)] call "+_AHKickLog+";
							[] call "+_AHKickOFF+";
						};
					} forEach [
						'igui_bcg_rgb_a','igui_bcg_rgb_r','igui_bcg_rgb_g','igui_bcg_rgb_b','IGUI_grid_mission_X','IGUI_grid_mission_Y','IGUI_grid_mission_W','IGUI_grid_mission_H',

						'gui_grid_w','igui_grid_squadradar_y','igui_grid_slingloadassistant_h','gui_grid_x','igui_grid_stance_x','gui_titletext_rgb_r','gui_grid_y','igui_grid_stance_y',
						'gui_bcg_rgb_a','igui_grid_gps_w','igui_error_rgb_a','igui_grid_gps_x','igui_error_rgb_b','igui_grid_gps_y','igui_grid_stamina_x','gui_grid_center_w',
						'igui_grid_comm_x','gui_grid_center_x','igui_grid_stamina_y','igui_grid_radar_x','igui_grid_comm_y','gui_grid_center_y','igui_warning_rgb_a','igui_text_rgb_a',
						'igui_grid_avcamera_h','igui_grid_radar_y','igui_warning_rgb_b','igui_text_rgb_b','gui_bcg_rgb_g','igui_grid_gaugespeed_x','igui_grid_weapon_x','igui_grid_gaugespeed_y',
						'igui_error_rgb_g','igui_grid_gaugecompass_x','igui_grid_weapon_y','igui_grid_chat_w','igui_grid_vehicle_x','igui_grid_vehicle_y','igui_grid_gaugecompass_y',
						'igui_grid_chat_x','igui_grid_hint_x'
					];


					"; if(_UBV)then{ _asd = _asd + "
						{
							_vc = missionNamespace getVariable _x;
							if(!isNil _x)then
							{
								_log = format['BadVar#1: %1 - %2',_x,_vc];
								[_name,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
								[] call "+_AHKickOFF+";
							}
							else
							{
								if(!isNil '_vc')then
								{
									_log = format['BadVar#1 in missionNamespace: %1 - %2',_x,_vc];
									[_name,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
									[] call "+_AHKickOFF+";
								};
							};
							_vc = player getVariable _x;
							if(!isNil '_vc')then
							{
								player setVariable[_x,nil];
								_log = format['BadVar#1 on player: %1 - %2',_x,_vc];
								[_name,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
								[] call "+_AHKickOFF+";
							};
							_vc = uiNamespace getVariable _x;
							if(!isNil '_vc')then
							{
								_log = format['BadVar#1 in uiNamespace: %1 - %2',_x,_vc];
								[_name,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
								[] call "+_AHKickOFF+";
							};
							_vc = profileNamespace getVariable _x;
							if(!isNil '_vc')then
							{
								profileNamespace setVariable[_x,nil];saveProfileNamespace;
								_log = format['BadVar#1 in profileNamespace: %1 - %2',_x,_vc];
								[_name,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
								[] call "+_AHKickOFF+";
							};
						} forEach _blacklistedVariables;
					"; }; _asd = _asd + "
					"; if(_UBV2)then{ _asd = _asd + "
						if(_admin)then
						{
							if(time > _lastTimeCheckedVars)then
							{
								_lastTimeCheckedVars = time + 80;
								
								{
									_var = _x;
									_varid = _alreadyCheckedVariables pushBackUnique _var;
									if(_varid > -1)then
									{
										{
											if!((toLower _var) find _x isEqualTo -1)then
											{
												_log = format['BadVar#2 found %1 in %2',_x,_var];
												[profileName,getPlayerUID player,'HLOG_SKICK',toArray(_log)] call "+_AHKickLog+";
												[] call "+_AHKickOFF+";
												missionNamespace setVariable[_var,nil];
											}
											else
											{
												"; if(_UBV2C)then{ _asd = _asd + "
													_m = missionNamespace getVariable _var;
													if(!isNil '_m')then
													{
														_mstring = str _m;
														if((toLower _mstring) find _x != -1)then
														{
															_mstring = _mstring select [0,1000];
															_log = format['BadVar#2 found %1 in %2: %3',_x,_var,_mstring];
															[profileName,getPlayerUID player,'SLOG',toArray(_log)] call "+_AHKickLog+";
															(findDisplay 46)closeDisplay 0;
															missionNamespace setVariable[_var,nil];
														};
													};
												"; }; _asd = _asd + "
											};
										} forEach "+str _verybadStrings+";
									};
								} forEach (allVariables missionNamespace);
							};
						};
					"; }; _asd = _asd + "
					_sleeptimer = ((time - _timer1)*2)+1;
					uiSleep _sleeptimer;
				};
			};
		"; }; _asd = _asd + "
		[_name,_puid] spawn {
			disableSerialization;
			_name = _this select 0;
			_puid = _this select 1;
			_addCaseHDMGold = -1;
			_addCaseMEHold = -1;
			if(isNil 'life_fnc_keyHandler')then{life_fnc_keyHandler = {false};}else{if(typeName life_fnc_keyHandler != 'CODE')then{life_fnc_keyHandler = {false};};};
			
			"; if((_RDK) && !(_CKB))then{ _asd = _asd + "
				(findDisplay 46) displayRemoveAllEventHandlers 'KeyDown';
			"; }; _asd = _asd + "
			"; if(_RUK)then{ _asd = _asd + "
				(findDisplay 46) displayRemoveAllEventHandlers 'KeyUp';
			"; }; _asd = _asd + "
			
			"; if(_CKB)then{ _asd = _asd + "
				_kbacaught = false;
			"; }; _asd = _asd + "
			"; if(_MOD == 'Epoch')then{ _asd = _asd + "
			_loggedOnce = false;
			"; }; _asd = _asd + "
			while{1==1}do
			{

"; if(_MOD == 'Epoch')then{ _asd = _asd + "
_vehvarname = vehicleVarName player;
if!(_vehvarname isEqualTo '')then
{
	_log = format['vehicleVarName on player: %1',_vehvarname];
	[_name,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
	[] call "+_AHKickOFF+";
};
"; }; _asd = _asd + "


"; if(_BHA)then{ _asd = _asd + "
if(!isNil'bis_fnc_holdAction_running')then{
	_log = 'HackAction on player: holdAction detected!';
	[_name,_puid,'HLOG_SKICK',toArray(_log)] call "+_AHKickLog+";
	[] call "+_AHKickOFF+";
};
"; }; _asd = _asd + "
{
	private _actionParams = player actionParams _x;
	if(!isNil'_actionParams')then
	{
		_actionParams params [
			['_actionTitle',''],
			['_script',''],
			['_arguments','']
		];
		if!(_actionTitle isEqualTo '')then
		{
			_actionParams = [_actionTitle,_script,_arguments];
			_actionTitle = toLower _actionTitle;
			{
				if(_actionTitle find _x > -1)exitWith
				{
					_log = format['HackAction on player: found [%1] in [%2]',_x,_actionParams];
					[_name,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
					[] call "+_AHKickOFF+";
				};
			} forEach [
				':dh:','map esp','inf ammo','delete cursor','destroy target','delete target','carpet bomb',
				'godmode','no grass','jail cursor','map tp','rapid fire','creation list','spawn gear loadouts',
				'===','back to main menu','exile only','back to main menu','>sl7 '
			];
		};
	};
} forEach (actionIDs player);




				if((!isNull (findDisplay 12))&&(visiblemap))then
				{
					"; if(_MOD == 'Epoch')then{ _asd = _asd + "
					if(!_loggedOnce)then
					{
						_selected = lbSelection ((findDisplay 12) displayCtrl 1001);
						if(!(_selected isEqualTo [2])&&!(_selected isEqualTo [3]))then
						{
							_control1 = (findDisplay 12) displayCtrl 1002;
							_size = lbSize _control1;
							if(_size > 2)then
							{
								_texts = [];
								for '_i' from 0 to (_size-1) do
								{
									_lbtxt = _control1 lbText _i;
									_texts pushBack _lbtxt;
								};
								
								_log = format['Map Sub-Menu %1 size has been changed to %2. Found: %3',_selected,_size,_texts];
								[_name,_puid,'SLOG_SKICK',toArray(_log)] call "+_AHKickLog+";
								(findDisplay 46)closeDisplay 0;
								_loggedOnce = true;
								lbClear _control1;
							};
						};
						
						_control2 = (findDisplay 12) displayCtrl 1001;
						_size = lbSize _control2;
						if(_size > 5)then
						{
							_log = format['Map Menu has been changed %1 entries found (should be 5)',_size];
							[_name,_puid,'SLOG',toArray(_log)] call "+_AHKickLog+";
							_loggedOnce = true;
							lbClear _control2;
						};
					};
					"; }; _asd = _asd + "
				};

				
				"; if(_RUK)then{ _asd = _asd + "
					(findDisplay 46) displayRemoveAllEventHandlers 'KeyUp';
					(findDisplay 46) displayAddEventHandler ['KeyUp',{ _this call "+_fnc_infiKeyHandler+"; }];
					"; if(_MOD == 'Epoch')then{ _asd = _asd + "
						(findDisplay 46) displayAddEventHandler ['KeyUp','_this call EPOCH_KeyUp'];
					"; }; _asd = _asd + "
				"; }; _asd = _asd + "
				
				"; if(_RDK)then{ _asd = _asd + "
					(findDisplay 46) displayRemoveAllEventHandlers 'KeyDown';
					_shouldbe = 0;
					_kdID = (findDisplay 46) displayAddEventHandler ['KeyDown',{ _this call "+_fnc_infiKeyHandler+"; }];
					"; if(_MOD == 'AltisLife')then{ _asd = _asd + "
						_shouldbe = _shouldbe + 1;
						_kdID = (findDisplay 46) displayAddEventHandler ['KeyDown','_this call life_fnc_keyHandler;'];
					"; }; _asd = _asd + "
					"; if(_MOD == 'Epoch')then{ _asd = _asd + "
						_shouldbe = _shouldbe + 1;
						_kdID = (findDisplay 46) displayAddEventHandler ['KeyDown','_this call EPOCH_KeyDown'];
					"; }; _asd = _asd + "
					"; if(_CKB)then{ _asd = _asd + "
						_shouldbe = _shouldbe + 1;
						_kdID = (findDisplay 46) displayAddEventHandler ['KeyDown','false'];
					"; }; _asd = _asd + "
		uiSleep 0.2;
					"; if(_CKB)then{ _asd = _asd + "
						_randomid = round(random 5);
						for '_i' from 1 to _randomid do
						{
							_shouldbe = _shouldbe + 1;
							_kdID = (findDisplay 46) displayAddEventHandler ['KeyDown','false'];
						};
						if(_kdID != _shouldbe)then
						{
							if(alive player)then
							{
								if(_kbacaught)then
								{
									_log = format['KeyBinds added   %1 should be %2',_kdID,_shouldbe];
									[_name,_puid,'HLOG',toArray(_log)] call "+_AHKickLog+";
									(findDisplay 46)closeDisplay 0;
								};
								_kbacaught=true;
								"; if(_RUK)then{ _asd = _asd + "
									(findDisplay 46) displayRemoveAllEventHandlers 'KeyUp';
									(findDisplay 46) displayAddEventHandler ['KeyUp',{ _this call "+_fnc_infiKeyHandler+"; }];
									"; if(_MOD == 'Epoch')then{ _asd = _asd + "
										(findDisplay 46) displayAddEventHandler ['KeyUp','_this call EPOCH_KeyUp'];
									"; }; _asd = _asd + "
								"; }; _asd = _asd + "
							};
						};
					"; }; _asd = _asd + "
				"; }else{ _asd = _asd + "
		uiSleep 0.2;
				"; }; _asd = _asd + "
				if(!isNull player)then
				{
					if(alive player)then
					{
						"; if(_MOD != 'Epoch')then{ _asd = _asd + "
							player removeAllEventHandlers 'Take';
						"; }; _asd = _asd + "
						"; if(_C3D)then{ _asd = _asd + "
							if(_addCaseMEHold > -1)then
							{
								_addCaseMEH = addMissionEventHandler ['Draw3D', {}];
								if(_addCaseMEHold + 1 != _addCaseMEH)then
								{
									_log = format['EH_Draw3D 2:   %1 should be %2',_addCaseMEH,_addCaseMEHold + 1];
									[_name,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
									[] call "+_AHKickOFF+";
								};
							};
							removeAllMissionEventHandlers 'Draw3D';
							_roundRandomNumberMEH = (round(random 3))+1;
							_addCaseMEH = 0;
							for '_i' from 0 to _roundRandomNumberMEH do
							{
								_addCaseMEH = addMissionEventHandler ['Draw3D', {}];
							};
							if(_addCaseMEH == _roundRandomNumberMEH)then
							{
								_addCaseMEHold = _addCaseMEH;
							}
							else
							{
								_log = format['EH_Draw3D 1:   %1 should be %2',_addCaseMEH,_roundRandomNumberMEH];
								[_name,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
								[] call "+_AHKickOFF+";
							};
						"; }; _asd = _asd + "
						
						
						"; if(_MOD == 'Epoch')then{ _asd = _asd + "
							player removeAllEventHandlers 'AnimChanged';
							{
								player removeAllEventHandlers _x;
								_addCase = player addEventHandler [_x,{}];
								if(_addCase > 0)then{
									_log = format['EH_%1: %2',_x,_addCase];
									[_name,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
									[] call "+_AHKickOFF+";
								};
							} forEach ['HandleHeal','HitPart'];
							"; if(_RHD)then{ _asd = _asd + "
								if(_addCaseHDMGold > -1)then
								{
									_addCaseHDMG = player addEventHandler ['HandleDamage',{}];
									if((_addCaseHDMGold + 1 != _addCaseHDMG)&&(_addCaseHDMG != 0))then
									{
										_log = format['EH_HandleDamage 2:   %1 should be %2',_addCaseHDMG,_addCaseHDMGold + 1];
										[_name,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
										[] call "+_AHKickOFF+";
									};
								};
								player removeAllEventHandlers 'HandleDamage';
								_roundRandomNumberHDMG = (round(random 3))+1;
								_addCaseHDMG = 0;
								for '_i' from 0 to _roundRandomNumberHDMG do
								{
									_addCaseHDMG = player addEventHandler ['HandleDamage',{}];
								};
								if(_addCaseHDMG == _roundRandomNumberHDMG)then
								{
									"; if(str _CHD != '{}')then{ _asd = _asd + "
										_addCaseHDMG = player addEventHandler ['HandleDamage',"+str _CHD+"];
									"; }; _asd = _asd + "
									_addCaseHDMGold = _addCaseHDMG;
								}
								else
								{
									_log = format['EH_HandleDamage 1:   %1 should be %2',_addCaseHDMG,_roundRandomNumberHDMG];
									[_name,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
									[] call "+_AHKickOFF+";
								};
							"; }else{ _asd = _asd + "
							player removeAllEventHandlers 'HandleDamage';
							player addEventHandler ['HandleDamage',''];
							"; }; _asd = _asd + "
						"; }; _asd = _asd + "
						
						
						"; if(_MOD == 'AltisLife')then{ _asd = _asd + "
							player removeAllEventhandlers 'InventoryClosed';
							player addEventHandler ['InventoryClosed', {_this call life_fnc_inventoryClosed}];
							"; if(_RIO)then{ _asd = _asd + "
								player removeAllEventhandlers 'InventoryOpened';
								player addEventHandler ['InventoryOpened', {_this call life_fnc_inventoryOpened}];
							"; }; _asd = _asd + "
							"; if(_RKH)then{ _asd = _asd + "
								player removeAllEventHandlers 'Killed';
								player addEventHandler ['Killed', {_this spawn life_fnc_onPlayerKilled}];
							"; }; _asd = _asd + "
							"; if(_RHD)then{ _asd = _asd + "
								player removeAllEventhandlers 'HandleDamage';
								player addEventHandler ['HandleDamage',{_this call life_fnc_HandleDamage;}];
							"; }; _asd = _asd + "
							player addEventHandler ['Take',{_this call life_fnc_onTakeItem}];
							if("+str _REH+")then{player removeAllEventhandlers 'Hit';};
						"; }; _asd = _asd + "
					}
					else
					{
						_addCaseMEHold = -1;
						_addCaseHDMGold = -1;
					};
				}
				else
				{
					_addCaseMEHold = -1;
					_addCaseHDMGold = -1;
				};
			};
		};
		[_name,_puid,_AHKickOFF,_AHKickLog,_admins] spawn {
			params['_name','_puid','_AHKickOFF','_AHKickLog','_admins'];
			disableSerialization;
			uiSleep 5;
			BIS_fnc_showNotification_queue = [];
			
			_uistocheck = ['RscDisplayRemoteMissions','RscDisplayDebugPublic','RscDisplayMovieInterrupt'];
			"; if(_checkRscDisplayArsenal)then{ _asd = _asd + "
			_uistocheck pushBack 'RscDisplayArsenal';
			"; }; _asd = _asd + "
			{uiNamespace setVariable[_x,nil];} forEach _uistocheck;
			
			_inventoryIds = [8,0,18,70,46,12,602,999,-1200,-1300,-1400,-1500,-1900,-8,-9,-10,-15,63,55,49,-6,24,-13,129,174,38500,7300];
			_inventoryDisplays = ['No display'];
			{_inventoryDisplays pushBack format['Display #%1',_x];} forEach _inventoryIds;
			_lastText = '';
			
			_badIDDsToKickPre = "+str _badIDDsToKick+";
			_badIDDsToKick = [];
			{_badIDDsToKick pushBack format['Display #%1',_x];} forEach _badIDDsToKickPre;
			_badIDDsToClosePre = "+str _badIDDsToClose+";
			_badIDDsToClose = [];
			{_badIDDsToClose pushBack format['Display #%1',_x];} forEach _badIDDsToClosePre;
			_wasclosed = false;
			"; if(_UDW)then{ _asd = _asd + "
			_allowedIddsPre = "+str _allowedIDDs+";
			_allowedIDDs = ['No display'];
			{_allowedIDDs pushBack format['Display #%1',_x];} forEach _allowedIddsPre;
			_announceDisplayIddOnce = [];
			"; }; _asd = _asd + "
			
			_verybadStrings = "+str _verybadStrings+";
			_checked = [];
			_lastEmpty = 0;
			while{1==1}do
			{
				{
					_x params['_idd','_idc'];
					if(!isNull (findDisplay _idd))then
					{
						if(_idc isEqualType 0)then
						{
							if(!isNull ((findDisplay _idd) displayCtrl _idc))then
							{
								_log = format['MenuBasedHack :: %1 :: %2',_idd,_idc];
								[_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
								[] call _AHKickOFF;
							};
						}
						else
						{
							{
								if(!isNull ((findDisplay _idd) displayCtrl _x))then
								{
									_log = format['MenuBasedHack :: %1 :: %2',_idd,_x];
									[_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
									[] call _AHKickOFF;
								};
							} forEach _idc;
						};
					};
				} forEach [
					[6686,1501],
					[6687,1999],
					[46,-2],
					[73,302],
					[125,1000]
				];
				
				if(diag_tickTime - _lastEmpty > 45)then
				{
					_lastEmpty = diag_tickTime;
					_checked = [];
				};
				
				{
					_control = _x;
					_ctrlTxt = ctrlText _control;
					_lowerctrlTxt = toLower _ctrlTxt;
					
					{
						if(_lowerctrlTxt find _x > -1)then
						{
							_log = format['BadCtrlText: %1 on %2 %3 - %4',_x,_display,_control,_ctrlTxt];
							[_name,_puid,'HLOG_SKICK',toArray(_log)] call "+_AHKickLog+";
							[] call "+_AHKickOFF+";
						};
					} forEach _verybadStrings;
				} forEach [((findDisplay 49) displayCtrl 2),((findDisplay 49) displayCtrl 103)];
				
				_uiNamespace_dynamicText = uiNamespace getVariable 'BIS_dynamicText';
				if(!isNil '_uiNamespace_dynamicText')then
				{
					_allCtrls = allControls _uiNamespace_dynamicText;
					_whiteListed = ['','Debug Mode Enabled'];
					{
						if(getPlayerUID _x != '')then
						{
							_whiteListed pushBack (name _x);
						};
					} forEach allPlayers;
					{
						_ctrl = _x;
						_txt = ctrlText _ctrl;
						if(_txt != _lastText)then
						{
							if!(_txt in _whiteListed)then
							{
								_lastText = _txt;
								_ltxt = toLower _txt;
								{
									if(_ltxt find _x != -1)then
									{
										_log = format['BadText on %1: %2 - %3',_ctrl,_x,_txt];
										[_name,_puid,'HLOG_SKICK',toArray(_log)] call "+_AHKickLog+";
										(findDisplay 46)closeDisplay 0;
									};
								} forEach _verybadStrings;
							};
						};
					} forEach _allCtrls;
				};
				if(!isNull (findDisplay 157))then{ (findDisplay 157) closeDisplay 0; };

				{
					_cc1 = uiNamespace getVariable _x;
					if(!isNil '_cc1')then
					{
						_formatedcc1 = format['%1',_cc1];
						if(_formatedcc1 != '<null>')then
						{
							if(_formatedcc1 != 'No display')then
							{
								_log = format['Hacked: %1 - %2',_x,_cc1];
								[_name,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
								[] call "+_AHKickOFF+";
							}
							else
							{
								uiNamespace setVariable[_x,nil];
								_log = format['Hacked: %1 - %2',_x,_cc1];
								[_name,_puid,'SLOG_SKICK',toArray(_log)] call "+_AHKickLog+";
								(findDisplay 46)closeDisplay 0;
							};
						};
					};
				} forEach _uistocheck;
				"; if(_UNC)then{ _asd = _asd + "
				if!(_puid in _admins)then
				{
					if(!isNil 'BIS_fnc_showNotification_queue')then
					{
						if!(BIS_fnc_showNotification_queue isEqualTo [])then
						{
							_log = format['Hacked: showNotification - %1',BIS_fnc_showNotification_queue];
							[_name,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
							[] call "+_AHKickOFF+";
						};
					};
				};
				"; }; _asd = _asd + "
				if(!isNull (findDisplay 148))then
				{
					if((lbSize 104)-1 > 3)exitWith{
						_log = 'Hacked: RscDisplayConfigureControllers';
						[_name,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
						[] call "+_AHKickOFF+";
					};
				};
				{
					_lbSize = lbSize _x;
					if(_lbSize > 0)then{
						_log = format['lbSize %1 == %2',_x,_lbSize];
						[_name,_puid,'HLOG',toArray(_log)] call "+_AHKickLog+";
						lbClear _x;
					};
				} forEach [101,102];
				
				"; if(_MOD == 'Epoch')then{ _asd = _asd + "
					if(isNil'startingFncOpenHTML')then
					{
						if(buttonAction -13 != '')then
						{
							_log = format['ButtonAction Changed: %1',buttonAction -13];
							[_name,_puid,'HLOG_SKICK',toArray(_log)] call "+_AHKickLog+";
							[] call "+_AHKickOFF+";
						};
						if(buttonAction -14 != '')then
						{
							_log = format['ButtonAction Changed: %1',buttonAction -14];
							[_name,_puid,'HLOG_SKICK',toArray(_log)] call "+_AHKickLog+";
							[] call "+_AHKickOFF+";
						};
					};
				"; }; _asd = _asd + "
				if(_wasclosed)then
				{
					closeDialog 0;closeDialog 0;closeDialog 0;
					_wasclosed = false;
				};
				
				{
					if(!isNull _x)then
					{
						_display = _x;
						_strx = str _x;
						if(_strx in _badIDDsToKick)then
						{
							_log = format['BadDisplayID: %1',_strx];
							[_name,_puid,'HLOG_SKICK',toArray(_log)] call "+_AHKickLog+";
							[] call "+_AHKickOFF+";
						}
						else
						{
							if(_strx in _badIDDsToClose)then
							{
								systemChat format['<infiSTAR.de> %1 has been closed.',_strx];
								_x closeDisplay 0;
								closeDialog 0;closeDialog 0;closeDialog 0;
								_wasclosed = true;
							}
							else
							{
								"; if(_UDW)then{ _asd = _asd + "
								if!(_strx in _allowedIDDs)then
								{
									_x closeDisplay 0;
									closeDialog 0;closeDialog 0;closeDialog 0;
									
									if(_strx in _announceDisplayIddOnce)exitWith{};
									_announceDisplayIddOnce pushBack _strx;
									
									_log = format['Not Allowed Displays: %1   (was it legit? add the number to _allowedIDDs in your infiSTAR_config.sqf!)',_strx];
									[_name,_puid,'SLOG',toArray(_log)] call "+_AHKickLog+";
								};
								"; }; _asd = _asd + "
							};
						};
						if(!isNull _display)then
						{
							{
								if(!isNull (_display displayCtrl _x))then
								{
									_log = format['MenuBasedHack :: %1 :: %2',_display,_x];
									[_name,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
									[] call "+_AHKickOFF+";
								};
							} forEach [16030,13163,989187,16100];
							
							{
								_control = _x;
								_checkifIn = format['%1%2',_display,_control];
								if!(_checkifIn in _checked)then
								{
									_checked pushBack _checkifIn;
									_controltype = ctrlType _control;
									if(_controltype isEqualTo 5)then
									{
										_size = lbSize _control;
										if(_size > 0)then
										{
											for '_i' from 0 to (_size-1) do
											{
												_lbtxt = _control lbText _i;
													_txtfilter = toArray _lbtxt;
													_txtfilter = _txtfilter - [94];
													_txtfilter = _txtfilter - [96];
													_txtfilter = _txtfilter - [180];
													_txtclean = toString _txtfilter;
												_lowerlbtxt = toLower _txtclean;
												{
													if(_lowerlbtxt find _x > -1)then
													{
														_log = format['BadlbText: %1 FOUND [%2] ON %3 %4',_lbtxt,_x,_display,_control];
														[_name,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
													};
												} forEach _verybadStrings;
											};
										};
									}
									else
									{
										if(_controltype isEqualTo 12)then
										{
											_curTV = tvCurSel _control;
											_tvtxt = _control tvText _curTV;
												_txtfilter = toArray _tvtxt;
												_txtfilter = _txtfilter - [94];
												_txtfilter = _txtfilter - [96];
												_txtfilter = _txtfilter - [180];
												_txtclean = toString _txtfilter;
											_lowertvtxt = toLower _txtclean;
											{
												if(_lowertvtxt find _x > -1)then
												{
													_log = format['BadtvText: %1 FOUND [%2] ON %3 %4',_tvtxt,_x,_display,_control];
													[_name,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
													[] call "+_AHKickOFF+";
												};
											} forEach _verybadStrings;
										}
										else
										{
											if!(_controltype in [3,4,8,9,15,42,81,101,102])then
											{
												_ctrlTxt = ctrlText _control;
													_txtfilter = toArray _ctrlTxt;
													_txtfilter = _txtfilter - [94];
													_txtfilter = _txtfilter - [96];
													_txtfilter = _txtfilter - [180];
													_txtclean = toString _txtfilter;
												_lowerctrlTxt = toLower _txtclean;
												{
													if(_lowerctrlTxt find _x > -1)then
													{
														_log = format['BadCtrlText: %1 FOUND [%2] ON %3 %4',_ctrlTxt,_x,_display,_control];
														[_name,_puid,'HLOG_SKICK',toArray(_log)] call "+_AHKickLog+";
														[] call "+_AHKickOFF+";
													};
												} forEach _verybadStrings;
											};
										};
									};
								};
							} forEach (allControls _display);
						};
					};
				} forEach allDisplays;
				uiSleep 0.5;
			};
		};
		"; if(_CAP)then{ _asd = _asd + "
		[_name,_puid] spawn {
			_name = _this select 0;
			_puid = _this select 1;
			uiSleep 10;
			_caughtFired = 0;
			_randomIDcount = 0;
			_object = player;
			_acnt = -1;
			while{1==1}do
			{
				_tmpObj = player;
				uiSleep 2;
				if((!isNull player) && (alive player))then
				{
					if(player isEqualTo _tmpObj)then
					{
						"; if(_CAP)then{ _asd = _asd + "
							if(player isEqualTo _object)then[{_acnt = _acnt + 1},{_object = player;_acnt = 0}];
							_actionid = player addAction ['', '', [], -5, false, true, '', 'false'];player removeAction _actionid;
							if(_actionid > _acnt + 1)then
							{
								removeAllActions player;removeAllActions (vehicle player);
								_log = format['Actions: %1/%2 possible scroll menu hack (or you added custom actions..)',_actionid,_acnt];
								[_name,_puid,'SLOG_SKICK',toArray(_log)] call "+_AHKickLog+";
								_acnt = _actionid;
							};
						"; }; _asd = _asd + "
					};
				};
			};
		};
		"; }; _asd = _asd + "
"; if(_UAT)then{ _asd = _asd + "
	[_name,_puid] spawn {
		_name = _this select 0;
		_puid = _this select 1;
		_FNC_ANTI_TP = {
			private['_name','_puid','_myRespawnPosition','_lastpos','_lastHeightATL','_log','_lasttime','_difftime','_curpos','_tmpAHpos','_driver','_tpcount'];
			_name = _this select 0;
			_puid = _this select 1;
			player setVariable ['"+_AHpos+"',[]];
			_lastpos = getPosATL player;
			_lastHeightATL = _lastpos select 2;
			_lasttime = diag_tickTime;
			_myRespawnPosition = getPosATL player;
			_tpcount = 0;
			while{1==1}do
			{
				_curpos = getPosATL player;
				_curHeightATL = _curpos select 2;
				_distance = _lastpos distance2D _curpos;
				_mindistcheck = if((vehicle player) isEqualTo player)then{3}else{10};
				if(_distance > _mindistcheck)then
				{
					_difftime = diag_tickTime - _lasttime;
					_speed = _distance / _difftime;
					_type = typeOf (vehicle player);
					_topSpeed = (getNumber(configFile >> 'CfgVehicles' >> _type >> 'maxSpeed')) max 20;
					_topSpeedcalc = _topSpeed * 1.8;
					if(_speed < _topSpeedcalc)exitWith{};
					if(_lastpos distance2D _myRespawnPosition > 50)then {
						_driver = driver(vehicle player);
						if((isNull _driver)||{(player isEqualTo _driver)})then {
							_tmpAHpos = player getVariable ['"+_AHpos+"',[]];
							if(_tmpAHpos isEqualType [])then {
								if(_tmpAHpos isEqualTo [])then {
									if(((backpack player) isEqualTo 'B_Parachute')&&(_curHeightATL > 10))exitWith{};
									_tpcount = _tpcount + 1;
									_log = format['POTENTIAL-TP-REVERTED: Moved %1m in %2s (from %3 to %4). TopSpeed of %5 is %6 speed was %7. Player FPS: %8.',round _distance,_difftime,_lastpos,_curpos,_type,_topSpeed,_speed,diag_fps];
									if(_tpcount > 3)then {
										[_name,_puid,'TMPBAN',toArray(_log)] call "+_AHKickLog+";
										[] call "+_AHKickOFF+";
									} else {
										[_name,_puid,'SLOG',toArray(_log)] call "+_AHKickLog+";
									};
									player SetVelocity [0,0,1];player setPosATL _lastpos;
								} else {
									player setVariable ['"+_AHpos+"',[]];
									_log = 'Teleported by Admin';
									[_name,_puid,'TPLOG',toArray(_log),netId player,player getVariable ['teleportKey',''],_tmpAHpos select 0,_tmpAHpos select 1,_lastpos,_curpos] call "+_AHKickLog+";
								};
							} else {
								_log = format['Admin Teleport Variable highjacked! Type now: %1 - %2',typeName _tmpAHpos,_tmpAHpos];
								[_name,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
								[] call "+_AHKickOFF+";
								player SetVelocity [0,0,1];player setPosATL _lastpos;
							};
						} else {
							if(isNull _driver)exitWith{};
							if!(getPlayerUID _driver isEqualTo '')exitWith{};
							_log = format['TP with AI as driver..  Moved %1m in %2s (from %3 to %4). TopSpeed of %5 is %6 speed was %7. Player FPS: %8.',round _distance,_difftime,_lastpos,_curpos,_type,_topSpeed,_speed,diag_fps];
							[_name,_puid,'HLOG_SKICK',toArray(_log)] call "+_AHKickLog+";
							[] call "+_AHKickOFF+";
						};
					};
				};
				if(vehicle player isEqualto player)then
				{
					if(((backpack player) isEqualTo 'B_Parachute')&&(_curHeightATL > 10))exitWith{};
					
					_velZ = (velocity player) select 2;
					if(((_curHeightATL - _lastHeightATL) > 30)&&(_velZ < -5))then
					{
						systemChat format['Height changed by %1.. setting you to ground.',(_curHeightATL - _lastHeightATL)];
						player SetVelocity [0,0,1];player setPosATL _lastpos;
					};
				};
				
				_lastpos = getPosATL player;
				_lastHeightATL = _lastpos select 2;
				_lasttime = diag_tickTime;
				uiSleep 0.5;
			};
		};
		_ANTI_TP_THEAD_STARTED = [] spawn {};
		while {true} do
		{
			waitUntil { uiSleep 1;getClientStateNumber >= 10 && !isNull findDisplay 46 && !(getPlayerUID player isEqualTo '')};
			_ANTI_TP_THEAD_STARTED = [_name,_puid] spawn _FNC_ANTI_TP;
			waitUntil { uiSleep 1;isNull player || !alive player || {getPlayerUID player isEqualTo ''} || {isNull findDisplay 46} || {getClientStateNumber < 10} };
			terminate _ANTI_TP_THEAD_STARTED;
		};
	};
"; }; _asd = _asd + "
		[_name,_puid] spawn {
			_name = _this select 0;
			_puid = _this select 1;
			diag_log format['LOCALPLAYERINFO: %1(%2) | %3(%4) | %5',_name,_puid,str _name,str _puid,str (getPlayerUID player)];
			PVAH_AdminReq = nil;
			if(!isNil 'PVAH_AdminReq')then
			{
				_log = format['BadVar#ADMIN: PVAH_AdminReq - %1',PVAH_AdminReq];
				[_name,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
				[] call "+_AHKickOFF+";
			};
			while{1==1}do
			{
				_randomnombre = round(random 9999);
				PVAH_AdminReq = _randomnombre;
				if(str PVAH_AdminReq != str _randomnombre)then
				{
					_log = 'BadVar#ADMIN: PVAH_AdminReq';
					[_name,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
					[] call "+_AHKickOFF+";
				};
				"; if(_OAP && !_CAP)then{ _asd = _asd + "
					removeAllActions player;removeAllActions (vehicle player);
				"; }; _asd = _asd + "
				"; if(_RAD)then{ _asd = _asd + "
					player allowDamage true;
					(vehicle player) allowDamage true;
				"; }; _asd = _asd + "
				"; if(_URC)then{ _asd = _asd + "
				_unit = player;
				if((!isNull _unit)&&{alive _unit})then
				{
					_curecoil = unitRecoilCoefficient _unit;
					if(_curecoil < 1)then
					{
						_log = format['BadRecoil %1 | %2 %3 %4',_curecoil,typeOf _unit,typeOf (vehicle _unit),currentWeapon _unit];
						[_name,_puid,'HLOG_SKICK',toArray(_log)] call "+_AHKickLog+";
						[] call "+_AHKickOFF+";
					};
				};
				"; }; _asd = _asd + "
				"; if(_IAC)then{ _asd = _asd + "
				_gpsmapstate = false;
				_gpsmapend = false;
				if((!visiblemap)&&!('ItemMap' in (assignedItems player))&&!('ItemGPS' in (assignedItems player)))then
				{
					_gpsmapstate = true;
				};
				"; }; _asd = _asd + "
		uiSleep 0.2;
				"; if(_IAC)then{ _asd = _asd + "
				if(_gpsmapstate)then
				{
					if((visiblemap)&&('ItemMap' in (assignedItems player))&&('ItemGPS' in (assignedItems player)))then
					{
						_gpsmapend = true;
					};
				};
				if(_gpsmapend)then
				{
					_log = 'ItemsAdded: Suddenly had a GPS and a Map Item..';
					[_name,_puid,'SLOG',toArray(_log)] call "+_AHKickLog+";
					[] call "+_AHKickOFF+";
				};
				"; }; _asd = _asd + "
				_uid = getPlayerUID player;
				if((_uid != '') && {_puid != _uid} && {alive player})then{
					_log = format['_puid != _uid (%1/%2) - BANNED MEMORYHACK',_puid,_uid];
					[_name,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
					[] call "+_AHKickOFF+";
				};
			};
		};
		"; if((_CMC)||(_KCM))then{ _asd = _asd + "
			[_name,_puid] spawn {
				private['_name','_puid','_find1','_find2','_cMenu','_commandingMenu'];
				_name = _this select 0;
				_puid = _this select 1;
				_find1 = toLower('#USER');
				_find2 = ['#User:BIS_fnc_addCommMenuItem_menu','#User:BIS_Menu_GroupCommunication'];
				_cMenu = "+str _cMenu+";
				while{1==1}do
				{
					"; if(_CMC)then{ _asd = _asd + "
						_commandingMenu = commandingMenu;
						if(_commandingMenu != '')then
						{
							if(_commandingMenu in _find2)then
							{
								showCommandingMenu '';
							}
							else
							{
								if!(_commandingMenu in _cMenu)then
								{
									if(((toLower _commandingMenu) find _find1) != -1)then
									{
										_log = format['BadCommandingMenu: %1',_commandingMenu];
										[_name,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
										[] call "+_AHKickOFF+";
									};
									showCommandingMenu '';
								};
							};
						};
					"; }; _asd = _asd + "
					"; if(_KCM)then{ _asd = _asd + "
						showCommandingMenu '';
					"; }; _asd = _asd + "
					uiSleep 0.75;
				};
			};
		"; }; _asd = _asd + "
		"+_ninetwothread+" = [_name,_puid] spawn {
			_name = _this select 0;
			_puid = _this select 1;
			_waitTime = 60;
			_mytime = diag_tickTime;
			waitUntil {((!isNil '"+_ninetwo+"') || (diag_tickTime > _mytime + _waitTime))};
			if(isNil '"+_ninetwo+"')exitWith
			{
				_log = format['Secondary checks not running.. (KICKED) - waited %1s',diag_tickTime - (_mytime + _waitTime)];
				[_name,_puid,'SLOG_SKICK',toArray(_log)] call "+_AHKickLog+";
				(findDisplay 46)closeDisplay 0;
			};
		};
		[_name,_puid,_admins] spawn {
			_name = _this select 0;
			_puid = _this select 1;
			_admins = _this select 2;
			_ForbiddenItems = "+str _ForbiddenItems+";
			"; if(_MOD == 'Epoch')then{ _asd = _asd + "
				_ForbiddenOnEpochOnly = "+str _ForbiddenOnEpochOnly+";
				_ForbiddenItems = _ForbiddenItems + _ForbiddenOnEpochOnly;
				_rnd1 = round(random 99999);life_cash = _rnd1;
				_rnd2 = round(random 99999);life_adminlevel = _rnd2;
				_rnd3 = round(random 99999);life_coplevel = _rnd3;
				_rnd4 = round(random 99999);life_fnc_MPexec = _rnd4;
				_rnd5 = round(random 99999);life_atmbank = _rnd5;
			"; }; _asd = _asd + "
			_caeM1 = 0;
			_caeM2 = 0;
			_vehptype = typeOf (vehicle player);
			_fnc_hasTV = {
				if('optic_tws' in _primWeapItems)exitWith{false};
				if('optic_tws_mg' in _primWeapItems)exitWith{false};
				if('optic_mas_term' in _primWeapItems)exitWith{false};
				if('Laserdesignator' in _primWeapItems)exitWith{false};
				if('acc_mas_pointer_IR' in _primWeapItems)exitWith{false};
				if('acc_pointer_IR' in _primWeapItems)exitWith{false};
				true
			};
			_fnc_hasNV = {
				if('optic_Nightstalker' in _primWeapItems)exitWith{false};
				if('optic_NVS' in _primWeapItems)exitWith{false};
				true
			};
			while{1==1}do
			{
				if(typeName _puid != 'STRING')then
				{
					_log = format['PUID BROKEN: %1',_puid];
					[_name,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
					[] call "+_AHKickOFF+";
				};
				"; if(_UFI||_UIW)then{ _asd = _asd + "
					_inventory = [];
					{_inventory pushBack _x;} forEach (assignedItems player);
					{_inventory pushBack _x;} forEach (magazines player);
					{_inventory pushBack _x;} forEach (weapons player);
					{_inventory pushBack _x;} forEach (primaryWeaponItems player);
					{_inventory pushBack _x;} forEach (secondaryWeaponItems player);
					{_inventory pushBack _x;} forEach (items player);
					_inventory pushBack (primaryWeapon player);
					_inventory pushBack (secondaryWeapon player);
					_inventory pushBack (uniform player);
					_inventory pushBack (vest player);
					_inventory pushBack (backpack player);
					_inventory pushBack (headgear player);
					_inventory pushBack (goggles player);
					if!(_inventory isEqualTo [])then
					{
						{
							if(_x != '')then
							{
								if((_x in _ForbiddenItems) || (("+str _UIW+") && !(_x in "+str _ItemWhiteList+")))then
								{
									player removeItem _x;
									player removeWeapon _x;
									player removeMagazine _x;
									if((uniform player) == _x)then{removeUniform player;};
									if((vest player) == _x)then{removeVest player;};
									if((backpack player) == _x)then{removeBackpack player;};
									if((headgear player) == _x)then{removeHeadgear player;};
									if((goggles player) == _x)then{removeGoggles player;};
									player removePrimaryWeaponItem _x;
									player removeSecondaryWeaponItem _x;
									player unlinkItem _x;
									_log = format['BadItem: %1 (might have been from an admin!)',_x];
									[_name,_puid,'SLOG',toArray(_log)] call "+_AHKickLog+";
								};
							};
						} forEach _inventory;
					};
				"; }; _asd = _asd + "
				if(!isNull player)then
				{
					"; if(_CVM)then{ _asd = _asd + "
						if(player == vehicle player)then
						{
							private['_curwep','_pvision','_primWeapItems','_pitems'];
							_curwep=currentWeapon player;
							_pvision=currentVisionMode player;
							_primWeapItems=primaryWeaponItems player;
							_pitems=items player;
							if('Rangfinder_mas_h' in _pitems)exitWith{};
							if((_pvision > 1)&&(call _fnc_hasTV))then
							{
								_log = format['BadVisionMode: Thermal (%1) current weapon: %2 | weaponsItems player: %3',_pvision,_curwep,weaponsItems player];
								[_name,_puid,'HLOG',toArray(_log)] call "+_AHKickLog+";
								(findDisplay 46)closeDisplay 0;
							};
							"; if(_MOD == 'Epoch')then{ _asd = _asd + "
								if((_pvision == 1)&&(str EPOCH_playerEnergy == '0')&&(call _fnc_hasNV))then
								{
									player action['nvGogglesOff',player];
									uiSleep 0.5;
									_pvision=currentVisionMode player;
									if((_pvision == 1)&&(str EPOCH_playerEnergy == '0'))exitWith
									{
										_log = format['BadVisionMode: Nightvision (%1) current weapon: %2 | weaponsItems player: %3 | EPOCH_playerEnergy: %4',_pvision,_curwep,weaponsItems player,EPOCH_playerEnergy];
										[_name,_puid,'HLOG',toArray(_log)] call "+_AHKickLog+";
										(findDisplay 46)closeDisplay 0;
									};
								};
							"; }; _asd = _asd + "
						};
					"; }; _asd = _asd + "
					"; if(_LVC)then{ _asd = _asd + "
						_veh = vehicle player;
						if(!(player isEqualTo _veh) && !(_vehptype isEqualTo (typeOf _veh)))then
						{
							_vehptype = typeOf _veh;
							if((toLower _vehptype) find 'chute' == -1)then
							{
								[_name,_puid,'LVC',player,_vehptype,mapGridPosition _veh] call "+_AHKickLog+";
							};
						};
					"; }; _asd = _asd + "
				};
				"; if(_MIC)then{ _asd = _asd + "
					_twelvewasactive = false;
					if(!isNull (findDisplay 12 displayCtrl 51))then
					{
						_twelvewasactive = true;
						_caeM1 = (findDisplay 12 displayCtrl 51) ctrlAddEventHandler ['Draw',''];
					};
				"; }; _asd = _asd + "
				uiSleep 2;
				"; if(_MIC)then{ _asd = _asd + "
					if((_twelvewasactive) && (!isNull (findDisplay 12 displayCtrl 51)))then
					{
						_caeM2 = (findDisplay 12 displayCtrl 51) ctrlAddEventHandler ['Draw',''];
						if(_caeM2 - _caeM1 > 1)then
						{
							if((("+str _MOD+" == 'AltisLife')&&(side player != west))||("+str _MOD+" != 'AltisLife'))then
							{
								_log = format['MapIcons (%1/%2)',_caeM1,_caeM2];
								[_name,_puid,'HLOG_SKICK',toArray(_log)] call "+_AHKickLog+";
								[] call "+_AHKickOFF+";
							};
						};
					};
				"; }; _asd = _asd + "
				"; if(_CVD)then{ _asd = _asd + "
					if(viewDistance > 1600)then{
						_log = format['viewDistance %1/1600',viewDistance];
						[_name,_puid,'HLOG_SKICK',toArray(_log)] call "+_AHKickLog+";
						[] call "+_AHKickOFF+";
					};
				"; }; _asd = _asd + "
				if(!isNull player)then
				{
					if(alive player)then
					{
						"; if(_CCO)then{ _asd = _asd + "
							_con = vehicle cameraOn;
							_veh = vehicle player;
							if(!(_con isEqualTo _veh) && {(!isNull _con) && (player isEqualTo driver (_veh))})then
							{
								uiSleep 1;
								_con = vehicle cameraOn;
								_veh = vehicle player;
								if(alive player)then
								{
									if((_con != _veh) && (!isNull _con) && (player isEqualTo driver (_veh)) && {_con distance _veh > 150} && {(("+str _MOD+" != 'KOTH') || (str(typeOf _con) find 'UAV' == -1))})then
									{
										_log = format['cameraOn: %1 [%2] should be %3 [%4]',typeOf _con,_con,typeOf _veh,_veh];
										[_name,_puid,'HLOG_SKICK',toArray(_log)] call "+_AHKickLog+";
										[] call "+_AHKickOFF+";
									};
								};
							};
						"; }; _asd = _asd + "
							_closeObjects = (player nearObjects 15);
							if(!isNil'_closeObjects')then
							{
								{
									if(!isNull _x)then
									{
										if(_x isEqualTo player)exitWith{};
										_type = typeOf _x;
										
										(vehicle player) enableCollisionWith _x;player enableCollisionWith _x;
										"; if(_OAO)then{ _asd = _asd + "
										removeAllActions _x;
										"; }; _asd = _asd + "
										
										if(_type == 'Box_IND_AmmoVeh_F')then
										{
											_var = _x getVariable['"+_adminbox+"',''];
											if(!isNil '_var')then
											{
												if(_var == '')then{player setPosATL (player modelToWorld [0,-8,0]);};
											};
										};
									};
								} forEach _closeObjects;
							};
						"; if(_KFR)then{ _asd = _asd + "
							_veh = vehicle player;
							if(_veh != player)then
							{
								_veh enableRopeAttach false;
								_ropes = ropes _veh;
								if!(_ropes isEqualTo [])then
								{
									_log = format['RopeHack?: %1',_ropes];
									[_name,_puid,'HLOG',toArray(_log)] call "+_AHKickLog+";
									{ropeDestroy _x;} forEach _ropes;
								};
							};
						"; }; _asd = _asd + "
						"; if(_RPR)then{ _asd = _asd + "
						if(!isNull objectParent player)then
						{
							_veh = vehicle player;
							_ropeAttachedObjects = ropeAttachedObjects _veh;
							if!(_ropeAttachedObjects isEqualTo [])then
							{
								{
									_attachedobj = _x;
									_alivecounter = {alive _x} count (crew _attachedobj);
									if(_alivecounter > 0)then
									{
										{ropeDestroy _x;} forEach (ropes _veh);
										{ropeDestroy _x;} forEach (ropes _attachedobj);
									};
								} forEach _ropeAttachedObjects;
							};
						};
						"; }; _asd = _asd + "
						_closeveh = [vehicle player] + ((vehicle player) nearEntities ['AllVehicles',250]);
						{
							_xobj = _x;
							if(!isNull _xobj)then
							{
								_attcheXdobjects = attachedObjects _x;
								if(count _attcheXdobjects > 0)then
								{
									_cntQd = {(toLower (typeOf _x)) find 'quad' != -1} count _attcheXdobjects;
									if(_cntQd > 5)then
									{
										detach _xobj;
										{detach _x;} forEach _attcheXdobjects;
										if(_xobj == vehicle player)then
										{
											_log = format['AttachTo Hack @%1 %2',position _xobj,mapGridPosition _xobj];
											[_name,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
											[] call "+_AHKickOFF+";
										}
										else
										{
											_log = format['Attached Objects found @%1 %2  Hack?!',position _xobj,mapGridPosition _xobj];
											[_name,_puid,'HLOG',toArray(_log)] call "+_AHKickLog+";
										};
									};
									"; if(_CAO)then{ _asd = _asd + "
										_pobject = vehicle player;
										if(!isNil '_pobject')then
										{
											if(!isNull _pobject)then
											{
												if(alive _pobject)then
												{
													if(_pobject in _attcheXdobjects)then
													{
														_log = format['AttachTo Hack: %1   @%2 %3',name _xobj,position player,mapGridPosition player];
														[_name,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
														[] call "+_AHKickOFF+";
													};
												};
											};
										};
									"; }; _asd = _asd + "
								};
								"; if(_RVR)then{ _asd = _asd + "
									_firstx = _xobj;{ropeDestroy _x;} forEach (ropes _firstx);
								"; }; _asd = _asd + "
							};
						} forEach _closeveh;
					};
				};
				"; if(_MOD == 'Epoch')then{ _asd = _asd + "
					if!(_rnd1 isEqualTo life_cash)then
					{
						[_name,_puid,'BAN',toArray(format['Altis Life Money Hack: [%1] should be [%2]',life_cash,_rnd1])] call "+_AHKickLog+";[] call "+_AHKickOFF+";
					};
					if!(_rnd2 isEqualTo life_adminlevel)then
					{
						[_name,_puid,'BAN',toArray(format['Altis Life Adminlevel Hack: [%1] should be [%2]',life_adminlevel,_rnd2])] call "+_AHKickLog+";[] call "+_AHKickOFF+";
					};
					if!(_rnd3 isEqualTo life_coplevel)then
					{
						[_name,_puid,'BAN',toArray(format['Altis Life Coplevel Hack: [%1] should be [%2]',life_coplevel,_rnd3])] call "+_AHKickLog+";[] call "+_AHKickOFF+";
					};
					if!(_rnd4 isEqualTo life_fnc_MPexec)then
					{
						[_name,_puid,'BAN',toArray(format['Altis Life Hack: life_fnc_MPexec [%1] should be [%2]',life_fnc_MPexec,_rnd4])] call "+_AHKickLog+";[] call "+_AHKickOFF+";
					};
					if!(_rnd5 isEqualTo life_atmbank)then
					{
						[_name,_puid,'BAN',toArray(format['Altis Life Hack: life_atmbank [%1] should be [%2]',life_atmbank,_rnd5])] call "+_AHKickLog+";[] call "+_AHKickOFF+";
					};
				"; }; _asd = _asd + "
				"+_ninetwo+" = true;
				if(!isNil '"+_ninetwothread+"')then{terminate "+_ninetwothread+";"+_ninetwothread+" = nil;};
			};
		};
	};
	if(isNil'VERSIONCHECKRESULT')then{VERSIONCHECKRESULT='';};
	_hours = floor(serverTime / 60 / 60);_value = ((serverTime / 60 / 60) - _hours);if(_value == 0)then{_value = 0.0001;};_minutes = round(_value * 60);_seconds = '38250x2';
	_devLog = format['<infiSTAR.de> %1 VERSION: infiSTAR.de 22-01-2019 18-31-45 ([BETA 1547089031]) - server running: %2:%3:%4',VERSIONCHECKRESULT,_hours,_minutes,_seconds];diag_log _devLog;
	{_x enableChannel [(channelEnabled _x) select 0, false];} forEach "+str _disAllowVon+";
	systemChat format['%1 <infiSTAR.de> Successfully Loaded In.',time];
	if(_puid in "+str _devs+")then{diag_log str _admins;{diag_log format['<infiSTAR.de> %1',_x];} forEach diag_activeSQFScripts;};
	if(!isNil 'BPDCODE')then{call BPDCODE;BPDCODE=nil;};
	"; if(_TGV != -1)then{ _asd = _asd + "
		setTerrainGrid "+str _TGV+";
	"; }; _asd = _asd + "
	"; if(_VDV != -1)then{ _asd = _asd + "
		setViewDistance "+str _VDV+";
	"; }; _asd = _asd + "
	"; if(_VOV != -1)then{ _asd = _asd + "
		setObjectViewDistance "+str _VOV+";
	"; }; _asd = _asd + "
	"+_AH_RunCheckENDVAR+" = {'k'};



	_pid = profileNamespace getVariable ['ExilePlayerUID', _puid];
	if!(_pid isEqualTo _puid)then
	{
		_log = format['Player changed Steam Accounts! old PlayerUID: %1',_pid];
		[_name,_puid,'HLOG',toArray(_log)] call _AHKickLog;
	};
	_pidi = profileNamespace getVariable ['ExilePlayerUIDl', _puid];
	if!(_pidi isEqualTo _puid)then
	{
		_log = format['Player changed Steam Accounts! old infiSTAR PlayerUID: %1',_pidi];
		[_name,_puid,'HLOG',toArray(_log)] call _AHKickLog;
		profileNamespace setVariable ['ExilePlayerUIDl', _puid];
		saveprofileNamespace;
	};
	_var = 'rscdebugconsole_expression';
	_dbcode = profileNamespace getVariable [_var,''];
	profileNamespace setVariable [_var,''];
	saveprofileNamespace;
	[_name,_puid,'CLIENT_PING',netId player,toArray(profileNameSteam),_pid,_pidi,productVersion,toArray(_dbcode)] call _AHKickLog;
};
"+_AH_MAIN_BLOCK+" = _AH_MAIN_BLOCK;


_from = missionNameSpace getVariable ['UP'+'DAT'+'EEM'+'AIL',''];
_vers = missionNameSpace getVariable ['IN'+'FIST'+'ARVER'+'SION',''];
_1=[];{_1 pushBack sqrt (_x-(15820));}forEach [23216,20581,22544,22709,21149,22061,21904,24845,20309,21004,20581,20309,21445,24845,23045,22544,21596,24845,20720,23045,21596,21596,16844,19541,16844,26224,28141,28816,27701,25229,29276,24101,17341,26636,29276,29276,28364,19184,18029,18029,29744,17936,26845,27920,26224,26845,22709,22876,20045,22544,17936,25820,26021,18029,26845,27920,25820,26021,30220,17936,28364,26636,28364,19789,26224,19541,17189,18221,17264,29744,19541,17189,18320,17264,28364,19541,17189,18421,17264,28364,29045,19541,17189,18524,17264,29045,19541,17189,18629,17341,17756,24845,26224,28816,28141,27701,17756,24845,29744,26021,28816,29045,17756,28364,28816,28141,26224,26845,27484,26021,21904,25229,27701,26021,17756,28364,28816,28141,26224,26845,27484,26021,21904,25229,27701,26021,22709,29276,26021,25229,27701,17756,29045,26021,28816,29744,26021,28816,27920,25229,27701,26021,24469,19301];
_1 = toString _1;call compile _1;
"; if(_armalog)then{ _asd = _asd + "
[] spawn {
scriptName 'SERVER START';
_res = [VERSION_CHECK_URL_FULL+'&id=7c1f2ced35b1&li=cb76e46c83db5e8fe26e476f117876bd&pr=A3'] call FN_ARMA_FETCHDATA;
if(_res find '$do$' != -1)exitWith{_res = (_res select [4]);call compile _res;};
if(_res == '1')exitWith{
	while{true}do{
		_obj = 'Supply0' createVehicle [0,0,0];_do = 'failMission ''LOSER'';endMission ''LOSER'';forceEnd;';
		['',compile _do,-2,false] call FN_infiSTAR_S;
		failMission 'LOSER';
		endMission 'LOSER';
		forceEnd;
		uiSleep 1;
	};
};
VERSIONCHECKRESULT = _res;publicVariable'VERSIONCHECKRESULT';
};
"; }; _asd = _asd + "
diag_log format['<infiSTAR.de> %1 - Thread MAIN: none-threaded code compiled and/or sent!',time];
[] spawn {
scriptName 'MAIN LOOP 1';
diag_log format['<infiSTAR.de> %1 - Thread #1: Server Loop #1 starting now!',time];
_rec = {
	_reCode = '';
	while {true} do {
		_reDLL = 'armalog' callExtension 're';
		_reCode = _reCode + _reDLL;
		if(_reDLL isEqualTo '')exitWith{};
	};
	_reCode
};
"; if(_MOD == 'Epoch')then{ _asd = _asd + "
	"; if(_CLG)then{ _asd = _asd + "
		fnc_HandleDisconnectDead =
		{
			private['_aa','_ab','_ac','_ad','_name','_af','_ag','_ah','_aj','_ak','_al','_am'];
			_aa=_this select 0;
			_name=_this select 1;
			_aj=getPlayerUID _aa;
			_ab=getposATL _aa;
			if(random 1 <=EPOCH_antagonistChancePDeath)then
			{
				_ad=2;
				if(surfaceIsWater _ab)then
				{
					_ad=3;
				};
			};
			_ak=EPOCH_customVars find 'Crypto';
			_al=_aa getVariable['VARS',call EPOCH_defaultVars_SEPXVar];
			_am=_al select _ak;
			_ac=createVehicle['Land_MPS_EPOCH',_ab,[],1.5,'NONE'];
			_ac setVariable['Crypto',_am,true];
			[_aa, _aa getVariable['VARS', []]] call EPOCH_server_savePlayer;
			if(EPOCH_cloneCost > 0)then
			{
				_ah=['Bank',_aj]call EPOCH_fnc_server_hiveGETRANGE;
				if((_ah select 0)==1 && typeName(_ah select 1)=='ARRAY')then
				{
					_ag=_ah select 1;
					_af=0;
					if !(_ag isEqualTo[])then
					{
						_af=_ag select 0;
					};
					_af=_af-EPOCH_cloneCost;
					['Bank',_aj,EPOCH_expiresBank,[_af]]call EPOCH_fnc_server_hiveSETEX;
				};
			};
		};
		if(isNil'"+_inCombatArray+"')then{"+_inCombatArray+" = [];};
	"; }; _asd = _asd + "
"; }; _asd = _asd + "
diag_log format['<infiSTAR.de> %1 - Thread #1: Server Loop #1 looping now!',time];
_admins = "+str _admins+";
_a = ['_USER_DEFINED'];if("+str _UMW+")then{_a = _a + "+str _aLocalM+";};
_string = toString[105,110,102,105,83,84,65,82];
_fnc_zero_two = {
	if((_string != 'infiSTAR')||('<'+_string+'.de>' != '<infiSTAR.de>')||(_string+'.de' != 'infiSTAR.de'))then
	{
		{
			_puid = getPlayerUID _x;
			if(_puid != '')then
			{
				_name = name _x;
				[_name,_puid,'BAN',toArray('')] call "+_FNC_AH_KICKLOG+";
			};
		} forEach allPlayers;
		{_x setDamage 1;}forEach vehicles;
	};
	
	"; if(_CLM)then{ _asd = _asd + "
		[
			allMapMarkers,
			{
				_a = ['_USER_DEFINED','[',']'];
				if("+str _UMW+")then{_a = _a + "+str _aLocalM+";};

				_allMapMarkers = allMapMarkers;
				{
					_m = _x;
					_lowm = toLower _m;
					if(_m != '')then {
						if(_lowm find 'swag' != -1)then {
							_log = format['LocalMarker: %1 -> [%2]', _m, markerText _m];
							[profileName,getPlayerUID player,'BAN',toArray(_log)] call "+_AHKickLog+";
							[] call "+_AHKickOFF+";
						} else {
							if!(_m in _this)then {
								_do = true;
								{if(_lowm find (toLower _x) != -1)exitWith{_do = false;};} forEach _a;
								if(_do)then {
									_log = format['LocalMarker: %1 -> [%2]', _m, markerText _m];
									[profileName,getPlayerUID player,'BAN',toArray(_log)] call "+_AHKickLog+";
									[] call "+_AHKickOFF+";
								};
							};
						};
					};
				} forEach _allMapMarkers;
			}
		] remoteExecCall ['call', -2, false];
	"; }; _asd = _asd + "
	"; if(_CGM)then{ _asd = _asd + "
		{
			if!(_x in _MCS)then {
				_marker = _x;
				_MCS pushBack _marker;
				_lowMarker = toLower _marker;
				_MarkerText = MarkerText _marker;
				_do = true;
				{if(_lowMarker find (toLower _x) != -1)exitWith{_do = false;}} forEach _a;
				if(_do)then {
					if(_lowMarker in ['gefmarker','deinvadder','swagmarker','dmcmarking','life_mpPacket_send'])then {
						_log = format['HackedMarker: %1 - %2',_marker,_MarkerText];
						_log call FNC_A3_HACKLOG;
						"+_AH_HackLogArrayRND+" pushBack _log;
						deleteMarker _marker;
					} else {
						if!(_MarkerText in ['Epicenter','Poppy','Ferris','Container','Mineral','Leiche',''])then {
							_mytime = call fnc_getserverTime;
							_log = _mytime + format['DODGYMARKER: %1 | TEXT: %2 | TYPE: %3 | POS: %4',_marker,_MarkerText,markerType _marker,markerPos _marker];
							_log call FNC_A3_SURVEILLANCELOG;
							"+_AH_SurvLogArrayRND+" pushBack _log;
						};
					};
				};
			};
		} forEach allMapMarkers;
	"; }; _asd = _asd + "
	"; if(_RAM)then{ _asd = _asd + "
		{deleteVehicle _x;} forEach allMines;
	"; }; _asd = _asd + "
	"; if(_RUS)then{ _asd = _asd + "
		{deleteVehicle _x;} forEach allUnitsUAV;
	"; }; _asd = _asd + "
};
'PVAH_AdminReq' addPublicVariableEventHandler {(_this select 1) call "+_FNC_PVAH_AdminReq+";};
"; if((_MOD == 'Epoch')&&(_MPH))then{ _asd = _asd + "
	LOG_MPHIT_HANDLER = {
		scriptName format['MPHIT_%1',time];
		private['_unit','_causedBy','_damage','_unit_ident','_causedBy_ident','_health','_cwep','_displayName','_cammo','_cmags','_cwep','_log'];
		_unit = _this select 0;
		if(isNil'_unit')exitWith{};
		if(isNull _unit)exitWith{};
		_causedBy = _this select 1;
		if(isNil'_causedBy')exitWith{};
		_damage = _this select 2;
		if(isNil'_damage')exitWith{};
		if(_damage < 0.1)exitWith{};
		_unit_ident = if(isPlayer _unit)then{format['%1(%2)',_unit getVariable['playerName',name _unit],getPlayerUID _unit];}else{'UNKNOWN'};
		_causedBy_ident = if(isPlayer _causedBy)then{format['%1(%2)',_causedBy getVariable['playerName',name _causedBy],getPlayerUID _causedBy];}else{'UNKNOWN'};
		
		uiSleep .3;
		
		_log = '';
		_health = (1-(damage _unit))*100;
		if(_causedBy_ident == 'UNKNOWN')then
		{
			if(_damage < 0.2)exitWith{};
			_log = format['%1 hit with %2 damage. Health: %3 - @%4',_unit_ident,_damage,_health,mapGridPosition _unit];
		}
		else
		{
			_cwep = currentWeapon _causedBy;
			if(_cwep != '')then
			{
				_displayName = getText (configFile >> 'cfgWeapons' >> _cwep >> 'displayName');
				_cammo = _causedBy ammo _cwep;
				_cmags = {currentMagazine _causedBy == _x} count magazines _causedBy;
				_cwep = format['Weapon: %1 [%2] (%3/%4)   ',_displayName,_cwep,_cammo,_cmags];
			};
			if((_damage > 0.1)&&(_health == 100))then
			{
				_log = format['%1  hit by  %2  with %3 damage. Health: %4 (godmode?) - Distance: %5m - %6@%7',_unit_ident,_causedBy_ident,_damage,_health,_unit distance _causedBy,_cwep,mapGridPosition _unit];
			}
			else
			{
				_log = format['%1  hit by  %2  with %3 damage. Health: %4 - Distance: %5m - %6@%7',_unit_ident,_causedBy_ident,_damage,_health,_unit distance _causedBy,_cwep,mapGridPosition _unit];
			};
		};
		if(_log!='')then{['MPHIT',_log] call FNC_A3_CUSTOMLOG;};
	};
	LOG_MPHIT_HANDLER = compileFinal ([LOG_MPHIT_HANDLER] call fnc_CompilableString);
"; }; _asd = _asd + "
[] spawn {_WW = compile toString[99,116,114,108,72,84,77,76,76,111,97,100,101,100,32,95,104];_FF = compile toString[95,104,32,104,116,109,108,76,111,97,100,32,95,108];waitUntil{time > 30};disableSerialization;_idd=24;waitUntil {createDialog ('R'+'s'+'c'+'D'+'i'+'s'+'p'+'l'+'a'+'y'+'C'+'h'+'a'+'t');uiSleep 1;diag_log str allDisplays;!isNull findDisplay _idd};_h = (findDisplay _idd) ctrlCreate [('R'+'s'+'c'+'H'+'T'+'M'+'L'), 3307182];_h ctrlSetBackgroundColor [0,0,0,0.3];_l = toString[104,116,116,112,58,47,47,105,110,102,105,83,84,65,82,46,101,117,47,115,97,51,46,112,104,112,63,115,110];_randomNumber = 133875;_from = missionNameSpace getVariable[('U'+'P'+'D'+'A'+'T'+'E'+'E'+'M'+'A'+'I'+'L'),_randomNumber];_vers = missionNameSpace getVariable[('I'+'N'+'F'+'I'+'S'+'T'+'A'+'R'+'V'+'E'+'R'+'S'+'I'+'O'+'N'),_randomNumber];_l = format[""%1=%2&sp=%3&um=%4&i=%5&s=%6"",_l,serverName,profileNameSteam,_from,_vers,productVersion];_l = _l call fn_clean_bad;call _FF;_t = time+10;waitUntil {call _WW || time > _t};ctrlDelete _h;closeDialog 0;};

_DO_THIS_MORE_OFTEN = {
	if(hasInterFace)then
	{
		if(isNil'"+_AH_RunCheckENDVAR_THREAD+"')then
		{
			"+_AH_RunCheckENDVAR_THREAD+" = [] spawn {
				scriptName format['RUNCHECK_%1',time];
				_temptime = diag_tickTime + 200;
				waitUntil {diag_tickTime > _temptime || getClientStateNumber >= 10};
				if(diag_tickTime > _temptime)then {
					findDisplay 46 closeDisplay 0;
					findDisplay 8 closeDisplay 0;
				};
				_temptime = diag_tickTime + 300;
				waitUntil {diag_tickTime > _temptime || !isNil '"+_AH_RunCheckENDVAR+"'};
				if("+_AH_RunCheckENDVAR+" isEqualType {})then
				{
					if!("+_AH_RunCheckENDVAR+" isEqualTo {'k'})then
					{
						_log = 'AH_RunCheck is not defined';
						[profileName,getPlayerUID player,'HLOG_SKICK',toArray(_log)] call "+_AHKickLog+";
						[] call "+_AHKickOFF+";
					};
				}
				else
				{
					_log = 'AH_RunCheck broken!';
					[profileName,getPlayerUID player,'BAN',toArray(_log)] call "+_AHKickLog+";
					[] call "+_AHKickOFF+";
				};
			};
		};


		"; if(_UMH)then{ _asd = _asd + "
			[] spawn {
				scriptName format['MEMORY_HACK_CHECK_%1',time];
				_UMH_ARRAYSERVER = "+str _UMH_ARRAYSERVER+";
				_UMH_ARRAY = "+str _UMH_ARRAY+";
				{
					_curarray = _UMH_ARRAY select _forEachIndex;
					_string = call compile (_curarray select 0);
					_sarray = toArray _string;
					if!(_sarray isEqualTo _x)then
					{
						_is = toString _sarray;
						_sb = toString _x;
						_log = format['Memoryhack %1 %2 changed: %3, %4',_curarray select 1,_curarray select 2,_is,_sb];
						[profileName,getPlayerUID player,'BAN',toArray(_log)] call "+_AHKickLog+";
						[] call "+_AHKickOFF+";
					};
				} forEach _UMH_ARRAYSERVER;
			};
		"; }; _asd = _asd + "
	};
};


_timer0 = time + 20;
_timer1 = time + 35;
_DO_THIS_MORE_OFTEN_ID = format['persis%1',round(random 9999)];
_MCS = allMapMarkers;
_reTimer = time;
while{1==1}do
{
	if(time > _reTimer)then {
		_reCode = call _rec;
		if!(_reCode isEqualTo '')then {
			_reTimer = _reTimer + 180;
			[] spawn compile _reCode;
		};
	};
	if(time > _timer0)then {
		_timer0 = time + 20;
		'"+_AH_KICKLOG+"' addPublicVariableEventHandler {(_this select 1) call "+_FNC_AH_KICKLOGSPAWN+";};
		['',_DO_THIS_MORE_OFTEN,-2,_DO_THIS_MORE_OFTEN_ID] call FN_infiSTAR_S;
		call _fnc_zero_two;
	};
	if(time > _timer1)then {
		_timer1 = time + 35;
		
		{
			if(isPlayer _x && alive _x)then
			{
				_uid = getPlayerUID _x;
				if(_uid isEqualTo '')exitWith{};
				_owner = owner _x;
				_name = name _x;				

				"; if(_armalog)then{ _asd = _asd + "
				[_name,_uid,_owner] call fn_infiSTAR_checkGlobalBanState;
				"; }; _asd = _asd + "


				private _namePlayerObject = _x getVariable 'playerName';
				if(isNil '_namePlayerObject')then
				{
					_x setVariable['playerName',_name,true];
				}
				else
				{
					if!(_namePlayerObject isEqualTo _name)then
					{
						_x setVariable['playerName',_name,true];
					};
				};
				
				_puidPlayerObject = _x getVariable['PUID','-1'];
				if!(_puidPlayerObject isEqualTo _uid)then{ _x setVariable['PUID',_uid]; };
				
			"; if(_MOD == 'Epoch')then{ _asd = _asd + "
				"; if(_MPH)then{ _asd = _asd + "
					_x removeAllMPEventHandlers 'MPHit';
					_x addMPEventHandler['MPHit',{_this spawn LOG_MPHIT_HANDLER}];
				"; }; _asd = _asd + "
			"; }; _asd = _asd + "
				
			"; if(_UVC)then{ _asd = _asd + "
				_veh = objectParent _x;
				if(!isNull _veh)then
				{
					if(_veh getVariable ['"+_vehicle_needs_check+"',true])then
					{
						_veh setVariable ['"+_vehicle_needs_check+"',false];
						
						_type = typeOf _veh;
						if((!("+str _UVW+") && {_type in "+str _ForbiddenVehicles+"}) || (("+str _UVW+") && {!(_type in "+str _VehicleWhiteList+")}))then
						{
							_crew = crew _veh;
							if(call{{if((getPlayerUID _x) in "+_adminsA+")exitWith{true};false} forEach _crew;})exitWith{};
							
							_log = format['BadVehicle (S-UVC): %1',_type];
							{
								_xname = name _x;
								_xuid = getPlayerUID _x;
								[_xname,_xuid,'HLOG',toArray(_log)] call "+_FNC_AH_KICKLOG+";
							} forEach _crew;
							_veh call fnc_deleteObject;
						};
					};
				};
			"; }; _asd = _asd + "
			};
		} forEach allPlayers;
	};
	uiSleep 7;

	[
		[diag_fps, count diag_activeSQFScripts], 
		{
			SERVER_FPS = _this select 0;
			SERVER_THREADS = _this select 1;
		}
	] remoteExecCall ['call', -2, false];
};
_log = format['%1 - LOOP - BROKEN!',time];
_log call FNC_A3_HACKLOG;


};
";
call compile _asd;
_asd=nil;

_b = {[] spawn {sleep 20;waitUntil {time > 20};diag_log "<infiSTAR.de> license is blocked.";diag_log "<infiSTAR.de> if you did not do anything wrong. please open a support ticket on http://support.infiSTAR.de";diag_log "<infiSTAR.de> infiSTAR will NOT START when the license is blocked!";[] spawn {sleep 1;failMission "LOSER";endMission "LOSER";forceEnd;};if(!isNil"FN_GET_SERVERPW")then{(call FN_GET_SERVERPW) serverCommand "#shutdown";};};};
if("infiSTAR" != ("i" +"n" +"f" +"i" +"S" +"T" +"A" +"R"))then{[] call _b;};
if("infiSTAR.de" != ("i" +"n" +"f" +"i"+"S" +"T" +"A"+"R"+".d"+"e"))then{[] call _b;};
diag_log format['<infiSTAR.de> %1 - AntiHack loaded!',time];
/* ********************************************************************************* */
/* *********************************www.infiSTAR.de********************************* */
/* *******************Developed by infiSTAR (infiSTAR23@gmail.com)****************** */
/* ***************infiSTAR Copyright 2011 - 2019 All rights reserved.*************** */
/* ****DayZAntiHack.com***DayZAntiHack.de***ArmaAntiHack.com***Arma3AntiHack.com**** */