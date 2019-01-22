/*
	File: A3AT.sqf
	Author: Chris(tian) 'infiSTAR' Lorenzen
	Contact: infiSTAR23@gmail.com
	
	Description:
	Arma AntiHack & AdminTools - infiSTAR.de
*/
/* *******************Developer : infiSTAR (infiSTAR23@gmail.com)******************* */
/* ***************infiSTAR Copyright 2011 - 2019 All rights reserved.*************** */
/* *********************************www.infiSTAR.de********************************* */



comment 'Antihack & AdminTools - Christian Lorenzen - www.infiSTAR.de - License: (CC)';
VERSION_DATE_IS = '22-01-2019 18-31-45';
infiSTAR_MAIN_CODE = "
fnc_admin_c = compile 'compile _this';
fnc_admin_cc = compile 'call compile _this';
fnc_admin_ccc = compile 'if(!isNil {call compile _this})then{call compile _this}else{''ANY''}';
fnc_createctrl = {
	params['_display','_type','_idc'];
	ctrlDelete (_display displayCtrl _idc);
	_ctrl = _display ctrlCreate[_type, _idc];
	_ctrl
};
FN_SHOW_LOGID = 554466;
FN_SHOWN_LOGIDS = [];
FN_SHOW_LOG = {
	disableSerialization;
	_del = {FN_SHOWN_LOGIDS = FN_SHOWN_LOGIDS - [_this];ctrlDelete _this;};
	{
		if(_forEachIndex < 3)then
		{
			if(count FN_SHOWN_LOGIDS > 40)then{_x call _del;};
		}
		else
		{
			if(ctrlFade _x > 0.9)then{_x call _del;};
		};
	} forEach FN_SHOWN_LOGIDS;
	_ctrl = [findDisplay 46,'RSCText',FN_SHOW_LOGID] call fnc_createctrl;
	FN_SHOW_LOGID = FN_SHOW_LOGID + 1;
	FN_SHOWN_LOGIDS pushBackUnique _ctrl;
	{
		_x ctrlSetPosition [
			0,
			((safeZoneY+0.3) + (_forEachIndex / 30)),
			1.3,
			0.2
		];
		_x ctrlCommit 0;
	} forEach FN_SHOWN_LOGIDS;
	_ctrl ctrlSetText format['<infiSTAR.de> %1',_this];
	_ctrl ctrlSetFade 1;
	_ctrl ctrlCommit 5;
};
MYPUIDinfiESP = getPlayerUID player;
ALT_IS_PRESSED=false;FILLMAINSTATE=0;LASTSUBBUTTON=1;
SortAlphaPlease = true;SortGroupsPlease = nil;SortRangePlease = nil;
infiSTAR_add_vehicles=true;
SELECTED_TARGET_PLAYER = player;
show_spectate_overlay = true;
MAIN_DISPLAY_ID = -1338;LEFT_CTRL_ID = 1500;RIGHT_CTRL_ID = 1501;
draw_infiESPIcon = getText(configfile >> 'cfgGroupIcons' >> 'Empty' >> 'icon');
uiNamespace setVariable['A3MAPICONS_mainMap', nil];
uiNamespace setVariable['A3MAPICONS_mainMap', findDisplay 12 displayCtrl 51];
if(isNil 'AH_HackLogArray')then{AH_HackLogArray = [];};
if(isNil 'AH_SurvLogArray')then{AH_SurvLogArray = [];};
if(isNil 'AH_AdmiLogArray')then{AH_AdmiLogArray = [];};
if(isNil 'infiSTAR_toggled_A')then{infiSTAR_toggled_A = ['==== OnTarget ====','==== Toggleable ===='];};
if(infiSTAR_MOD == 'Epoch')then
{
	if(isNil 'infiSTAR_ALLOW_ON_EPOCH')then
	{
		infiSTAR_ALLOW_ON_EPOCH = ['Epoch','B_Parachute','Binocular','Rangefinder','Hatchet','MeleeSledge','ChainSaw','MultiGun','Rollins_F'];
		{
			infiSTAR_ALLOW_ON_EPOCH pushBack format['B_AssaultPack_%1',_x];
		} forEach ['cbr','dgtl','khk','mcamo','ocamo','rgr','sgg'];
		{
			infiSTAR_ALLOW_ON_EPOCH pushBack format['B_Carryall_%1',_x];
		} forEach ['cbr','khk','mcamo','ocamo','oli','oucamo'];
		{
			infiSTAR_ALLOW_ON_EPOCH pushBack format['B_FieldPack_%1',_x];
		} forEach ['blk','cbr','khk','ocamo','oli','oucamo'];
		{
			infiSTAR_ALLOW_ON_EPOCH pushBack format['B_Kitbag_%1',_x];
		} forEach ['cbr','mcamo','rgr','sgg'];
		{
			infiSTAR_ALLOW_ON_EPOCH pushBack format['B_TacticalPack_%1',_x];
		} forEach ['blk','mcamo','ocamo','oli','rgr'];
		{
			infiSTAR_ALLOW_ON_EPOCH pushBack format['smallbackpack_%1_epoch',_x];
		} forEach ['red','green','teal','pink'];
		{
			infiSTAR_ALLOW_ON_EPOCH pushBack format['%1_epoch',_x];
		} forEach ['ruger_pistol','speargun','1911_pistol','akm','m14','M14Grn','m16','m16Red','m107','m107Tan','m249','m249Tan','m4a3'];
		{
			infiSTAR_ALLOW_ON_EPOCH pushBack format['SMG_%1_F',_x];
		} forEach ['01','02'];
		{
			infiSTAR_ALLOW_ON_EPOCH pushBack format['SMG_%1_F',_x];
		} forEach ['01','02'];
		{
			infiSTAR_ALLOW_ON_EPOCH pushBack format['hgun_%1_F',_x];
		} forEach ['PDW2000','ACPC2','Rook40','P07','Pistol_heavy_01','Pistol_heavy_02','Pistol_Signal'];
		{
			infiSTAR_ALLOW_ON_EPOCH pushBack format['LMG_%1_F',_x];
		} forEach ['Mk200','Zafir'];
		{
			infiSTAR_ALLOW_ON_EPOCH pushBack format['srifle_%1_F',_x];
		} forEach ['EBR','GM6','LRR','DMR_01'];
		{
			infiSTAR_ALLOW_ON_EPOCH pushBack format['arifle_%1_F',_x];
		} forEach ['Katiba','Katiba_C','Katiba_GL','SDAR','TRG21','TRG20','TRG21_GL','Mk20','Mk20C','Mk20C_plain','Mk20_GL','Mk20_plain','Mk20_GL_plain'];
		{
			infiSTAR_ALLOW_ON_EPOCH pushBack format['arifle_%1_F',_x];
		} forEach ['MXC','MX','MX_GL','MXM','MXM_Black','MX_GL_Black','MX_Black','MXC_Black','MX_SW','MX_SW_Black'];
		{
			infiSTAR_ALLOW_ON_EPOCH pushBack (typeOf _x);
		} forEach vehicles;
	};
	fnc_infiSTAR_checkEpoch =
	{
		_stringtocheck = _this;
		if(isClass(getmissionconfig 'CfgPricing' >> _stringtocheck))exitWith{true};
		if(_stringtocheck in infiSTAR_ALLOW_ON_EPOCH)exitWith{true};
		false
	};
};
if(isNil 'ALL_BAGS_TO_SEARCH_C')then
{
	ALL_BAGS_TO_SEARCH_C = [];ALL_BAGS_TO_SEARCH_EPOCH = [];ALL_BAGS_TO_SEARCH_NONEEPOCH = [];
	ALL_VEHS_TO_SEARCH_C = [];ALL_VEHS_TO_SEARCH_EPOCH = [];ALL_VEHS_TO_SEARCH_NONEEPOCH = [];
	ALL_OBJS_TO_SEARCH_C = [];ALL_OBJS_TO_SEARCH_EPOCH = [];ALL_OBJS_TO_SEARCH_NONEEPOCH = [];
	ALL_WEPS_TO_SEARCH_C = [];ALL_WEPS_TO_SEARCH_EPOCH = [];ALL_WEPS_TO_SEARCH_NONEEPOCH = [];
	ALL_MAGS_TO_SEARCH_C = [];ALL_MAGS_TO_SEARCH_EPOCH = [];ALL_MAGS_TO_SEARCH_NONEEPOCH = [];
	_cfg = configFile >> 'cfgVehicles';
	for '_j' from 0 to (count _cfg)-1 do
	{
		_c = _cfg select _j;
		if(isClass _c)then
		{
			_t = configName _c;
			if(toLower _t find '_base' isEqualTo -1)then
			{
				_BackPack = getText(configfile >> 'CfgVehicles' >> _t >> 'vehicleClass') == 'BackPacks';
				if(_BackPack)then
				{
					if(infiSTAR_MOD == 'Epoch')then{if(_t call fnc_infiSTAR_checkEpoch)then{ALL_BAGS_TO_SEARCH_EPOCH pushBack _t;} else {ALL_BAGS_TO_SEARCH_NONEEPOCH pushBack _t;};};
					ALL_BAGS_TO_SEARCH_C pushBack _t;
				}
				else
				{
					if((_t isKindOf 'Air') || (_t isKindOf 'LandVehicle') || (_t isKindOf 'Ship'))then
					{
						_pic = getText(_c >> 'picture');
						if!((toLower _pic) in ['','pictureheal','picturepapercar','picturething','picturestaticobject'])then
						{
							if(infiSTAR_MOD == 'Epoch')then{if(_t call fnc_infiSTAR_checkEpoch)then{ALL_VEHS_TO_SEARCH_EPOCH pushBack _t;} else {ALL_VEHS_TO_SEARCH_NONEEPOCH pushBack _t;};};
							ALL_VEHS_TO_SEARCH_C pushBack _t;
						};
					}
					else
					{
						if((_t isKindOf 'Building') || (_t isKindOf 'ThingX') || (_t isKindOf 'Constructions_static_F') || (_t isKindOf 'Constructions_foundation_F'))then
						{
							_lt = toLower _t;
							if((_lt find 'weapon' == -1) && (_lt find 'proxy' == -1))then
							{
								if(infiSTAR_MOD == 'Epoch')then{if(_t call fnc_infiSTAR_checkEpoch)then{ALL_OBJS_TO_SEARCH_EPOCH pushBack _t;} else {ALL_OBJS_TO_SEARCH_NONEEPOCH pushBack _t;};};
								ALL_OBJS_TO_SEARCH_C pushBack _t;
							};
						};
					};
				};
			};
		};
	};
	_cfg = configFile >> 'CfgWeapons';
	for '_i' from 0 to (count _cfg)-1 do
	{
		_c = _cfg select _i;
		if(isClass _c)then
		{
			_t = configName _c;
			if(toLower _t find '_base' isEqualTo -1)then
			{
				if((getText(_c >> 'displayName') != '') && {getText(_c >> 'picture') != ''} && {getNumber(_c >> 'scope') in [0,2]})then
				{
					if(infiSTAR_MOD == 'Epoch')then{if(_t call fnc_infiSTAR_checkEpoch)then{ALL_WEPS_TO_SEARCH_EPOCH pushBack _t;} else {ALL_WEPS_TO_SEARCH_NONEEPOCH pushBack _t;};};
					ALL_WEPS_TO_SEARCH_C pushBack _t;
				};
			};
		};
	};
	_cfg = configFile >> 'cfgmagazines';
	for '_i' from 0 to (count _cfg)-1 do
	{
		_c = _cfg select _i;
		if(isClass _c)then
		{
			_t = configName _c;
			if(toLower _t find '_base' isEqualTo -1)then
			{
				if((getText(_c >> 'displayName') != '') && {getText(_c >> 'picture') != ''} && {getNumber(_c >> 'scope') in [0,2]})then
				{
					if(infiSTAR_MOD == 'Epoch')then{if(_t call fnc_infiSTAR_checkEpoch)then{ALL_MAGS_TO_SEARCH_EPOCH pushBack _t;} else {ALL_MAGS_TO_SEARCH_NONEEPOCH pushBack _t;};};
					ALL_MAGS_TO_SEARCH_C pushBack _t;
				};
			};
		};
	};
	ALLC_TO_SEARCH = ALL_BAGS_TO_SEARCH_C+ALL_VEHS_TO_SEARCH_C+ALL_OBJS_TO_SEARCH_C+ALL_WEPS_TO_SEARCH_C+ALL_MAGS_TO_SEARCH_C;
};
"; if(_MOD == 'AltisLife')then{ infiSTAR_MAIN_CODE = infiSTAR_MAIN_CODE + "
	if(isNil'VIRTUAL_ITEMS_ARRAY')then
	{
		VIRTUAL_ITEMS_ARRAY = [];
		_cfg = missionconfigfile >> 'VirtualItems';
		for '_i' from 0 to (count _cfg)-1 do
		{
			_c = _cfg select _i;
			if(isClass _c)then
			{
				_t = configName _c;
				VIRTUAL_ITEMS_ARRAY pushBack _t;
			};
		};
	};
"; }; infiSTAR_MAIN_CODE = infiSTAR_MAIN_CODE + "
_log = '<infiSTAR.de> config data loaded...!';diag_log _log;
fn_infiSTARAdmin_setFocus = {
	disableSerialization;
	ctrlSetFocus ((findDisplay MAIN_DISPLAY_ID) displayCtrl LEFT_CTRL_ID);
	ctrlSetFocus ((findDisplay MAIN_DISPLAY_ID) displayCtrl RIGHT_CTRL_ID);
};
fnc_MouseButtonDown = {
	if(_this select 1 == 0)then
	{
		_pos = ((_this select 0) posScreenToWorld [_this select 2, _this select 3]);
		if(ALT_IS_PRESSED)then
		{
			_veh = vehicle player;
			if(_veh == player)then
			{
				_veh setPosATL _pos;
			}
			else
			{
				if(_veh isKindOf 'AIR')then
				{
					_posObj = getPosATL _veh;
					_pos = [_pos select 0,_pos select 1,_posObj select 2];
				};
				[1,player,_veh,_pos] call fnc_AdminReq;
			};
			ALT_IS_PRESSED = false;
			format['Teleport to %1(GPS: %2)',_pos,mapGridPosition _pos] call fnc_adminLog;
			{player reveal _x;} foreach (_pos nearObjects 50);
		};
		if(!isNil 'CALLED_EMP')then
		{
			CALLED_EMP = nil;
			_pos call fnc_callEMP;
		};
		if(!isNil 'fnc_getParachutePos')then
		{
			_pos call fnc_getParachutePos;
		};
	};
};
fnc_addpic = {
	_status = call {
		if(isClass (configFile >> 'CfgWeapons' >> _this))exitWith{'CfgWeapons'};
		if(isClass (configFile >> 'CfgMagazines' >> _this))exitWith{'CfgMagazines'};
		if(isClass (configFile >> 'CfgVehicles' >> _this))exitWith{'CfgVehicles'};
		'';
	};
	if!(_status isEqualTo '')then
	{
		_pic = (getText (configFile >> _status >> _this >> 'picture'));
		if!(_pic isEqualTo '')then
		{
			_ctrl lbSetPicture [(lbsize _ctrl)-1,_pic];
			_ctrl lbSetPictureColor [(lbsize _ctrl)-1,[1, 1, 1, 1]];
		};
	};
};
fnc_search = {
	[
		_txt,
		{
			_txt = _this;
			if(_txt == lastSearched)exitWith{};
			disableSerialization;
			_ctrl = (findDisplay MAIN_DISPLAY_ID) displayCtrl RIGHT_CTRL_ID;
			lbClear _ctrl;
			if(LASTSUBBUTTON isEqualTo 0)then
			{
			if('==== Weapons ====' call ADMINLEVELACCESS)then
			{
				_ctrl lbAdd '==== Weapons ====';
				if(!isNil 'infiSTAR_add_weapons')then
				{
					if(infiSTAR_MOD == 'Epoch')then
					{
						_ctrl lbAdd '   ==== Epoch Weapons ====';
						{
							_displayName = getText(configFile >> 'CfgWeapons' >> _x >> 'displayName');
							if(((toLower _x) find _txt > -1)||((toLower _displayName) find _txt > -1))then{
								_ctrl lbAdd format['%1 (%2)',_displayName,_x];
								_x call fnc_addpic;
								_ctrl lbSetData [(lbsize _ctrl)-1,_x];
							};
						} forEach ALL_WEPS_TO_SEARCH_EPOCH;
						_ctrl lbAdd '   ==== Other Weapons ====';
						{
							_displayName = getText(configFile >> 'CfgWeapons' >> _x >> 'displayName');
							if(((toLower _x) find _txt > -1)||((toLower _displayName) find _txt > -1))then{
								_ctrl lbAdd format['%1 (%2)',_displayName,_x];
								_x call fnc_addpic;
								_ctrl lbSetData [(lbsize _ctrl)-1,_x];
								_ctrl lbSetColor [(lbsize _ctrl)-1,[1,0,0,1]];
							};
						} forEach ALL_WEPS_TO_SEARCH_NONEEPOCH;
					}
					else
					{
						{
							_displayName = getText(configFile >> 'CfgWeapons' >> _x >> 'displayName');
							if(((toLower _x) find _txt > -1)||((toLower _displayName) find _txt > -1))then{
								_ctrl lbAdd format['%1 (%2)',_displayName,_x];
								_x call fnc_addpic;
								_ctrl lbSetData [(lbsize _ctrl)-1,_x];
							};
						} forEach ALL_WEPS_TO_SEARCH_C;
					};
				};
			};
			if('==== Magazines ====' call ADMINLEVELACCESS)then
			{
				_ctrl lbAdd '==== Magazines ====';
				if(!isNil 'infiSTAR_add_magazines')then
				{
					if(infiSTAR_MOD == 'Epoch')then
					{
						_ctrl lbAdd '   ==== Epoch Magazines ====';
						{
							_displayName = getText(configFile >> 'CfgMagazines' >> _x >> 'displayName');
							if(((toLower _x) find _txt > -1)||((toLower _displayName) find _txt > -1))then{
								_ctrl lbAdd format['%1 (%2)',_displayName,_x];
								_x call fnc_addpic;
								_ctrl lbSetData [(lbsize _ctrl)-1,_x];
							};
						} forEach ALL_MAGS_TO_SEARCH_EPOCH;
						_ctrl lbAdd '   ==== Other Magazines ====';
						{
							_displayName = getText(configFile >> 'CfgMagazines' >> _x >> 'displayName');
							if(((toLower _x) find _txt > -1)||((toLower _displayName) find _txt > -1))then{
								_ctrl lbAdd format['%1 (%2)',_displayName,_x];
								_x call fnc_addpic;
								_ctrl lbSetData [(lbsize _ctrl)-1,_x];
								_ctrl lbSetColor [(lbsize _ctrl)-1,[1,0,0,1]];
							};
						} forEach ALL_MAGS_TO_SEARCH_NONEEPOCH;
					}
					else
					{
						{
							_displayName = getText(configFile >> 'CfgMagazines' >> _x >> 'displayName');
							if(((toLower _x) find _txt > -1)||((toLower _displayName) find _txt > -1))then{
								_ctrl lbAdd format['%1 (%2)',_displayName,_x];
								_x call fnc_addpic;
								_ctrl lbSetData [(lbsize _ctrl)-1,_x];
							};
						} forEach ALL_MAGS_TO_SEARCH_C;
					};
				};
			};
			if('==== Bags ====' call ADMINLEVELACCESS)then
			{
				_ctrl lbAdd '==== Bags ====';
				if(!isNil 'infiSTAR_add_bags')then
				{
					if(infiSTAR_MOD == 'Epoch')then
					{
						_ctrl lbAdd '   ==== Epoch Bags ====';
						{
							_displayName = getText(configFile >> 'CfgVehicles' >> _x >> 'displayName');
							if(((toLower _x) find _txt > -1)||((toLower _displayName) find _txt > -1))then{
								_ctrl lbAdd format['%1 (%2)',_displayName,_x];
								_x call fnc_addpic;
								_ctrl lbSetData [(lbsize _ctrl)-1,_x];
							};
						} forEach ALL_BAGS_TO_SEARCH_EPOCH;
						_ctrl lbAdd '   ==== Other Bags ====';
						{
							_displayName = getText(configFile >> 'CfgVehicles' >> _x >> 'displayName');
							if(((toLower _x) find _txt > -1)||((toLower _displayName) find _txt > -1))then{
								_ctrl lbAdd format['%1 (%2)',_displayName,_x];
								_x call fnc_addpic;
								_ctrl lbSetData [(lbsize _ctrl)-1,_x];
								_ctrl lbSetColor [(lbsize _ctrl)-1,[1,0,0,1]];
							};
						} forEach ALL_BAGS_TO_SEARCH_NONEEPOCH;
					}
					else
					{
						{
							_displayName = getText(configFile >> 'CfgVehicles' >> _x >> 'displayName');
							if(((toLower _x) find _txt > -1)||((toLower _displayName) find _txt > -1))then{
								_ctrl lbAdd format['%1 (%2)',_displayName,_x];
								_x call fnc_addpic;
								_ctrl lbSetData [(lbsize _ctrl)-1,_x];
							};
						} forEach ALL_BAGS_TO_SEARCH_C;
					};
				};
			};
			"; if(_MOD == 'AltisLife')then{ infiSTAR_MAIN_CODE = infiSTAR_MAIN_CODE + "
				_ctrl lbAdd '==== VirtualItems ====';
				if(!isNil 'infiSTAR_add_VirtualItems')then
				{
					{
						if((toLower _x) find _txt > -1)then
						{
							_ctrl lbAdd format['%1',_x];
							_ctrl lbSetPicture [(lbsize _ctrl)-1,(getText(missionconfigfile >> 'VirtualItems' >> _x >> 'icon'))];
							_ctrl lbSetPictureColor [(lbsize _ctrl)-1,[1, 1, 1, 1]];
							_ctrl lbSetData [(lbsize _ctrl)-1,_x];
						};
					} forEach VIRTUAL_ITEMS_ARRAY;
				};
			"; }; infiSTAR_MAIN_CODE = infiSTAR_MAIN_CODE + "
			};
			if(LASTSUBBUTTON isEqualTo 1)then
			{
				if('==== Vehicles ====' call ADMINLEVELACCESS)then
				{
					if(!isNil'EPOCH_VehicleSlotCount')then
					{
						_ctrl lbAdd format['vehicle slots: %1   (destroy/delete a vehicle to get a slot!)',EPOCH_VehicleSlotCount];
					};
					_ctrl lbAdd '==== Vehicles ====';
					if(!isNil 'infiSTAR_add_vehicles')then
					{
						if(infiSTAR_MOD == 'Epoch')then
						{
							_ctrl lbAdd '   ==== Epoch Vehicles (checked existing vehicles and config) ====';
							{
								_displayName = getText(configFile >> 'CfgVehicles' >> _x >> 'displayName');
								if(((toLower _x) find _txt > -1)||((toLower _displayName) find _txt > -1))then{
									_ctrl lbAdd format['%1 (%2)',_displayName,_x];
									_x call fnc_addpic;
									_ctrl lbSetData [(lbsize _ctrl)-1,_x];
								};
							} forEach ALL_VEHS_TO_SEARCH_EPOCH;
							_ctrl lbAdd '   ==== Other Vehicles ====';
							{
								_displayName = getText(configFile >> 'CfgVehicles' >> _x >> 'displayName');
								if(((toLower _x) find _txt > -1)||((toLower _displayName) find _txt > -1))then{
									_ctrl lbAdd format['%1 (%2)',_displayName,_x];
									_x call fnc_addpic;
									_ctrl lbSetData [(lbsize _ctrl)-1,_x];
									_ctrl lbSetColor [(lbsize _ctrl)-1,[1,0,0,1]];
								};
							} forEach ALL_VEHS_TO_SEARCH_NONEEPOCH;
						}
						else
						{
							{
								_displayName = getText(configFile >> 'CfgVehicles' >> _x >> 'displayName');
								if(((toLower _x) find _txt > -1)||((toLower _displayName) find _txt > -1))then{
									_ctrl lbAdd format['%1 (%2)',_displayName,_x];
									_x call fnc_addpic;
									_ctrl lbSetData [(lbsize _ctrl)-1,_x];
								};
							} forEach ALL_VEHS_TO_SEARCH_C;
						};
					};
				};
			};
			if(LASTSUBBUTTON isEqualTo 2)then
			{
				if('==== Objects ====' call ADMINLEVELACCESS)then
				{
					_ctrl lbAdd '==== Objects ====';
					if(!isNil 'infiSTAR_add_objects')then
					{
						if(infiSTAR_MOD == 'Epoch')then
						{
							_ctrl lbAdd '   ==== Epoch Objects ====';
							{
								_displayName = getText(configFile >> 'CfgVehicles' >> _x >> 'displayName');
								if(((toLower _x) find _txt > -1)||((toLower _displayName) find _txt > -1))then{
									_ctrl lbAdd format['%1 (%2)',_displayName,_x];
									_ctrl lbSetData [(lbsize _ctrl)-1,_x];
								};
							} forEach ALL_OBJS_TO_SEARCH_EPOCH;
							_ctrl lbAdd '   ==== Other Objects ====';
							{
								_displayName = getText(configFile >> 'CfgVehicles' >> _x >> 'displayName');
								if(((toLower _x) find _txt > -1)||((toLower _displayName) find _txt > -1))then{
									_ctrl lbAdd format['%1 (%2)',_displayName,_x];
									_ctrl lbSetData [(lbsize _ctrl)-1,_x];
									_ctrl lbSetColor [(lbsize _ctrl)-1,[1,0,0,1]];
								};
							} forEach ALL_OBJS_TO_SEARCH_NONEEPOCH;
						}
						else
						{
							_ctrl lbAdd '   ==== Objects ====';
							{
								_displayName = getText(configFile >> 'CfgVehicles' >> _x >> 'displayName');
								if(((toLower _x) find _txt > -1)||((toLower _displayName) find _txt > -1))then{
									_ctrl lbAdd format['%1 (%2)',_displayName,_x];
									_ctrl lbSetData [(lbsize _ctrl)-1,_x];
								};
							} forEach ALL_OBJS_TO_SEARCH_C;
						};
					};
				};
			};
			lastSearched = _txt;
			[] call fnc_colorizeMain;
			for '_i' from 0 to 10 do{_ctrl lbAdd '';};
		}
	] execFSM 'call.fsm';
};
fnc_searchNfill = {
	if(isNil 'SEARCHLOOP')then{
		SEARCHLOOP = true;
		if(isNil 'lastSearched')then{lastSearched = '';};
		[] spawn {
			disableSerialization;
			while {true} do
			{
				if(isNull (findDisplay MAIN_DISPLAY_ID))exitWith{};
				if(!isNil 'stopthissearchplease')exitWith{stopthissearchplease=nil;};
				_txt = ctrlText((findDisplay MAIN_DISPLAY_ID) displayCtrl 100);
				if(_txt isEqualTo '')then
				{
					[] call fn_infiSTARAdmin_fillPlayer;
					waitUntil {((ctrlText((findDisplay MAIN_DISPLAY_ID) displayCtrl 100) != '')||(isNull (findDisplay MAIN_DISPLAY_ID))||(!isNil 'stopthissearchplease'))};
				}
				else
				{
					_txt = toLower _txt;
					if(FILLMAINSTATE isEqualTo 1)then
					{
						call fnc_search;
					}
					else
					{
						_ctrl = (findDisplay MAIN_DISPLAY_ID) displayCtrl LEFT_CTRL_ID;
						lbclear _ctrl;
						{
							_PUIDX = getPlayerUID _x;
							_name = _x getVariable['playerName',name _x];
							if((toLower _name) find _txt > -1)then
							{
								_side = side _x;
								_clr = _side call {
									if(_this isEqualTo civilian)exitWith{[0.67,0.97,0.97,1]};
									if(_this isEqualTo west)exitWith{[0.047,0.502,1,1]};
									if(_this isEqualTo resistance)exitWith{[0,0.65,0,1]};
									if(_this isEqualTo east)exitWith{[1,0.17,0.17,1]};
									[1,1,1,1]
								};
								_name = format['%1 [%2]',_name,_side];
								_index = _ctrl lbAdd _name;
								_ctrl lbSetData [(lbsize _ctrl)-1,'1'];
								_veh = vehicle _x;
								_xpic = getText (configFile >> 'CfgVehicles' >> (typeOf _veh) >> 'picture');
								if(alive _x)then
								{
									if(_x isEqualTo _veh)then
									{
										_wpnstate = weaponState _x;
										_cwep = _wpnstate select 0;
										if(_cwep != '')then
										{
											_xpic = getText (configFile >> 'CfgWeapons' >> _cwep >> 'picture');
										};
									};
								};
								if!(_xpic isEqualTo '')then
								{
									_ctrl lbSetPicture [_index,_xpic];
									_ctrl lbSetPictureColor [_index,[1, 1, 1, 1]];
								};
								_PUIDX = getPlayerUID _x;
								if(((_PUIDX in infiSTAR_ADMINS)&&!(_PUIDX in infiSTAR_DEVS))||((_PUIDX in infiSTAR_DEVS)&&(MYPUIDinfiESP in infiSTAR_DEVS))||(_PUIDX == MYPUIDinfiESP))then{_clr = [0,1,0,1];};
								if(_x isEqualTo SELECTED_TARGET_PLAYER)then{_clr = [1,0.7,0.15,1];};
								_ctrl lbSetColor [_index,_clr];
							};
						} forEach (call fnc_infiSTAR_get_LeftClicks);
					};
				};
				uiSleep 0.1;
			};
			SEARCHLOOP = nil;
		};
	};
};
fnc_SearchFieldButtons = {
	disableSerialization;
	_display = findDisplay MAIN_DISPLAY_ID;
	_others=false;
	if(FILLMAINSTATE == 1)then{_others = true;};

	_editSearch = _display displayCtrl 100;
	_editSearch ctrlEnable true;
	_editSearch ctrlShow true;
	_editSearch ctrlSetTextColor [0.56,0.04,0.04,1];
	_editSearch ctrlSetText '';

	_btnWep = _display displayCtrl 26;
	_btnWep ctrlEnable false;
	_btnWep ctrlShow false;

	_btnMag = _display displayCtrl 27;
	_btnMag ctrlEnable false;
	_btnMag ctrlShow false;

	_btnBackp = _display displayCtrl 28;
	_btnBackp ctrlEnable false;
	_btnBackp ctrlShow false;

	_btnVest = _display displayCtrl 29;
	_btnVest ctrlEnable false;
	_btnVest ctrlShow false;

	_btnUniform = _display displayCtrl 30;
	_btnUniform ctrlEnable false;
	_btnUniform ctrlShow false;

	_btnTools = _display displayCtrl 31;
	_btnTools ctrlEnable false;
	_btnTools ctrlShow false;

	_btnItems = _display displayCtrl 36;
	_btnItems ctrlEnable true;
	_btnItems ctrlShow true;
	_btnItems buttonSetAction 'LASTSUBBUTTON = 0;FILLMAINSTATE=1;[] call fnc_fill_infiSTAR_MAIN;[] call fn_infiSTARAdmin_setFocus;[] call fnc_colorButtons;';

	_ctrlL = _display displayCtrl LEFT_CTRL_ID;
	if(isNil 'ctrlposeditSearch')then{ctrlposeditSearch = ctrlPosition _editSearch;};
	_ctrleditSearchTMP = ctrlposeditSearch;
	if(isNil 'ctrlposbtnItems')then{ctrlposbtnItems = ctrlPosition _btnItems;};
	_ctrlbtnItemsTMP = ctrlposbtnItems;
	if(FILLMAINSTATE in [0,3,4])then
	{
		_btnItems ctrlSetText 'Reset PlayerSearch';
		_btnItems buttonSetAction '((findDisplay MAIN_DISPLAY_ID) displayCtrl 100) ctrlSetText '''';[] call fn_infiSTARAdmin_fillPlayer;';
		_ctrleditSearchTMP = [SafeZoneX,(ctrlposeditSearch select 1)-0.045,((ctrlPosition _ctrlL) select 2),(ctrlposeditSearch select 3)*0.75];
		_ctrlbtnItemsTMP = [SafeZoneX,(ctrlposbtnItems select 1)-0.035,((ctrlPosition _ctrlL) select 2),(ctrlposbtnItems select 3)];
	};
	_editSearch ctrlSetPosition _ctrleditSearchTMP;
	_editSearch ctrlCommit 0.3;
	_btnItems ctrlSetPosition _ctrlbtnItemsTMP;
	_btnItems ctrlCommit 0.3;

	if(FILLMAINSTATE == 1)then{
		_btnItems ctrlSetText 'Items';
		_btnItems buttonSetAction 'LASTSUBBUTTON = 0;FILLMAINSTATE=1;[] call fnc_fill_infiSTAR_MAIN;[] call fn_infiSTARAdmin_setFocus;[] call fnc_colorButtons;';
	};

	_btnVehs = _display displayCtrl 37;
	_btnVehs ctrlEnable _others;
	_btnVehs ctrlShow _others;
	_btnVehs buttonSetAction 'LASTSUBBUTTON = 1;FILLMAINSTATE=1;[] call fnc_fill_infiSTAR_MAIN;[] call fn_infiSTARAdmin_setFocus;[] call fnc_colorButtons;';

	_btnMisc = _display displayCtrl 38;
	_btnMisc ctrlSetText 'Objects';
	_btnMisc ctrlEnable _others;
	_btnMisc ctrlShow _others;
	_btnMisc buttonSetAction 'LASTSUBBUTTON = 2;FILLMAINSTATE=1;[] call fnc_fill_infiSTAR_MAIN;[] call fn_infiSTARAdmin_setFocus;[] call fnc_colorButtons;';

	call fnc_searchNfill;
};
fnc_cloneGear = {
	_unit = _this;
	if(isNil'_unit')exitWith{'_unit not defined' call FN_SHOW_LOG;};
	if(isNull _unit)exitWith{'_unit OBJECT-NULL' call FN_SHOW_LOG;};
	_export = '';
	_fnc_addMultiple = {
		_items = _this select 0;
		_expression = _this select 1;
		_itemsUsed = [];
		{
			_item = _x;
			_itemLower = tolower _x;
			if !(_itemLower in _itemsUsed)then{
				_itemsUsed set [count _itemsUsed,_itemLower];
				_itemCount = {_item == _x} count _items;
				_expressionLocal = _expression;
				if(_itemCount > 1)then{
					_expressionLocal = format ['for ''_i'' from 1 to %1 do {%2};',_itemCount,_expression];
				};
				_export = _export + format [_expressionLocal,_var,_x];
			};
		} foreach _items;
	};
	_export = _export + '_unit = player;';
	_var = '_unit';
	_export = _export + format ['removeAllWeapons %1;',_var];
	_export = _export + format ['removeAllItems %1;',_var];
	_export = _export + format ['removeAllAssignedItems %1;',_var];
	_export = _export + format ['removeUniform %1;',_var];
	_export = _export + format ['removeVest %1;',_var];
	_export = _export + format ['removeBackpack %1;',_var];
	_export = _export + format ['removeHeadgear %1;',_var];
	_export = _export + format ['removeGoggles %1;',_var];
	if(uniform _unit != '')then{
		_export = _export + format ['%1 forceAddUniform ''%2'';',_var,uniform _unit];
		[uniformitems _unit,'%1 addItemToUniform ''%2'';'] call _fnc_addMultiple;
	};
	if(vest _unit != '')then{
		_export = _export + format ['%1 addVest ''%2'';',_var,vest _unit];
		[vestitems _unit,'%1 addItemToVest ''%2'';'] call _fnc_addMultiple;
	};
	if(!isnull unitbackpack _unit)then{
		_export = _export + format ['%1 addBackpack ''%2'';',_var,typeof unitbackpack _unit];
		[backpackitems _unit,'%1 addItemToBackpack ''%2'';'] call _fnc_addMultiple;
	};
	if(headgear _unit != '')then{_export = _export + format ['%1 addHeadgear ''%2'';',_var,headgear _unit];};
	if(goggles _unit != '')then{_export = _export + format ['%1 addGoggles ''%2'';',_var,goggles _unit];};
	{
		_weapon = _x select 0;
		_weaponAccessories = _x select 1;
		_weaponCommand = _x select 2;
		if(_weapon != '')then{
			_export = _export + format ['%1 addWeapon ''%2'';',_var,_weapon];
			{
				if(_x != '')then{_export = _export + format ['%1 %3 ''%2'';',_var,_x,_weaponCommand];};
			} foreach _weaponAccessories;
		};
	} foreach [
		[primaryweapon _unit,_unit weaponaccessories primaryweapon _unit,'addPrimaryWeaponItem'],
		[secondaryweapon _unit,_unit weaponaccessories secondaryweapon _unit,'addSecondaryWeaponItem'],
		[handgunweapon _unit,_unit weaponaccessories handgunweapon _unit,'addHandgunItem'],
		[binocular _unit,[],'']
	];
	[assigneditems _unit - [binocular _unit],'%1 linkItem ''%2'';'] call _fnc_addMultiple;
	_export
};
fnc_Loadoutmenu = {
	if(isNil'missionNameSpaceLoadouts')then{missionNameSpaceLoadouts=[];};
	
	ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 44464);
	findDisplay MAIN_DISPLAY_ID ctrlCreate['IGUIBack', 44464];
	(findDisplay MAIN_DISPLAY_ID displayCtrl 44464) ctrlSetPosition [
		0.554062 * safezoneW + safezoneX,
		1,
		0.3,
		0.2 * safezoneH
	];
	(findDisplay MAIN_DISPLAY_ID displayCtrl 44464) ctrlSetBackgroundColor [0.15,0.15,0.15,1];
	(findDisplay MAIN_DISPLAY_ID displayCtrl 44464) ctrlCommit 0;
	
	ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 44465);
	findDisplay MAIN_DISPLAY_ID ctrlCreate['RscListbox', 44465];
	(findDisplay MAIN_DISPLAY_ID displayCtrl 44465) ctrlSetPosition [
		0.554062 * safezoneW + safezoneX,
		1
	];
	(findDisplay MAIN_DISPLAY_ID displayCtrl 44465) ctrlCommit 0;
	fnc_load_LoadOuts = {
		infiSTAR_LoadOutARRay = profileNamespace getVariable['infiSTAR_LoadOutARRay',[]];
		lbClear (findDisplay MAIN_DISPLAY_ID displayCtrl 44465);
		if!(infiSTAR_LoadOutARRay isEqualTo [])then
		{
			{(findDisplay MAIN_DISPLAY_ID displayCtrl 44465) lbAdd _x;} forEach infiSTAR_LoadOutARRay;
			(findDisplay MAIN_DISPLAY_ID displayCtrl 44465) lbAdd '';
		};
		if!(missionNameSpaceLoadouts isEqualTo [])then
		{
			{(findDisplay MAIN_DISPLAY_ID displayCtrl 44465) lbAdd _x;} forEach missionNameSpaceLoadouts;
			(findDisplay MAIN_DISPLAY_ID displayCtrl 44465) lbAdd '';
		};
		if(!isNil'infiSTAR_Loadouts')then
		{
			{(findDisplay MAIN_DISPLAY_ID displayCtrl 44465) lbAdd _x;} forEach infiSTAR_Loadouts;
		};
	};
	call fnc_load_LoadOuts;
	
	ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 44469);
	findDisplay MAIN_DISPLAY_ID ctrlCreate['RscEdit', 44469];
	(findDisplay MAIN_DISPLAY_ID displayCtrl 44469) ctrlSetPosition [
		0.554062 * safezoneW + safezoneX,
		1.01+(ctrlPosition((findDisplay MAIN_DISPLAY_ID) displayCtrl 44465) select 3),
		(ctrlPosition((findDisplay MAIN_DISPLAY_ID) displayCtrl 44465) select 2),
		0.033 * safezoneH
	];
	(findDisplay MAIN_DISPLAY_ID displayCtrl 44469) ctrlCommit 0;
	
	
	ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 44466);
	findDisplay MAIN_DISPLAY_ID ctrlCreate['RSCButton', 44466];
	(findDisplay MAIN_DISPLAY_ID displayCtrl 44466) ctrlSetText 'LOAD';
	(findDisplay MAIN_DISPLAY_ID displayCtrl 44466) ctrlSetPosition [
		0.68 * safezoneW + safezoneX,
		1,
		0.3,
		0.033 * safezoneH
	];
	fnc_ButtonClick_44466 = {
		_txt = lbtext[44465,(lbCurSel 44465)];
		if(_txt != '')then
		{
			_startloadout = getunitloadout player;
			_exit = false;
			{if(toUpper _txt isEqualTo toUpper _x)exitWith{_exit=true};} forEach infiSTAR_Loadouts;
			if(_exit)exitWith
			{
				switch (_txt) do {
					case 'Epoch 1':{[0] call fnc_add_loadout;};
					case 'Epoch 2':{[1] call fnc_add_loadout;};
					case 'Sub Machinegun Kit':{[2] call fnc_add_loadout;};
					case 'Light Infantry Kit':{[3] call fnc_add_loadout;};
					case 'Heavy Infantry Kit':{[4] call fnc_add_loadout;};
					case 'DMR Sniper Kit':{[5] call fnc_add_loadout;};
					case 'LLR Sniper Kit':{[6] call fnc_add_loadout;};
					case 'Lynx Sniper Kit':{[7] call fnc_add_loadout;};
					case 'M107 Sniper Kit':{[8] call fnc_add_loadout;};
				};
				_log = format ['Changed Loadout to %1 | old: %2 | new: %3',str _txt,_startloadout,getunitloadout player];
				_log call fnc_adminLog;
			};
			
			if(_txt in missionNameSpaceLoadouts)exitWith
			{
				_m = missionNameSpace getVariable _txt;
				if((!isNil '_m')&&{(typeName _m == 'CODE')})then
				{
					call _m;
				};
				_log = format ['Changed Loadout to %1 | old: %2 | new: %3',str _txt,_startloadout,getunitloadout player];
				_log call fnc_adminLog;
			};
			
			if(isNil'FNC_CUSTOM_fn_loadInventory')then
			{
				FNC_CUSTOM_fn_loadInventory = compile (preprocessfile 'A3\functions_f\Inventory\fn_loadInventory.sqf');
			};
			_fnc_scriptName='';[player, [profileNamespace, _txt]] call FNC_CUSTOM_fn_loadInventory;
			_log = format ['Changed Loadout to %1 | old: %2 | new: %3',str _txt,_startloadout,getunitloadout player];
			_log call fnc_adminLog;
		};
	};
	(findDisplay MAIN_DISPLAY_ID displayCtrl 44466) ctrlCommit 0;
	(findDisplay MAIN_DISPLAY_ID displayCtrl 44466) ctrlSetEventHandler['ButtonClick','call fnc_ButtonClick_44466'];
	
	
	ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 44467);
	findDisplay MAIN_DISPLAY_ID ctrlCreate['RSCButton', 44467];
	(findDisplay MAIN_DISPLAY_ID displayCtrl 44467) ctrlSetText 'DELETE';
	(findDisplay MAIN_DISPLAY_ID displayCtrl 44467) ctrlSetPosition [
		0.68 * safezoneW + safezoneX,
		1+((ctrlPosition((findDisplay MAIN_DISPLAY_ID) displayCtrl 44465) select 3)/2),
		0.3,
		0.033 * safezoneH
	];
	fnc_ButtonClick_44467 = {
		_txt = lbtext[44465,(lbCurSel 44465)];
		if(_txt != '')then
		{
			if(_txt in infiSTAR_LoadOutARRay)then
			{
				_id = infiSTAR_LoadOutARRay find _txt;
				if(_id == -1)exitWith{'can not find Loadout' call FN_SHOW_LOG;};
				_return = infiSTAR_LoadOutARRay deleteAt _id;
				format['Deleted Loadout: %1',_return] call FN_SHOW_LOG;
				profileNamespace setVariable['infiSTAR_LoadOutARRay',infiSTAR_LoadOutARRay];saveprofileNamespace;
				_fnc_scriptName='';[player, [profileNamespace, _txt]] call BIS_fnc_deleteInventory;
			}
			else
			{
				_exit = false;
				{if(toUpper _txt isEqualTo toUpper _x)exitWith{_exit=true};} forEach infiSTAR_Loadouts;
				if(_exit)exitWith{'can not delete preset Admin Loadouts' call FN_SHOW_LOG;};
				
				_id = missionNameSpaceLoadouts find _txt;
				if(_id == -1)exitWith{'can not find Loadout' call FN_SHOW_LOG;};
				_return = missionNameSpaceLoadouts deleteAt _id;
				format['Deleted Loadout: %1',_return] call FN_SHOW_LOG;
			};
		};
		call fnc_load_LoadOuts;
	};
	(findDisplay MAIN_DISPLAY_ID displayCtrl 44467) ctrlCommit 0;
	(findDisplay MAIN_DISPLAY_ID displayCtrl 44467) ctrlSetEventHandler['ButtonClick','call fnc_ButtonClick_44467'];
	
	
	ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 44468);
	findDisplay MAIN_DISPLAY_ID ctrlCreate['RSCButton', 44468];
	(findDisplay MAIN_DISPLAY_ID displayCtrl 44468) ctrlSetPosition [
		0.68 * safezoneW + safezoneX,
		1+(ctrlPosition((findDisplay MAIN_DISPLAY_ID) displayCtrl 44465) select 3),
		0.3,
		0.033 * safezoneH
	];
	fnc_ButtonClick_44468 = {
		_txt = ctrlText 44469;
		if(_txt == '')exitWith{'Type a Loadout name to save!' call FN_SHOW_LOG;};
		if(count _txt > 30)exitWith{'Loadout name should have max 30 characters!' call FN_SHOW_LOG;};
		if(isNull SELECTED_TARGET_PLAYER)exitWith{'Player selected is NULL-OBJECT' call FN_SHOW_LOG;};
		_exit = false;
		{if(toUpper _txt isEqualTo toUpper _x)exitWith{_exit=true};} forEach infiSTAR_Loadouts;
		if(_exit)exitWith{'can not overwrite preset Admin Loadouts' call FN_SHOW_LOG;};
		
		_exit = false;
		{if(toUpper _txt isEqualTo toUpper _x)exitWith{_exit=true};} forEach missionNameSpaceLoadouts;
		if(_exit)exitWith{'can not overwrite missionNameSpaceLoadouts Admin Loadouts' call FN_SHOW_LOG;};
		
		if!(_txt in infiSTAR_LoadOutARRay)then
		{
			infiSTAR_LoadOutARRay pushBack _txt;
			profileNamespace setVariable['infiSTAR_LoadOutARRay',infiSTAR_LoadOutARRay];saveprofileNamespace;
		};
		_fnc_scriptName='';[SELECTED_TARGET_PLAYER, [profileNamespace, _txt]] call BIS_fnc_saveInventory;
		call fnc_load_LoadOuts;
	};
	(findDisplay MAIN_DISPLAY_ID displayCtrl 44468) ctrlSetEventHandler['ButtonClick','call fnc_ButtonClick_44468'];
	(findDisplay MAIN_DISPLAY_ID displayCtrl 44468) ctrlSetText 'SAVE FROM SELECTED';
	(findDisplay MAIN_DISPLAY_ID displayCtrl 44468) ctrlCommit 0;
	
	ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 44470);
	findDisplay MAIN_DISPLAY_ID ctrlCreate['RSCButton', 44470];
	(findDisplay MAIN_DISPLAY_ID displayCtrl 44470) ctrlSetText 'EXPORT';
	(findDisplay MAIN_DISPLAY_ID displayCtrl 44470) ctrlSetPosition [
		0.81 * safezoneW + safezoneX,
		1+(ctrlPosition((findDisplay MAIN_DISPLAY_ID) displayCtrl 44465) select 3),
		0.3,
		0.033 * safezoneH
	];
	fnc_ButtonClick_44470 = {
		_txt = lbtext[44465,(lbCurSel 44465)];
		if(_txt != '')then
		{
			if(_txt in infiSTAR_LoadOutARRay)then
			{
				_id = infiSTAR_LoadOutARRay find _txt;
				if(_id == -1)exitWith{('can not find Loadout: '+_txt) call FN_SHOW_LOG;};
				
				if(isNil'FNC_CUSTOM_fn_exportInventory')then
				{
					_script = preprocessfile 'A3\functions_f_bootcamp\Inventory\fn_exportInventory.sqf';
					if(typeName _script != 'STRING')then
					{
						_script = str _script;
					};
					FNC_CUSTOM_fn_exportInventory = compile _script;
				};
				_fnc_scriptName='';_loadout = [player, [profileNamespace, _txt]] call FNC_CUSTOM_fn_exportInventory;
				diag_log _loadout;
				('Loadout: '+_txt+' saved to client RPT file!') call FN_SHOW_LOG;
			}
			else
			{
				'Only Loadouts saved with this tool can be exported!' call FN_SHOW_LOG;
			};
		};
		call fnc_load_LoadOuts;
	};
	(findDisplay MAIN_DISPLAY_ID displayCtrl 44470) ctrlCommit 0;
	(findDisplay MAIN_DISPLAY_ID displayCtrl 44470) ctrlSetEventHandler['ButtonClick','call fnc_ButtonClick_44470'];
	
	
	ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 44471);
	findDisplay MAIN_DISPLAY_ID ctrlCreate['RSCButton', 44471];
	(findDisplay MAIN_DISPLAY_ID displayCtrl 44471) ctrlSetPosition [
		0.81 * safezoneW + safezoneX,
		1+((ctrlPosition((findDisplay MAIN_DISPLAY_ID) displayCtrl 44465) select 3)/2),
		0.3,
		0.033 * safezoneH
	];
	fnc_ButtonClick_44471 = {
		_export = player call fnc_cloneGear;
		[_export,SELECTED_TARGET_PLAYER] call admin_d0_target;
		
		_log = format['Cloned on %1(%2)!',name SELECTED_TARGET_PLAYER,getPlayerUID SELECTED_TARGET_PLAYER];
		_log call FN_SHOW_LOG;
	};
	(findDisplay MAIN_DISPLAY_ID displayCtrl 44471) ctrlSetEventHandler['ButtonClick','call fnc_ButtonClick_44471'];
	(findDisplay MAIN_DISPLAY_ID displayCtrl 44471) ctrlSetText 'CLONE ON SELECTED';
	(findDisplay MAIN_DISPLAY_ID displayCtrl 44471) ctrlCommit 0;
	
	ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 44472);
	findDisplay MAIN_DISPLAY_ID ctrlCreate['RSCButton', 44472];
	(findDisplay MAIN_DISPLAY_ID displayCtrl 44472) ctrlSetPosition [
		0.81 * safezoneW + safezoneX,
		1,
		0.3,
		0.033 * safezoneH
	];
	fnc_ButtonClick_44472 = {
		_export = SELECTED_TARGET_PLAYER call fnc_cloneGear;
		call compile _export;
		
		_log = format['Cloned %1(%2) on yourself!',name SELECTED_TARGET_PLAYER,getPlayerUID SELECTED_TARGET_PLAYER];
		_log call FN_SHOW_LOG;
	};
	(findDisplay MAIN_DISPLAY_ID displayCtrl 44472) ctrlSetEventHandler['ButtonClick','call fnc_ButtonClick_44472'];
	(findDisplay MAIN_DISPLAY_ID displayCtrl 44472) ctrlSetText 'CLONE FROM SELECTED';
	(findDisplay MAIN_DISPLAY_ID displayCtrl 44472) ctrlCommit 0;
	
	_ctrl = [_display,'RSCText',44463] call fnc_createctrl;
	_ctrl ctrlSetPosition [
		0.677 * safezoneW + safezoneX,
		0.75,
		0.2 * safezoneW,
		0.03 * safezoneH
	];
	_ctrl ctrlSetText format['SELECTED TARGET: %1',call fnc_get_selected_object];
	_ctrl ctrlCommit 0;
};
fnc_WeatherLord = {
	ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 33300);
	findDisplay MAIN_DISPLAY_ID ctrlCreate['RSCText', 33300];
	_text1 = (findDisplay MAIN_DISPLAY_ID displayCtrl 33300);
	_text1 ctrlSetPosition [
		0.55 * safezoneW + safezoneX,
		0.5,
		0.2 * safezoneW,
		0.03 * safezoneH
	];
	_text1 ctrlSetText 'Fog:';
	_text1 ctrlCommit 0;
	ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 33301);
	findDisplay MAIN_DISPLAY_ID ctrlCreate['RscXSliderH', 33301];
	_slider1 = (findDisplay MAIN_DISPLAY_ID displayCtrl 33301);
	_slider1 ctrlSetPosition [
		0.554 * safezoneW + safezoneX,
		0.55
	];
	_slider1 ctrlSetBackgroundColor [0.15,0.15,0.15,1];
	slider_fog_changed = {
		SET_FOG_VALUE = (_this select 1)/10;
		0 setFog SET_FOG_VALUE;
	};
	_slider1 ctrlRemoveAllEventHandlers 'SliderPosChanged';
	_slider1 ctrlAddEventHandler ['SliderPosChanged','call slider_fog_changed'];
	_slider1 ctrlCommit 0;
	
	
	
	ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 33302);
	findDisplay MAIN_DISPLAY_ID ctrlCreate['RSCText', 33302];
	_text2 = (findDisplay MAIN_DISPLAY_ID displayCtrl 33302);
	_text2 ctrlSetPosition [
		0.55 * safezoneW + safezoneX,
		0.6,
		0.2 * safezoneW,
		0.03 * safezoneH
	];
	_text2 ctrlSetText 'Overcast:';
	_text2 ctrlCommit 0;
	
	ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 33303);
	findDisplay MAIN_DISPLAY_ID ctrlCreate['RscXSliderH', 33303];
	_slider2 = (findDisplay MAIN_DISPLAY_ID displayCtrl 33303);
	_slider2 ctrlSetPosition [
		0.554 * safezoneW + safezoneX,
		0.65
	];
	_slider2 ctrlSetBackgroundColor [0.15,0.15,0.15,1];
	slider_overcast_changed = {
		SET_OVERCAST_VALUE = (_this select 1)/10;
		0 setOvercast SET_OVERCAST_VALUE;
		"; if(_MOD == 'Epoch')then{ infiSTAR_MAIN_CODE = infiSTAR_MAIN_CODE + "
		skipTime 1;
		"; }; infiSTAR_MAIN_CODE = infiSTAR_MAIN_CODE + "
		simulWeatherSync;
	};
	_slider2 ctrlRemoveAllEventHandlers 'SliderPosChanged';
	_slider2 ctrlAddEventHandler ['SliderPosChanged','call slider_overcast_changed'];
	_slider2 ctrlCommit 0;
	
	
	
	ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 33304);
	findDisplay MAIN_DISPLAY_ID ctrlCreate['RSCText', 33304];
	_text3 = (findDisplay MAIN_DISPLAY_ID displayCtrl 33304);
	_text3 ctrlSetPosition [
		0.55 * safezoneW + safezoneX,
		0.7,
		0.2 * safezoneW,
		0.03 * safezoneH
	];
	_text3 ctrlSetText 'Rain:';
	_text3 ctrlCommit 0;
	
	ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 33305);
	findDisplay MAIN_DISPLAY_ID ctrlCreate['RscXSliderH', 33305];
	_slider3 = (findDisplay MAIN_DISPLAY_ID displayCtrl 33305);
	_slider3 ctrlSetPosition [
		0.554 * safezoneW + safezoneX,
		0.75
	];
	_slider3 ctrlSetBackgroundColor [0.15,0.15,0.15,1];
	slider_rain_changed = {
		SET_RAIN_VALUE = (_this select 1)/10;
		if(SET_RAIN_VALUE > 0.3)then{if(overcast < 0.75)then{SET_OVERCAST_VALUE = 0.75;};};
		0 setRain SET_RAIN_VALUE;
		"; if(_MOD == 'Epoch')then{ infiSTAR_MAIN_CODE = infiSTAR_MAIN_CODE + "
		skipTime 1;
		"; }; infiSTAR_MAIN_CODE = infiSTAR_MAIN_CODE + "
		simulWeatherSync;
	};
	_slider3 ctrlRemoveAllEventHandlers 'SliderPosChanged';
	_slider3 ctrlAddEventHandler ['SliderPosChanged','call slider_rain_changed'];
	_slider3 ctrlCommit 0;
	
	
	ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 33400);
	findDisplay MAIN_DISPLAY_ID ctrlCreate['RSCButton', 33400];
	_btn1 = (findDisplay MAIN_DISPLAY_ID displayCtrl 33400);
	_btn1 ctrlSetText 'CHANGE GLOBAL';
	_btn1 ctrlSetPosition [
		0.554 * safezoneW + safezoneX,
		0.8,
		0.3,
		0.033 * safezoneH
	];
	_btn1 ctrlCommit 0;
	_btn1 ctrlSetEventHandler['ButtonClick','[16,player,SET_FOG_VALUE,SET_OVERCAST_VALUE,SET_RAIN_VALUE] call fnc_AdminReq;'];
	
	SET_FOG_VALUE = fog;
	SET_OVERCAST_VALUE = overcast;
	SET_RAIN_VALUE = rain;
	if(!isNil'fnc_WeatherLordTHREAD')then{terminate fnc_WeatherLordTHREAD;};
	fnc_WeatherLordTHREAD = [] spawn {
		disableSerialization;
		_slider1 = (findDisplay MAIN_DISPLAY_ID displayCtrl 33301);
		_slider2 = (findDisplay MAIN_DISPLAY_ID displayCtrl 33303);
		_slider3 = (findDisplay MAIN_DISPLAY_ID displayCtrl 33305);
		if(isNil'SET_FOG_VALUE')then{SET_FOG_VALUE=fog};
		if(isNil'SET_OVERCAST_VALUE')then{SET_OVERCAST_VALUE=overcast};
		if(isNil'SET_RAIN_VALUE')then{SET_RAIN_VALUE=rain};
		while {!isNull findDisplay MAIN_DISPLAY_ID} do
		{
			_fog = SET_FOG_VALUE;
			if(_fog > 0)then{_fog=_fog*10;};
			_slider1 sliderSetPosition _fog;
			0 setFog SET_FOG_VALUE;
			
			_overcast = SET_OVERCAST_VALUE;
			if(_overcast > 0)then{_overcast=_overcast*10;};
			_slider2 sliderSetPosition _overcast;
			0 setOvercast SET_OVERCAST_VALUE;
			
			_rain = SET_RAIN_VALUE;
			if(_rain > 0)then{_rain=_rain*10;};
			_slider3 sliderSetPosition _rain;
			0 setRain SET_RAIN_VALUE;
			
			uiSleep 0.1;
		};
	};
};
fn_infiSTAR_addSaveButton = {
	_display = findDisplay MAIN_DISPLAY_ID;
	
	_btn = [_display,'RscButton',1338001] call fnc_createctrl;
	_btn ctrlSetText 'SAVE TOGGLE STATE';
	_btn ctrlSetPosition [
		0.39 * safezoneW + safezoneX + (0.15 * safezoneW),
		0.0379694 * safezoneH + safezoneY,
		0.12 * safezoneW,
		0.02 * safezoneH
	];
	_btn buttonSetAction '
		profileNamespace setVariable [''infiSTAR_saveToggle_A3'',infiSTAR_toggled_A];
		saveprofileNamespace;
		_log = ''Saved currently toggled/enabled admin functions. Next time you login as admin, they will automatically turn on.'';
		_log call FN_SHOW_LOG;
		systemChat (''<infiSTAR.de> ''+_log);
	';
	_btn ctrlCommit 0;
};
fnc_FULLinit = {
	disableSerialization;
	if(isNull findDisplay MAIN_DISPLAY_ID)then
	{
		createdialog 'infiSTAR_AdminMenu';
		call fn_infiSTAR_addSaveButton;
	};
	call fnc_initMenu;
	[] call fnc_add_adminMainMapMovement;
	if('==== Loadouts ====' call ADMINLEVELACCESS)then{call fnc_Loadoutmenu;};
	if('==== WeatherLord ====' call ADMINLEVELACCESS)then{call fnc_WeatherLord;};
};
fnc_initMenu = {
	_display = findDisplay MAIN_DISPLAY_ID;
	
	_ctrlL = _display displayCtrl LEFT_CTRL_ID;
	_ctrlL ctrlRemoveAllEventHandlers 'LBDblClick';
	_ctrlL ctrlRemoveAllEventHandlers 'LBSelChanged';		
	_ctrlL ctrlAddEventHandler ['LBDblClick', 'call fnc_LBDblClick_LEFT;[] call fn_infiSTARAdmin_setFocus;'];
	_ctrlL ctrlAddEventHandler ['LBSelChanged', 'call fnc_LBSelChanged_LEFT;[] call fn_infiSTARAdmin_setFocus;'];
	[] call fn_infiSTARAdmin_fillPlayer;
	
	_ctrlR = _display displayCtrl RIGHT_CTRL_ID;
	_ctrlR ctrlRemoveAllEventHandlers 'LBDblClick';
	_ctrlR ctrlRemoveAllEventHandlers 'LBSelChanged';
	_ctrlR ctrlAddEventHandler ['LBDblClick', 'call fnc_LBDblClick_RIGHT;[] call fn_infiSTARAdmin_setFocus;'];
	_ctrlR ctrlAddEventHandler ['LBSelChanged', 'call fnc_LBSelChanged_RIGHT;[] call fn_infiSTARAdmin_setFocus;'];
	FILLMAINSTATE=0;[] call fnc_fill_infiSTAR_MAIN;
	
	_hours = floor(serverTime / 60 / 60);
	_value = ((serverTime / 60 / 60) - _hours);
	if(_value == 0)then{_value = 0.0001;};
	_minutes = round(_value * 60);
	_ctrl = _display displayCtrl 2;
	_ctrl ctrlSetText format['Players loaded in: %1 of %2               infiSTAR.de   Admin Menu   SERVER UP FOR: %3h %4min               %5',count allPlayers,((playersNumber west)+(playersNumber east)+(playersNumber civilian)+(playersNumber resistance)),_hours,_minutes,INFISTARVERSION];
	
	_btnMainMenu = _display displayCtrl 20;
	_btnMainMenu buttonSetAction 'FILLMAINSTATE=0;[] call fnc_fill_infiSTAR_MAIN;[] call fn_infiSTARAdmin_setFocus;[] call fnc_colorButtons;';
	
	_btnAntiSpawnMenu = _display displayCtrl 21;
	_btnAntiSpawnMenu buttonSetAction 'FILLMAINSTATE=1;[] call fnc_fill_infiSTAR_MAIN;[] call fn_infiSTARAdmin_setFocus;[] call fnc_colorButtons;';
	
	_btnSMap = _display displayCtrl 32;
	_btnSMap ctrlEnable false;
	_btnSMap ctrlShow false;
	
	_btnCMap = _display displayCtrl 33;
	_btnCMap ctrlEnable false;
	_btnCMap ctrlShow false;
	
	_btnTMap = _display displayCtrl 34;
	_btnTMap ctrlEnable false;
	_btnTMap ctrlShow false;
	
	_btnMapPip = _display displayCtrl 35;
	_btnMapPip ctrlEnable false;
	_btnMapPip ctrlShow false;
	
	call fnc_SearchFieldButtons;
	[] call fn_infiSTARAdmin_setFocus;
	[] call fnc_colorButtons;
};
fnc_colorizeMain = {
	disableSerialization;
	_ctrl = (findDisplay MAIN_DISPLAY_ID) displayCtrl RIGHT_CTRL_ID;
	_lsize = lbSize RIGHT_CTRL_ID;
	for '_i' from 0 to _lsize do
	{
		_lbtxt = lbtext [RIGHT_CTRL_ID,_i];
		if(_lbtxt in infiSTAR_Toggleable)then
		{
			if(_lbtxt in infiSTAR_toggled_A)then
			{
				_ctrl lbSetColor [_i,[0,1,0,1]];
			}
			else
			{
				_ctrl lbSetColor [_i,[1,0,0,1]];
			};
		};
		if(_lbtxt in infiSTAR_SubMenus)then
		{
			_ctrl lbSetColor [_i,[0.67,0.97,0.97,1]];
		};
		if(_lbtxt in infiSTAR_OnTargetNICE)then
		{
			_ctrl lbSetColor [_i,[0,0.8,1,1]];
		};
		if(_lbtxt in infiSTAR_OnTargetEVIL)then
		{
			_ctrl lbSetColor [_i,[0.99,0.8,0.8,1]];
		};
	};
};
fnc_colorButtons = {
	call fnc_SearchFieldButtons;
	disableSerialization;
	_display = findDisplay MAIN_DISPLAY_ID;
	_btnMainMenu = _display displayCtrl 20;
	if(FILLMAINSTATE == 0)then{_btnMainMenu ctrlSetTextColor [0,1,0,1];} else {_btnMainMenu ctrlSetTextColor [1,1,1,1];};
	_btnAntiSpawnMenu = _display displayCtrl 21;
	if(FILLMAINSTATE == 1)then{_btnAntiSpawnMenu ctrlSetTextColor [0,1,0,1];} else {_btnAntiSpawnMenu ctrlSetTextColor [1,1,1,1];};
	
	_btnAntiHackLog = _display displayCtrl 23;
	_btnAntiHackLog ctrlSetText (format['AHLogs: %1',count AH_HackLogArray + count AH_SurvLogArray + count PVAH_AHTMPBAN]);
	_btnAntiHackLog buttonSetAction 'FILLMAINSTATE=3;[] call fnc_fill_HackLog;[] call fn_infiSTARAdmin_setFocus;[] call fnc_colorButtons;';
	if(FILLMAINSTATE isEqualTo 3)then{_btnAntiHackLog ctrlSetTextColor [0,1,0,1];} else {_btnAntiHackLog ctrlSetTextColor [1,1,1,1];};
	
	_btnAdminLog = _display displayCtrl 24;
	_btnAdminLog ctrlSetText (format['AdminLogs: %1',count AH_AdmiLogArray]);
	_btnAdminLog buttonSetAction 'FILLMAINSTATE=4;[] call fnc_fill_AdminLog;[] call fn_infiSTARAdmin_setFocus;[] call fnc_colorButtons;';
	if(FILLMAINSTATE isEqualTo 4)then{_btnAdminLog ctrlSetTextColor [0,1,0,1];} else {_btnAdminLog ctrlSetTextColor [1,1,1,1];};
	
	_btnItems = _display displayCtrl 36;
	if((LASTSUBBUTTON == 0)&&(FILLMAINSTATE == 1))then{_btnItems ctrlSetTextColor [0,1,0,1];} else {_btnItems ctrlSetTextColor [1,1,1,1];};
	_btnVehs = _display displayCtrl 37;
	if(LASTSUBBUTTON == 1)then{_btnVehs ctrlSetTextColor [0,1,0,1];} else {_btnVehs ctrlSetTextColor [1,1,1,1];};
	_btnMisc = _display displayCtrl 38;
	if(LASTSUBBUTTON == 2)then{_btnMisc ctrlSetTextColor [0,1,0,1];} else {_btnMisc ctrlSetTextColor [1,1,1,1];};
	
	_mytime = 0.3;
	_ctrlR = _display displayCtrl RIGHT_CTRL_ID;
	if(isNil 'ctrlposR')then{ctrlposR = ctrlPosition _ctrlR;};
	
	_ctrlRTMP = [(ctrlposR select 0),(ctrlposR select 1),(ctrlposR select 2)*2.35,(ctrlposR select 3)];
	if(FILLMAINSTATE == 0)then
	{
		_ctrlRTMP = ctrlposR;
	};
	if(FILLMAINSTATE == 1)then
	{
		_ctrlRTMP = [(ctrlposR select 0),(ctrlposR select 1)+.25,(ctrlposR select 2),(ctrlposR select 3)-.25];
	};
	_ctrlR ctrlSetPosition _ctrlRTMP;
	_ctrlR ctrlCommit _mytime;
	
	_btnHTML = _display displayCtrl 25;
	_btnHTML ctrlShow false;
};
fnc_fill_HackLog = {
	disableSerialization;
	_ctrl = (findDisplay MAIN_DISPLAY_ID) displayCtrl RIGHT_CTRL_ID;
	lbclear _ctrl;
	_ctrl lbAdd 'clear ingame HackLog';
	_ctrl lbAdd 'DBL-CLICK TO SYSTEMCHAT';
	_ctrl lbAdd '--------------------';
	
	_ctrl lbAdd format['HackLog: %1',count AH_HackLogArray];
	{_ctrl lbAdd _x;} forEach AH_HackLogArray;
	
	_ctrl lbAdd '';
	_ctrl lbAdd format['SurveillanceLog: %1',count AH_SurvLogArray];
	{_ctrl lbAdd _x;} forEach AH_SurvLogArray;
	
	_ctrl lbAdd '';
	_ctrl lbAdd format['BanLog: %1',count PVAH_AHTMPBAN];
	if(str PVAH_AHTMPBAN != '[]')then
	{
		_ctrl lbAdd 'DBL-CLICK TO REMOVE';
		{_ctrl lbAdd _x;} forEach PVAH_AHTMPBAN;
	};
	for '_i' from 0 to 10 do {_ctrl lbAdd '';};
};
fnc_fill_AdminLog = {
	disableSerialization;
	_ctrl = (findDisplay MAIN_DISPLAY_ID) displayCtrl RIGHT_CTRL_ID;
	lbclear _ctrl;
	if('AdminLog' call ADMINLEVELACCESS)then
	{
		_ctrl lbAdd 'clear ingame AdminLog';
		_ctrl lbAdd 'DBL-CLICK TO SYSTEMCHAT';
		{_ctrl lbAdd _x;} forEach AH_AdmiLogArray;
	}
	else
	{
		_ctrl lbAdd 'Nothin to see here';
	};
	for '_i' from 0 to 10 do {_ctrl lbAdd '';};
};
fnc_fill_infiSTAR_MAIN = {
	disableSerialization;
	_ctrl = (findDisplay MAIN_DISPLAY_ID) displayCtrl RIGHT_CTRL_ID;
	lbclear _ctrl;
	infiSTAR_SubMenus =
	[
		'==== Weapons ====','==== Magazines ====','==== Bags ====','==== Vehicles ====',
		'==== Objects ====','==== OnTarget ====','==== Toggleable ====',
		'==== AltisLife Misc ====','==== AltisLife Money ====','==== VirtualItems ===='
	];
	infiSTAR_OnTargetNICE =
	[
		'Teleport - Target To Me','Teleport - Me To Target',
		'Request Steam Name','Revive','Heal','Restore',
		'Move In My Vehicle','Move In Target Vehicle','Parachute Target',
		'Add / Remove Crypto','UnFreeze Target','Unrestrain'
	];
	if(infiSTAR_MOD != 'Epoch')then
	{
		{
			infiSTAR_OnTargetNICE = infiSTAR_OnTargetNICE - [_x];
		} forEach ['Add / Remove Crypto'];
	};
	if(infiSTAR_MOD != 'AltisLife')then
	{
		{
			infiSTAR_OnTargetNICE = infiSTAR_OnTargetNICE - [_x];
		} forEach ['Unrestrain'];
	};
	if((infiSTAR_MOD != 'AltisLife')&&(infiSTAR_MOD != 'Epoch'))then
	{
		{
			infiSTAR_OnTargetNICE = infiSTAR_OnTargetNICE - [_x];
		} forEach ['Revive'];
	};
	infiSTAR_OnTargetEVIL =
	[
		'Restrain','Freeze Target','Remove Gear','Kill','Explode','MineField (around target)','Zeus','Delete Vehicle','Eject','Eject Crew',
		'Force Disconnect','Kick (Silent)','Kick (Announce)','Ban (Silent)','Ban (Announce)',
		'Spawn UAV','Spawn Cloak','Spawn Sapper','Spawn SapperB'
	];
	if(infiSTAR_MOD != 'Epoch')then
	{
		{
			infiSTAR_OnTargetEVIL = infiSTAR_OnTargetEVIL - [_x];
		} forEach ['Spawn UAV','Spawn Cloak','Spawn Sapper','Spawn SapperB'];
	};
	if(infiSTAR_MOD != 'AltisLife')then
	{
		{
			infiSTAR_OnTargetEVIL = infiSTAR_OnTargetEVIL - [_x];
		} forEach ['Restrain'];
	};
	infiSTAR_OnTarget = infiSTAR_OnTargetNICE + infiSTAR_OnTargetEVIL;
	infiSTAR_Toggleable =
	[
		'infiSTAR Player ESP 1','infiSTAR Player ESP 2',
		'infiSTAR AI ESP','infiSTAR Dead ESP',
		'infiSTAR LockBox ESP','infiSTAR Shelf ESP','infiSTAR PlotPole ESP',
		'Default Epoch Player ESP','Default Epoch Vehicle ESP',
		'infiSTAR MapIcons','Vehicle Marker','DeadPlayer Marker','PlotPole Marker','Construction Marker',
		'LockBox Marker','Fake Epoch group to nearest PlotPole','Stealth / Invisible',
		'God Mode','Vehicle God Mode','Vehboost','FastFire','UnlimAmmo','noRecoil','Lower Terrain',
		'Disable Announces','Teleport In Facing Direction (10m steps)'
	];
	if(infiSTAR_MOD != 'Epoch')then
	{
		{
			infiSTAR_Toggleable = infiSTAR_Toggleable - [_x];
		} forEach ['PlotPole Marker','Construction Marker','LockBox Marker','Default Epoch Player ESP','Default Epoch Vehicle ESP','infiSTAR LockBox ESP',
		'infiSTAR Shelf ESP','infiSTAR PlotPole ESP','Fake Epoch group to nearest PlotPole'];
	};
	infiSTAR_AltisLifeMisc =
	[
		'Give All Licenses'
	];
	infiSTAR_AltisLifeMoney =
	[
		'50K Cash','100K Cash','250K Cash','500K Cash','750K Cash','1.150K Cash','2.500K Cash','5.000K Cash','10.000K Cash',
		'50K Bank','100K Bank','250K Bank','500K Bank','750K Bank','1.150K Bank','2.500K Bank','5.000K Bank','10.000K Bank'
	];
	infiSTAR_Loadouts =
	[
		'Epoch 1','Epoch 2',
		'Sub Machinegun Kit','Light Infantry Kit','Heavy Infantry Kit','DMR Sniper Kit','LLR Sniper Kit',
		'Lynx Sniper Kit','M107 Sniper Kit'
	];
	if(infiSTAR_MOD != 'Epoch')then
	{
		{
			infiSTAR_Loadouts = infiSTAR_Loadouts - [_x];
		} forEach ['Epoch 1','Epoch 2'];
	};
	if(FILLMAINSTATE == 1)then
	{
		switch (LASTSUBBUTTON) do {
			case 0:{
				if('==== Weapons ====' call ADMINLEVELACCESS)then
				{
					_ctrl lbAdd '==== Weapons ====';
					if(!isNil 'infiSTAR_add_weapons')then
					{
						if(infiSTAR_MOD == 'Epoch')then
						{
							_ctrl lbAdd '   ==== Epoch Weapons ====';
							{
								_ctrl lbAdd format['%1 (%2)',getText(configFile >> 'CfgWeapons' >> _x >> 'displayName'),_x];
								_x call fnc_addpic;
								_ctrl lbSetData [(lbsize _ctrl)-1,_x];
							} forEach ALL_WEPS_TO_SEARCH_EPOCH;
							_ctrl lbAdd '   ==== Other Weapons ====';
							{
								_ctrl lbAdd format['%1 (%2)',getText(configFile >> 'CfgWeapons' >> _x >> 'displayName'),_x];
								_x call fnc_addpic;
								_ctrl lbSetData [(lbsize _ctrl)-1,_x];
								_ctrl lbSetColor [(lbsize _ctrl)-1,[1,0,0,1]];
							} forEach ALL_WEPS_TO_SEARCH_NONEEPOCH;
						}
						else
						{
							{
								_ctrl lbAdd format['%1 (%2)',getText(configFile >> 'CfgWeapons' >> _x >> 'displayName'),_x];
								_x call fnc_addpic;
								_ctrl lbSetData [(lbsize _ctrl)-1,_x];
							} forEach ALL_WEPS_TO_SEARCH_C;
						};
					};
				};
				if('==== Magazines ====' call ADMINLEVELACCESS)then
				{
					_ctrl lbAdd '==== Magazines ====';
					if(!isNil 'infiSTAR_add_magazines')then
					{
						if(infiSTAR_MOD == 'Epoch')then
						{
							_ctrl lbAdd '   ==== Epoch Magazines ====';
							{
								_ctrl lbAdd format['%1 (%2)',getText(configFile >> 'CfgMagazines' >> _x >> 'displayName'),_x];
								_x call fnc_addpic;
								_ctrl lbSetData [(lbsize _ctrl)-1,_x];
							} forEach ALL_MAGS_TO_SEARCH_EPOCH;
							_ctrl lbAdd '   ==== Other Magazines ====';
							{
								_ctrl lbAdd format['%1 (%2)',getText(configFile >> 'CfgMagazines' >> _x >> 'displayName'),_x];
								_x call fnc_addpic;
								_ctrl lbSetData [(lbsize _ctrl)-1,_x];
								_ctrl lbSetColor [(lbsize _ctrl)-1,[1,0,0,1]];
							} forEach ALL_MAGS_TO_SEARCH_NONEEPOCH;
						}
						else
						{
							{
								_ctrl lbAdd format['%1 (%2)',getText(configFile >> 'CfgMagazines' >> _x >> 'displayName'),_x];
								_x call fnc_addpic;
								_ctrl lbSetData [(lbsize _ctrl)-1,_x];
							} forEach ALL_MAGS_TO_SEARCH_C;
						};
					};
				};
				if('==== Bags ====' call ADMINLEVELACCESS)then
				{
					_ctrl lbAdd '==== Bags ====';
					if(!isNil 'infiSTAR_add_bags')then
					{
						if(infiSTAR_MOD == 'Epoch')then
						{
							_ctrl lbAdd '   ==== Epoch Bags ====';
							{
								_ctrl lbAdd format['%1 (%2)',getText(configFile >> 'CfgVehicles' >> _x >> 'displayName'),_x];
								_x call fnc_addpic;
								_ctrl lbSetData [(lbsize _ctrl)-1,_x];
							} forEach ALL_BAGS_TO_SEARCH_EPOCH;
							_ctrl lbAdd '   ==== Other Bags ====';
							{
								_ctrl lbAdd format['%1 (%2)',getText(configFile >> 'CfgVehicles' >> _x >> 'displayName'),_x];
								_x call fnc_addpic;
								_ctrl lbSetData [(lbsize _ctrl)-1,_x];
								_ctrl lbSetColor [(lbsize _ctrl)-1,[1,0,0,1]];
							} forEach ALL_BAGS_TO_SEARCH_NONEEPOCH;
						}
						else
						{
							{
								_ctrl lbAdd format['%1 (%2)',getText(configFile >> 'CfgVehicles' >> _x >> 'displayName'),_x];
								_x call fnc_addpic;
								_ctrl lbSetData [(lbsize _ctrl)-1,_x];
							} forEach ALL_BAGS_TO_SEARCH_C;
						};
					};
				};
				"; if(_MOD == 'AltisLife')then{ infiSTAR_MAIN_CODE = infiSTAR_MAIN_CODE + "
				if('==== VirtualItems ====' call ADMINLEVELACCESS)then
				{
					_ctrl lbAdd '==== VirtualItems ====';
					if(!isNil 'infiSTAR_add_VirtualItems')then
					{
						{
							_ctrl lbAdd format['%1',_x];
							_ctrl lbSetPicture [(lbsize _ctrl)-1,(getText(missionconfigfile >> 'VirtualItems' >> _x >> 'icon'))];
							_ctrl lbSetPictureColor [(lbsize _ctrl)-1,[1, 1, 1, 1]];
							_ctrl lbSetData [(lbsize _ctrl)-1,_x];
						} forEach VIRTUAL_ITEMS_ARRAY;
					};
				};
				"; }; infiSTAR_MAIN_CODE = infiSTAR_MAIN_CODE + "
			};
			case 1:{
				if('==== Vehicles ====' call ADMINLEVELACCESS)then
				{
					if(!isNil'EPOCH_VehicleSlotCount')then
					{
						_ctrl lbAdd format['vehicle slots: %1   (destroy/delete a vehicle to get a slot!)',EPOCH_VehicleSlotCount];
					};
					_ctrl lbAdd '==== Vehicles ====';
					if(!isNil 'infiSTAR_add_vehicles')then
					{
						if(infiSTAR_MOD == 'Epoch')then
						{
							_ctrl lbAdd '   ==== Epoch Vehicles (checked existing vehicles and config) ====';
							{
								_ctrl lbAdd format['%1 (%2)',getText(configFile >> 'CfgVehicles' >> _x >> 'displayName'),_x];
								_x call fnc_addpic;
								_ctrl lbSetData [(lbsize _ctrl)-1,_x];
							} forEach ALL_VEHS_TO_SEARCH_EPOCH;
							_ctrl lbAdd '   ==== Other Vehicles ====';
							{
								_ctrl lbAdd format['%1 (%2)',getText(configFile >> 'CfgVehicles' >> _x >> 'displayName'),_x];
								_x call fnc_addpic;
								_ctrl lbSetData [(lbsize _ctrl)-1,_x];
								_ctrl lbSetColor [(lbsize _ctrl)-1,[1,0,0,1]];
							} forEach ALL_VEHS_TO_SEARCH_NONEEPOCH;
						}
						else
						{
							{
								_ctrl lbAdd format['%1 (%2)',getText(configFile >> 'CfgVehicles' >> _x >> 'displayName'),_x];
								_x call fnc_addpic;
								_ctrl lbSetData [(lbsize _ctrl)-1,_x];
							} forEach ALL_VEHS_TO_SEARCH_C;
						};
					};
				};
			};
			case 2:{
				if('==== Objects ====' call ADMINLEVELACCESS)then
				{
					_ctrl lbAdd '==== Objects ====';
					if(isNil 'infiSTAR_add_objects')then
					{
						if(infiSTAR_MOD == 'Epoch')then
						{
							_ctrl lbAdd '   ==== Epoch Objects ====';
							{
								_ctrl lbAdd format['%1 (%2)',getText(configFile >> 'CfgVehicles' >> _x >> 'displayName'),_x];
								_ctrl lbSetData [(lbsize _ctrl)-1,_x];
							} forEach ALL_OBJS_TO_SEARCH_EPOCH;
							_ctrl lbAdd '   ==== Other Objects ====';
							{
								_ctrl lbAdd format['%1 (%2)',getText(configFile >> 'CfgVehicles' >> _x >> 'displayName'),_x];
								_ctrl lbSetData [(lbsize _ctrl)-1,_x];
								_ctrl lbSetColor [(lbsize _ctrl)-1,[1,0,0,1]];
							} forEach ALL_OBJS_TO_SEARCH_NONEEPOCH;
						}
						else
						{
							_ctrl lbAdd '   ==== Objects ====';
							{
								_ctrl lbAdd format['%1 (%2)',getText(configFile >> 'CfgVehicles' >> _x >> 'displayName'),_x];
								_ctrl lbSetData [(lbsize _ctrl)-1,_x];
							} forEach ALL_OBJS_TO_SEARCH_C;
						};
					};
				};
			};
		};
	};
	if(FILLMAINSTATE == 0)then
	{
		_onTarget = [];
		{if(_x call ADMINLEVELACCESS)then{_onTarget pushBack _x;};} forEach infiSTAR_OnTargetNICE;
		if!(_onTarget isEqualTo [])then{_onTarget pushBack '---';};
		{if(_x call ADMINLEVELACCESS)then{_onTarget pushBack _x;};} forEach infiSTAR_OnTargetEVIL;
		if!(_onTarget isEqualTo [])then
		{
			_ctrl lbAdd '==== OnTarget ====';
			if(isNil 'infiSTAR_add_OnTarget')then
			{
				{_ctrl lbAdd _x;} forEach _onTarget;
			};
		};
		
		
		_Toggleable = [];
		{if(_x call ADMINLEVELACCESS)then{_Toggleable pushBack _x;};} forEach infiSTAR_Toggleable;
		if!(_Toggleable isEqualTo [])then
		{
			_ctrl lbAdd '==== Toggleable ====';
			if(isNil 'infiSTAR_add_Toggleable')then
			{
				{_ctrl lbAdd _x;} forEach _Toggleable;
			};
		};
		
		if(infiSTAR_MOD == 'AltisLife')then
		{
			_AltisLifeMisc = [];
			{if(_x call ADMINLEVELACCESS)then{_AltisLifeMisc pushBack _x;};} forEach infiSTAR_AltisLifeMisc;
			if!(_AltisLifeMisc isEqualTo [])then
			{
				_ctrl lbAdd '==== AltisLife Misc ====';
				if(isNil 'infiSTAR_add_AltisLife')then
				{
					{_ctrl lbAdd _x;} forEach _AltisLifeMisc;
				};
			};
			if('==== AltisLife Money ====' call ADMINLEVELACCESS)then
			{
				_ctrl lbAdd '==== AltisLife Money ====';
				if(!isNil 'infiSTAR_add_AltisLifeMoney')then
				{
					{
						_ctrl lbAdd _x;
					} forEach infiSTAR_AltisLifeMoney;
					_ctrl lbAdd '';
				};
			};
		};
		"; if(_MOD == 'Epoch')then{ infiSTAR_MAIN_CODE = infiSTAR_MAIN_CODE + "
			if('==== Base Deleter ====' call ADMINLEVELACCESS)then
			{
				_index = _ctrl lbAdd '==== Base Deleter ====';
				_ctrl lbSetColor [_index, [0.2,0.4,1,1]];
				_ctrl lbAdd 'BD: Set Center';
				if(!isNil 'CCGbdCenter')then{
					_ctrl lbAdd 'BD: Set Radius';
				};
				if(!isNil 'CCGbdCenter' && !isNil 'CCGbdRadius')then{
					_ctrl lbAdd '';
					_objects = call CCG_fnc_bdGetObjectsToDelete;
					_ctrl lbAdd format['BD: Selected %1 Objects', count _objects];
					_index = _ctrl lbAdd 'BD: Delete';
					_ctrl lbSetColor [_index, [0.8,0,0,1]];
					_ctrl lbAdd '';
				};
				_ctrl lbAdd 'BD: Cancel';
				_index = _ctrl lbAdd '=== ========= ===';
				_ctrl lbSetColor [_index, [0.2,0.4,1,1]];
			};
		"; }; infiSTAR_MAIN_CODE = infiSTAR_MAIN_CODE + "
		
		if('BIS FreeRoam Cam (works with ESP)' call ADMINLEVELACCESS)then{_ctrl lbAdd 'BIS FreeRoam Cam (works with ESP)'};
		if('FreeRoam Cam (does not work with ESP)' call ADMINLEVELACCESS)then{_ctrl lbAdd 'FreeRoam Cam (does not work with ESP)'};
		if('AdminConsole' call ADMINLEVELACCESS)then{_ctrl lbAdd 'AdminConsole';};
		if('Mass Message' call ADMINLEVELACCESS)then{_ctrl lbAdd 'Mass Message';};
		if('Call EMP' call ADMINLEVELACCESS)then{_ctrl lbAdd 'Call EMP'};
		if('DayTime' call ADMINLEVELACCESS)then{_ctrl lbAdd 'DayTime';};
		if('NightTime' call ADMINLEVELACCESS)then{_ctrl lbAdd 'NightTime';};
		if('Spawn Epoch-Box' call ADMINLEVELACCESS)then{if(infiSTAR_MOD == 'Epoch')exitWith{_ctrl lbAdd 'Spawn Epoch-Box';};};
		if('Spawn Support-Box1' call ADMINLEVELACCESS)then{_ctrl lbAdd 'Spawn Support-Box1';};
		if('Spawn Support-Box2' call ADMINLEVELACCESS)then{_ctrl lbAdd 'Spawn Support-Box2';};
		if('Spawn Support-Box3' call ADMINLEVELACCESS)then{_ctrl lbAdd 'Spawn Support-Box3';};
		if('Arsenal' call ADMINLEVELACCESS)then{_ctrl lbAdd 'Arsenal';};
		if('Arsenal' call ADMINLEVELACCESS)then{_ctrl lbAdd 'Arsenal (Mousewheel)';};
		if('Spawn Ammo' call ADMINLEVELACCESS)then{_ctrl lbAdd 'Spawn Ammo';};
		_ctrl lbAdd 'Self Disconnect';
		_target = lbtext[LEFT_CTRL_ID,(lbCurSel LEFT_CTRL_ID)];
		if('Login as Arma Admin' call ADMINLEVELACCESS)then
		{
			if(isNil 'serverCommandLoginDone')then{_ctrl lbAdd 'Login';};
			if(serverCommandAvailable '#logout')then
			{
				_ctrl lbAdd format['#kick %1',_target];
				_ctrl lbAdd format['#exec ban %1',str _target];
			};
		};
	};
	[] call fnc_colorizeMain;
	for '_i' from 0 to 10 do {_ctrl lbAdd '';};
};
fnc_infiSTAR_get_LeftClicks = {
	_array = allPlayers;
	_array append allDeadMen;
	_array
};
fn_infiSTARAdmin_fillPlayer_REAL = {
	disableSerialization;
	if(!isNil 'filling_infiSTAR_Player')exitWith{};
	filling_infiSTAR_Player = positionCameraToWorld [0,0,0];
	_ctrl = (findDisplay MAIN_DISPLAY_ID) displayCtrl LEFT_CTRL_ID;
	lbclear _ctrl;
	_unsorted = call fnc_infiSTAR_get_LeftClicks;
	_sorted = _unsorted;
	lbclear _ctrl;
	if!(_sorted isEqualTo [])then
	{
		_fnc_addPlayerToList = {
			if(isNull _x)exitWith{};
			_PUIDX = getPlayerUID _x;
			if(_PUIDX == '')exitWith{};
			_name = _x getVariable['playerName',name _x];
			_side = side _x;
			_clr = _side call {
				if(_this == civilian)exitWith{[0.67,0.97,0.97,1]};
				if(_this == west)exitWith{[0.047,0.502,1,1]};
				if(_this == resistance)exitWith{[0,0.65,0,1]};
				if(_this == east)exitWith{[1,0.17,0.17,1]};
				[1,1,1,1]
			};
			_name = format['%1 [%2]',_name,_side];
			_index = _ctrl lbAdd _name;
			
			_veh = vehicle _x;
			_xpic = getText (configFile >> 'CfgVehicles' >> (typeOf _veh) >> 'picture');
			if(alive _x)then
			{
				if(_x == _veh)then
				{
					_wpnstate = weaponState _x;
					_cwep = _wpnstate select 0;
					if(_cwep != '')then
					{
						_xpic = getText (configFile >> 'CfgWeapons' >> _cwep >> 'picture');
					};
				};
			};
			if!(_xpic isEqualTo '')then
			{
				_ctrl lbSetPicture [_index,_xpic];
				_ctrl lbSetPictureColor [_index,[1, 1, 1, 1]];
			};
			_PUIDX = getPlayerUID _x;
			if(((_PUIDX in infiSTAR_ADMINS)&&!(_PUIDX in infiSTAR_DEVS))||((_PUIDX in infiSTAR_DEVS)&&(MYPUIDinfiESP in infiSTAR_DEVS))||(_PUIDX == MYPUIDinfiESP))then{_clr = [0,1,0,1];};
			if(_x isEqualTo SELECTED_TARGET_PLAYER)then{_clr = [1,0.7,0.15,1];};
			_ctrl lbSetColor [_index,_clr];
		};
		
		
		if(!isNil'SortAlphaPlease')exitWith
		{
			{call _fnc_addPlayerToList} forEach _sorted;
		};
		if(!isNil'SortGroupsPlease')exitWith
		{
			_shown = [];
			{
				_grp = group _x;
				if!(_grp in _shown)then
				{
					_shown pushBack _grp;
					
					_ctrl lbAdd format['______%1______',_grp];
					{
						call _fnc_addPlayerToList;
					} forEach (units _grp);
				};
			} forEach _sorted;
		};
		if(!isNil'SortRangePlease')exitWith
		{
			_sorted = [_unsorted,[],{filling_infiSTAR_Player distance _x},'ASCEND'] call BIS_fnc_sortBy;
			{call _fnc_addPlayerToList} forEach _sorted;
		};
	};
	_display = findDisplay MAIN_DISPLAY_ID;
	_btnSortAlpha = _display displayCtrl 10;if(!isNil 'SortAlphaPlease')then{lbSort _ctrl;_btnSortAlpha ctrlSetTextColor [0,1,0,1];} else {_btnSortAlpha ctrlSetTextColor [1,1,1,1];};
	_btnSortGroups = _display displayCtrl 11;if(!isNil 'SortGroupsPlease')then{_btnSortGroups ctrlSetTextColor [0,1,0,1];} else {_btnSortGroups ctrlSetTextColor [1,1,1,1];};
	_btnSortRange = _display displayCtrl 12;if(!isNil 'SortRangePlease')then{_btnSortRange ctrlSetTextColor [0,1,0,1];} else {_btnSortRange ctrlSetTextColor [1,1,1,1];};
	_ctrl lbAdd '-----------------------------------';
	_index = _ctrl lbAdd '[civilian]';_ctrl lbSetColor [_index,[0.67,0.97,0.97,1]];
	_index = _ctrl lbAdd '[west]';_ctrl lbSetColor [_index,[0.047,0.502,1,1]];
	_index = _ctrl lbAdd '[east]';_ctrl lbSetColor [_index,[1,0.17,0.17,1]];
	_index = _ctrl lbAdd '[resistance]';_ctrl lbSetColor [_index,[0,0.65,0,1]];
	_index = _ctrl lbAdd '[Admin]';_ctrl lbSetColor [_index,[0,1,0,1]];
	_index = _ctrl lbAdd '[Dead Player]';_ctrl lbSetColor [_index,[1,1,1,1]];
	for '_i' from 0 to 10 do {_ctrl lbAdd '';};
	filling_infiSTAR_Player = nil;
};
fn_infiSTARAdmin_fillPlayer = {
	[
		'',
		{
			call fn_infiSTARAdmin_fillPlayer_REAL
		}
	] execFSM 'call.fsm';
};
fnc_LBDblClick_LEFT = {
	_target = lbtext[LEFT_CTRL_ID,(lbCurSel LEFT_CTRL_ID)];
	if('spectating' call ADMINLEVELACCESS)then{(call fnc_LBSelChanged_LEFT) call fnc_beginspectate;};
};
fnc_LBSelChanged_LEFT = {
	_target = lbtext[LEFT_CTRL_ID,(lbCurSel LEFT_CTRL_ID)];
	_break = false;
	_puid = '';
	SELECTED_TARGET_PLAYER = objNull;
	{
		_puid = getPlayerUID _x;
		if(_puid != '')then {
			_search = format['%1 [%2]',name _x,side _x];
			if(_search == _target)then {
				_break = true;
				SELECTED_TARGET_PLAYER = _x;
			};
		};
		if(_break)exitWith{true};
	} forEach (call fnc_infiSTAR_get_LeftClicks);
	if(!isNull (findDisplay MAIN_DISPLAY_ID displayCtrl 44463))then{ (findDisplay MAIN_DISPLAY_ID displayCtrl 44463) ctrlSetText format['SELECTED TARGET: %1',SELECTED_TARGET_PLAYER]; };
	if(visibleMap)then {
		(uiNamespace getVariable 'A3MAPICONS_mainMap') ctrlMapAnimAdd [1, 0.1, getPos SELECTED_TARGET_PLAYER];
		ctrlMapAnimCommit (uiNamespace getVariable 'A3MAPICONS_mainMap');
	};
	if(isNull SELECTED_TARGET_PLAYER)then{SELECTED_TARGET_PLAYER = player;};
	SELECTED_TARGET_PLAYER
};
fnc_toggleables = {
	switch (_this) do {
		case 'infiSTAR Player ESP 1':{call infiSTAR_fnc_infiESP_player1;};
		case 'infiSTAR Player ESP 2':{call infiSTAR_fnc_infiESP_player2;};
		case 'infiSTAR AI ESP':{call infiSTAR_fnc_infiESP_AI;};
		case 'infiSTAR Dead ESP':{call infiSTAR_fnc_infiESP_DEAD;};
		case 'infiSTAR LockBox ESP':{call infiSTAR_fnc_infiESP_LOCKBOX;};
		case 'infiSTAR Shelf ESP':{call infiSTAR_fnc_infiESP_SHELF;};
		case 'infiSTAR PlotPole ESP':{call infiSTAR_fnc_infiESP_PLOTPOLE;};
		case 'infiSTAR MapIcons':{call infiSTAR_A3MAPICONS;};
		case 'PlotPole Marker':{call adminPlotPole;};
		case 'Vehicle Marker':{call adminVehicleMarker;};
		case 'Construction Marker':{call adminConstructions;};
		case 'LockBox Marker':{call adminLockBox;};
		case 'Fake Epoch group to nearest PlotPole':{call fake_epoch_grp;};
		case 'DeadPlayer Marker':{call adminDeadPlayer;};
		case 'God Mode':{call infiSTAR_A3Invulnerability;};
		case 'Vehicle God Mode':{call fnc_infiSTAR_A3cargod;};
		case 'Lower Terrain':{call fnc_LowerTerrain;};
		case 'Vehboost':{call infiSTAR_VehicleBoost;};
		case 'UnlimAmmo':{[] spawn fnc_infiSTAR_A3UnlAmmo;};
		case 'noRecoil':{[] spawn fnc_infiSTAR_A3noRecoil;};
		case 'FastFire':{[] spawn fnc_infiSTAR_A3FF;};
		case 'Stealth / Invisible':{call fnc_infiSTARHIDE;};
		case 'Disable Announces':{call fnc_DisableAnnouncements;};
		case 'Default Epoch Player ESP':{true spawn fnc_Epochs_ESP;};
		case 'Default Epoch Vehicle ESP':{false spawn fnc_Epochs_ESP;};
		case 'Teleport In Facing Direction (10m steps)':{if(isNil'infiSTAR_TpdirectionENABLED')then{infiSTAR_TpdirectionENABLED=true}else{infiSTAR_TpdirectionENABLED=nil;};};
	};
	if(_this in infiSTAR_toggled_A)then
	{
		lbSetColor [RIGHT_CTRL_ID,1,[1,0,0,1]];
		infiSTAR_toggled_A = infiSTAR_toggled_A - [_this];
		_log = format['%1 - 0',_this];
		_log call fnc_adminLog;
	}
	else
	{
		lbSetColor [RIGHT_CTRL_ID,1,[0,1,0,1]];
		infiSTAR_toggled_A pushBack _this;
		_log = format['%1 - 1',_this];
		_log call fnc_adminLog;
	};
};
fnc_LBDblClick_RIGHT = {
	_click = lbtext[RIGHT_CTRL_ID,(lbCurSel RIGHT_CTRL_ID)];
	if(!isNil'VIRTUAL_ITEMSTHREAD')then{terminate VIRTUAL_ITEMSTHREAD;VIRTUAL_ITEMSTHREAD=nil;};
	if(_click == '')exitWith{};
	if(_click in AH_HackLogArray)exitWith{_click call FN_SHOW_LOG;diag_log _click;};
	if(_click in AH_SurvLogArray)exitWith{_click call FN_SHOW_LOG;diag_log _click;};
	if(_click in AH_AdmiLogArray)exitWith{_click call FN_SHOW_LOG;diag_log _click;};
	if(_click in PVAH_AHTMPBAN)exitWith{
		[-667,player,_click] call fnc_AdminReq;
		_log = format['Removed  %1  from TempBan Variable. Might still be banned in ban(s).txt',_click];
		_log call FN_SHOW_LOG;
		[] call fnc_fill_HackLog;[] call fn_infiSTARAdmin_setFocus;
	};
	if(_click in infiSTAR_Toggleable)then{_click call fnc_toggleables;};
	if(_click in infiSTAR_OnTarget)then
	{
		_unit = call fnc_LBSelChanged_LEFT;
		_uid = getPlayerUID _unit;
		switch (_click) do {
			case 'Teleport - Target To Me':{[_unit] call fnc_TP2ME;};
			case 'Teleport - Me To Target':{[_unit] call fnc_TPME2;};
			case 'Request Steam Name':{[_unit] call fnc_getSteamName;};
			case 'Revive':{[_unit] call fnc_ReviveTarget;};
			case 'Heal':{[_unit] call fnc_HealTarget;};
			case 'Restore':{[_unit] call fnc_RepairTarget;};
			case 'Move In My Vehicle':{[_unit] call fnc_MoveInMyVehicle;};
			case 'Move In Target Vehicle':{[_unit] call fnc_MoveInTargetVehicle;};
			case 'Parachute Target':{[_unit] call fnc_MoveInParachute;};
			case 'Freeze Target':{[_unit,true] call fnc_freezeTarget;};
			case 'UnFreeze Target':{[_unit,false] call fnc_freezeTarget;};
			case 'Remove Gear':{[_unit] call fnc_RemoveGear;};
			case 'Restrain':{[_unit,true] call fnc_restrainTarget;};
			case 'Unrestrain':{[_unit,false] call fnc_restrainTarget;};
			case 'Add / Remove Crypto':{call fnc_spawn_CryptoINSERTVALUE;};
			case 'Spawn UAV':{[_unit,'I_UAV_01_F'] call fnc_spawn_EVENT;};
			case 'Spawn Cloak':{[_unit,'Epoch_Cloak_F'] call fnc_spawn_EVENT;};
			case 'Spawn Sapper':{[_unit,'Epoch_Sapper_F'] call fnc_spawn_EVENT;};
			case 'Spawn SapperB':{[_unit,'Epoch_SapperB_F'] call fnc_spawn_EVENT;};
			case 'Eject':{[_unit] call fnc_EjectTargetVeh;};
			case 'Eject Crew':{[_unit] call fnc_EjectCrewTargetVeh;};
			case 'Kill':{[_unit] call fnc_Kill_selected;};
			case 'Explode':{[_unit] call fnc_Explode_selected;};
			case 'MineField (around target)':{[_unit] call fnc_createMinefield;};
			case 'Zeus':{[_unit] call zeus_attack;};
			case 'Delete Vehicle':{[_unit] call fnc_deleteVeh_selected;};
			case 'Force Disconnect':{[_unit] call fnc_Disconnect_selected;};
			case 'Kick (Silent)':{[_unit,0] call fnc_Kick_selected;};
			case 'Kick (Announce)':{[_unit,1] call fnc_Kick_selected;};
			case 'Ban (Silent)':{[_unit,0] call fnc_Ban_selected;};
			case 'Ban (Announce)':{[_unit,1] call fnc_Ban_selected;};
		};
		_log = format['%1 - %2(%3)',_click,_target,_uid];_log call fnc_adminLog;
	};
	"; if(_MOD == 'AltisLife')then{ infiSTAR_MAIN_CODE = infiSTAR_MAIN_CODE + "
	if(_click in infiSTAR_AltisLifeMisc)then
	{
		if(_click == 'Give All Licenses')then{
			if(isNil 'life_licenses')then
			{
				{
					_varName = getText(_x >> 'variable');
					_sideFlag = getText(_x >> 'side');
					missionNamespace setVariable [format['license_%1_%2',_sideFlag,getText(missionConfigFile >> 'Licenses' >> _varName >> 'variable')],true];
				} forEach ('true' configClasses (missionConfigFile >> 'Licenses'));
			}
			else
			{
				{missionnamespace setVariable[(_x select 0),true];}foreach life_licenses;
			};
		};
		_click call fnc_adminLog;
	};
	if(_click in infiSTAR_AltisLifeMoney)then
	{
		switch (_click) do {
			case '50K Cash':{['cash',50000] call fnc_Altislife_money;};
			case '100K Cash':{['cash',100000] call fnc_Altislife_money;};
			case '250K Cash':{['cash',250000] call fnc_Altislife_money;};
			case '500K Cash':{['cash',500000] call fnc_Altislife_money;};
			case '750K Cash':{['cash',750000] call fnc_Altislife_money;};
			case '1.150K Cash':{['cash',1150000] call fnc_Altislife_money;};
			case '2.500K Cash':{['cash',2500000] call fnc_Altislife_money;};
			case '5.000K Cash':{['cash',5000000] call fnc_Altislife_money;};
			case '10.000K Cash':{['cash',10000000] call fnc_Altislife_money;};
			case '50K Bank':{['bank',50000] call fnc_Altislife_money;};
			case '100K Bank':{['bank',100000] call fnc_Altislife_money;};
			case '250K Bank':{['bank',250000] call fnc_Altislife_money;};
			case '500K Bank':{['bank',500000] call fnc_Altislife_money;};
			case '750K Bank':{['bank',750000] call fnc_Altislife_money;};
			case '1.150K Bank':{['bank',1150000] call fnc_Altislife_money;};
			case '2.500K Bank':{['bank',2500000] call fnc_Altislife_money;};
			case '5.000K Bank':{['bank',5000000] call fnc_Altislife_money;};
			case '10.000K Bank':{['bank',10000000] call fnc_Altislife_money;};
		};
		_click call fnc_adminLog;
	};
	"; }; infiSTAR_MAIN_CODE = infiSTAR_MAIN_CODE + "
	switch (_click) do {
		case '==== OnTarget ====':{if(isNil 'infiSTAR_add_OnTarget')then{infiSTAR_add_OnTarget = true;} else {infiSTAR_add_OnTarget = nil;};};
		case '==== Toggleable ====':{if(isNil 'infiSTAR_add_Toggleable')then{infiSTAR_add_Toggleable = true;} else {infiSTAR_add_Toggleable = nil;};};
		case '==== AltisLife Misc ====':{if(isNil 'infiSTAR_add_AltisLife')then{infiSTAR_add_AltisLife = true;} else {infiSTAR_add_AltisLife = nil;};};
		case '==== AltisLife Money ====':{if(isNil 'infiSTAR_add_AltisLifeMoney')then{infiSTAR_add_AltisLifeMoney = true;} else {infiSTAR_add_AltisLifeMoney = nil;};};
		case '==== Weapons ====':{if(isNil 'infiSTAR_add_weapons')then{infiSTAR_add_weapons = true;} else {infiSTAR_add_weapons = nil;};};
		case '==== Magazines ====':{if(isNil 'infiSTAR_add_magazines')then{infiSTAR_add_magazines = true;} else {infiSTAR_add_magazines = nil;};};
		case '==== Bags ====':{if(isNil 'infiSTAR_add_bags')then{infiSTAR_add_bags = true;} else {infiSTAR_add_bags = nil;};};
		"; if(_MOD == 'AltisLife')then{ infiSTAR_MAIN_CODE = infiSTAR_MAIN_CODE + "
		case '==== VirtualItems ====':{if(isNil 'infiSTAR_add_VirtualItems')then{infiSTAR_add_VirtualItems = true;} else {infiSTAR_add_VirtualItems = nil;};};
		"; }; infiSTAR_MAIN_CODE = infiSTAR_MAIN_CODE + "
		case '==== Vehicles ====':{if(isNil 'infiSTAR_add_vehicles')then{infiSTAR_add_vehicles = true;} else {infiSTAR_add_vehicles = nil;};};
		case '==== Objects ====':{if(isNil 'infiSTAR_add_objects')then{infiSTAR_add_objects = true;} else {infiSTAR_add_objects = nil;};};
		case 'clear ingame HackLog':{[0] call fnc_clearLogArray;_click call fnc_adminLog;[] call fnc_fill_HackLog;};
		case 'clear ingame AdminLog':{[1] call fnc_clearLogArray;_click call fnc_adminLog;[] call fnc_fill_AdminLog;};
		case 'BIS FreeRoam Cam (works with ESP)':{call fnc_BIS_FreeRoamCam;};
		case 'FreeRoam Cam (does not work with ESP)':{call fnc_FreeRoamCam;};
		case 'Call EMP':{[] call fnc_startEMP;_click call fnc_adminLog;};
		case 'AdminConsole':{[] call infiSTAR_adminConsoleInit;};
		case 'Mass Message':{[] call fnc_mass_message;};
		case 'DayTime':{[11] call fnc_spawn_timemachine;_click call fnc_adminLog;};
		case 'NightTime':{[23] call fnc_spawn_timemachine;_click call fnc_adminLog;};
		case 'Spawn Epoch-Box':{[0] call fnc_spawn_Box;_click call fnc_adminLog;};
		case 'Spawn Support-Box1':{[1] call fnc_spawn_Box;_click call fnc_adminLog;};
		case 'Spawn Support-Box2':{[2] call fnc_spawn_Box;_click call fnc_adminLog;};
		case 'Spawn Support-Box3':{[3] call fnc_spawn_Box;_click call fnc_adminLog;};
		case 'Arsenal':{[] call infiSTAR_startArsenal;};
		case 'Arsenal (Mousewheel)':{[] call infiSTAR_addArsenal;};
		case 'Spawn Ammo':{[] call infiSTAR_A3addAmmo;};
		case 'Self Disconnect':{_click call fnc_adminLog;(finddisplay 46) closeDisplay 0;};
	};
	_class = lbData[RIGHT_CTRL_ID,(lbCurSel RIGHT_CTRL_ID)];
	if((_class find 'PaperCar' > -1)||(_click find 'PaperCar' > -1))exitWith{'Kicked for trying to spawn a PaperCar' call fnc_adminLog;(finddisplay 46) closeDisplay 0;};
	if(_class in ALL_VEHS_TO_SEARCH_C)exitWith
	{
		_target = call fnc_LBSelChanged_LEFT;
		_position = _target modelToWorld [0,8,0];
		_dir = getDir (vehicle _target);
		
		_log = format['Spawning %1 infront of %2!',_click,name _target];
		
		if(!isNil'EPOCH_VehicleSlotCount')exitWith
		{
			if((EPOCH_VehicleSlotCount == 0)&&((_class isKindOf 'Air' || _class isKindOf 'Ship' || _class isKindOf 'LandVehicle')))then
			{
				_log = format['no vehicle slots left to save %1 in the database (destroy/delete a vehicle to get a slot!)',_click];
				_log call FN_SHOW_LOG;
				[0,player,_class,_position,_dir] call fnc_AdminReq;
				_log call fnc_adminLog;
			}
			else
			{
				_log call FN_SHOW_LOG;
				[0,player,_class,_position,_dir] call fnc_AdminReq;
				format['spawning %1',_click] call fnc_adminLog;
			};
		};
		_log call FN_SHOW_LOG;
		[0,player,_class,_position,_dir] call fnc_AdminReq;
		format['spawning %1',_click] call fnc_adminLog;
	};
	"; if(_MOD == 'AltisLife')then{ infiSTAR_MAIN_CODE = infiSTAR_MAIN_CODE + "
	if(_click in VIRTUAL_ITEMS_ARRAY)exitWith
	{
		VIRTUAL_ITEMSTHREAD = [] spawn FNC_VIRTUAL_ITEMSTHREAD;
		FNC_VIRTUAL_ITEMSTHREAD = {
			disableSerialization;
			ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 65464);
			ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 65460);
			ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 65463);
			ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 65465);
			ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 65466);
			
			findDisplay MAIN_DISPLAY_ID ctrlCreate['IGUIBack', 65464];
			findDisplay MAIN_DISPLAY_ID ctrlCreate['RSCButton', 65460];
			findDisplay MAIN_DISPLAY_ID ctrlCreate['RSCText', 65463];
			findDisplay MAIN_DISPLAY_ID ctrlCreate['RSCEdit', 65465];
			findDisplay MAIN_DISPLAY_ID ctrlCreate['RSCButton', 65466];
			
			(findDisplay MAIN_DISPLAY_ID displayCtrl 65466) ctrlSetEventHandler['ButtonClick','
				_msg = (ctrlText((findDisplay MAIN_DISPLAY_ID) displayCtrl 65465));
				if(_msg != '''')then
				{
					if(isNil''SELECTED_TARGET_PLAYER'')exitWith{''no selected target'' call FN_SHOW_LOG};
					if(isNull SELECTED_TARGET_PLAYER)exitWith{''no selected target'' call FN_SHOW_LOG};
					if!(isPlayer SELECTED_TARGET_PLAYER)exitWith{''no selected target'' call FN_SHOW_LOG};
					if!(alive SELECTED_TARGET_PLAYER)exitWith{''no selected target'' call FN_SHOW_LOG};
					
					_arraymsg = toArray _msg;
					_breakout=false;
					{if!(_x in [34,48,49,50,51,52,53,54,55,56,57])exitWith{_breakout=true;};} forEach _arraymsg;
					if(_breakout)exitWith{format[''PLEASE ENTER NUMBERS ONLY - %1'',_msg] call FN_SHOW_LOG;};
					
					_value = parseNumber _msg;
					_value = round _value;
					if(_value == 0)exitWith{''value is 0'' call FN_SHOW_LOG};
					if(_value > 999999)exitWith{''value can not be higher than 999999'' call FN_SHOW_LOG};
					
					_click = lbtext[RIGHT_CTRL_ID,(lbCurSel RIGHT_CTRL_ID)];
					if!(_click in VIRTUAL_ITEMS_ARRAY)exitWith{format[''Class -%1- not in VirtualGoods'',_click] call FN_SHOW_LOG;};
					
					[''[true,''+str _click+'',''+str _value+''] call life_fnc_handleInv;'',SELECTED_TARGET_PLAYER] call admin_d0_target;
					
					_log = format[''Added %1 %2s to %3!'',_value,_click,name SELECTED_TARGET_PLAYER];
					_log call FN_SHOW_LOG;
					_log call fnc_adminLog;
				};
			'];
			
			
			(findDisplay MAIN_DISPLAY_ID displayCtrl 65460) ctrlSetText 'Close';
			(findDisplay MAIN_DISPLAY_ID displayCtrl 65460) ctrlSetPosition [
				0.55 * safezoneW + safezoneX,
				0.365,
				0.0360937 * safezoneW,
				0.033 * safezoneH
			];
			(findDisplay MAIN_DISPLAY_ID displayCtrl 65460) ctrlSetEventHandler['ButtonClick','closeDialog 0;'];
			(findDisplay MAIN_DISPLAY_ID displayCtrl 65466) ctrlSetText 'OK';
			(findDisplay MAIN_DISPLAY_ID displayCtrl 65466) ctrlSetPosition [
				(0.55 * safezoneW + safezoneX)+(0.2 * safezoneW)-(0.0360937 * safezoneW),
				0.365,
				0.0360937 * safezoneW,
				0.033 * safezoneH
			];
			(findDisplay MAIN_DISPLAY_ID displayCtrl 65463) ctrlSetPosition [
				0.55 * safezoneW + safezoneX,
				0.25,
				0.2 * safezoneW,
				0.03 * safezoneH
			];
			(findDisplay MAIN_DISPLAY_ID displayCtrl 65465) ctrlSetPosition [
				0.55 * safezoneW + safezoneX,
				0.31,
				0.2 * safezoneW,
				0.03 * safezoneH
			];
			
			(findDisplay MAIN_DISPLAY_ID displayCtrl 65464) ctrlSetPosition [
				0.55 * safezoneW + safezoneX,
				0.25,
				0.2 * safezoneW,
				0.06 * safezoneH
			];
			
			(findDisplay MAIN_DISPLAY_ID displayCtrl 65460) ctrlCommit 0;
			(findDisplay MAIN_DISPLAY_ID displayCtrl 65464) ctrlCommit 0;
			(findDisplay MAIN_DISPLAY_ID displayCtrl 65465) ctrlCommit 0;
			(findDisplay MAIN_DISPLAY_ID displayCtrl 65466) ctrlCommit 0;
			while {true} do
			{
				_click = lbtext[RIGHT_CTRL_ID,(lbCurSel RIGHT_CTRL_ID)];
				if(_click in VIRTUAL_ITEMS_ARRAY)then
				{
					(findDisplay MAIN_DISPLAY_ID displayCtrl 65463) ctrlSetText format['add [%1] to [%2]',_click,name SELECTED_TARGET_PLAYER];
				}
				else
				{
					(findDisplay MAIN_DISPLAY_ID displayCtrl 65463) ctrlSetText 'No Virtual Item Selected';
				};
				(findDisplay MAIN_DISPLAY_ID displayCtrl 65463) ctrlCommit 0;
				
				uiSleep .001;
			};
		};
	};
	"; }; infiSTAR_MAIN_CODE = infiSTAR_MAIN_CODE + "
	if(_class in ALL_OBJS_TO_SEARCH_C)exitWith
	{
		_target = call fnc_LBSelChanged_LEFT;
		LOCAL_OBJ = _class createVehicleLocal [0,0,0];
		_bbr = boundingBoxReal LOCAL_OBJ;
		_p1 = _bbr select 0;
		_p2 = _bbr select 1;
		_maxWidth = abs ((_p2 select 0) - (_p1 select 0));
		_maxLength = abs ((_p2 select 1) - (_p1 select 1));
		_maxHeight = abs ((_p2 select 2) - (_p1 select 2));
		_dist = (_maxWidth max _maxLength)*2;
		_dir = getDir (vehicle _target);
		LOCAL_OBJ setDir _dir;
		LOCAL_OBJ setPos (_target modelToWorld [0,_dist,(_maxHeight/2)]);
		call fnc_redoControlsMoveObj;
		
		_log = format['Spawning %1 infront of %2!',_click,name _target];
		_log call FN_SHOW_LOG;
		
		format['spawning %1',_click] call fnc_adminLog;
	};
	if(_class in ALL_BAGS_TO_SEARCH_C)exitWith
	{
		_target = call fnc_LBSelChanged_LEFT;
		_pos = getPosATL _target;
		
		_log = format['Spawning %1 on the ground infront of %2!',_click,name _target];
		_log call FN_SHOW_LOG;
		
		if(local _target)then{_target addBackpack _class;}else{['player addBackpack '+str _class+';',_target] call admin_d0_target;};
		format['spawning %1',_click] call fnc_adminLog;
	};
	if(_class in ALL_WEPS_TO_SEARCH_C)exitWith
	{
		_target = call fnc_LBSelChanged_LEFT;
		_pos = getPosATL _target;
		
		_log = format['Spawning %1 on the ground infront of %2!',_click,name _target];
		_log call FN_SHOW_LOG;
		
		[3,player,_pos,_class] call fnc_AdminReq;
		format['spawning %1',_click] call fnc_adminLog;
	};
	if(_class in ALL_MAGS_TO_SEARCH_C)exitWith
	{
		format['spawning %1',_click] call fnc_adminLog;
		_target = call fnc_LBSelChanged_LEFT;
		if(!isPlayer _target)exitWith{
			_log = format['Spawning %1 on the ground infront of %2!',_click,name _target];
			_log call FN_SHOW_LOG;
		};
		
		if(fillmainstate == 6)exitWith
		{
			_log = format['Spawning %1..',_click];
			_log call FN_SHOW_LOG;
			
			if(local _target)then
			{
				_countMag = {_x == _class} count (magazines _target);
				_target addMagazine _class;
				_newCountMag = {_x == _class} count (magazines _target);
				if(_countMag == _newCountMag)then
				{
					_target linkItem _class;
				};
			}
			else
			{
				['
					_target = player;
					_class = '+str _class+';
					
					_countMag = {_x == _class} count (magazines _target);
					_target addMagazine _class;
					_newCountMag = {_x == _class} count (magazines _target);
					if(_countMag == _newCountMag)then
					{
						_target linkItem _class;
					};
				',_target] call admin_d0_target;
			};
		};
		
		_pos = getPosATL _target;
		_log = format['Spawning %1 on the ground infront of %2!',_click,name _target];
		_log call FN_SHOW_LOG;
		[3,player,_pos,_class] call fnc_AdminReq;
	};
	if(infiSTAR_MOD == 'Epoch')then{[_click] call CCG_fnc_adminClick;};
	if(_click in infiSTAR_Loadouts)then
	{
		switch (_click) do {
			case 'Epoch 1':{[0] call fnc_add_loadout;};
			case 'Epoch 2':{[1] call fnc_add_loadout;};
			case 'Sub Machinegun Kit':{[2] call fnc_add_loadout;};
			case 'Light Infantry Kit':{[3] call fnc_add_loadout;};
			case 'Heavy Infantry Kit':{[4] call fnc_add_loadout;};
			case 'DMR Sniper Kit':{[5] call fnc_add_loadout;};
			case 'LLR Sniper Kit':{[6] call fnc_add_loadout;};
			case 'Lynx Sniper Kit':{[7] call fnc_add_loadout;};
			case 'M107 Sniper Kit':{[8] call fnc_add_loadout;};
		};
		_click call fnc_adminLog;
	};
	if(_click == 'Login')then{if(isNil 'serverCommandLoginDone')then{serverCommandLoginDone = true;serverCommand ('#login '+passwordAdmin);};};
	if((_click find '#kick' > -1) || (_click find '#exec' > -1))then{serverCommand _click;};
	if((FILLMAINSTATE == 0)||(FILLMAINSTATE == 1))then{[] call fnc_fill_infiSTAR_MAIN;};
};
fnc_LBSelChanged_RIGHT = {
	_class = lbData[RIGHT_CTRL_ID,(lbCurSel RIGHT_CTRL_ID)];
	_cfg = call {
		if(isClass (configFile >> 'CfgWeapons' >> _class))exitWith{'CfgWeapons'};
		if(isClass (configFile >> 'CfgMagazines' >> _class))exitWith{'CfgMagazines'};
		if(isClass (configFile >> 'CfgVehicles' >> _class))exitWith{'CfgVehicles'};
		''
	};
	if(_cfg != '')then
	{
		_xposT = 0.6;
		_yposT = 0.375 * safezoneH + safezoneY;
		_txt = (gettext (configFile >> _cfg >> _class >> 'Library' >> 'libTextDesc'));
		if(_txt == '')then{_txt = 'by infiSTAR.de';};
		
		if(_cfg=='CfgVehicles')then{
			_vehicleConfig=configFile>>_cfg>>_class;
			_info = format['Capacity: %1 Armor: %2 Fuel: %3 MaxSpeed: %4',getNumber(_vehicleConfig>>'maximumLoad'),getNumber(_vehicleConfig>>'armor'),getNumber(_vehicleConfig>>'fuelCapacity'),getNumber(_vehicleConfig>>'maxSpeed')];
			_log = format['Class: %1 %2',_class,_info];
			_txt=(_info+'<br/>'+_txt);
		};
		
		['
			<t size=''0.4''>'+_txt+' </t>
		',_xposT,_yposT,15,0,0,8407] spawn bis_fnc_dynamicText;
		
		_xposP = 0.525 * safezoneW + safezoneX;
		_yposP = 0.175 * safezoneH + safezoneY;
		_pic = (getText (configFile >> _cfg >> _class >> 'picture'));
		if((toLower _pic) in ['','pictureheal','picturepapercar','picturething','picturestaticobject'])exitWith{};
		['
			<img size=''3.5'' image='''+_pic+'''/>
		',_xposP,_yposP,15,0,0,8406] spawn bis_fnc_dynamicText;
	};
};
fnc_getConfig = {
	_cfg = '';
	if(isClass (configFile >> 'CfgWeapons' >> _this))then
	{
		_cfg = 'CfgWeapons';
	}
	else
	{
		if(isClass (configFile >> 'CfgMagazines' >> _this))then
		{
			_cfg = 'CfgMagazines';
		}
		else
		{
			if(isClass (configFile >> 'CfgVehicles' >> _this))then
			{
				_cfg = 'CfgVehicles';
			};
		};
	};
	_cfg
};
admin_showGear = {
	if(!isNull cameraOn)then
	{
		if(!isNil'show_gear_thread')then{terminate show_gear_thread;show_gear_thread=nil;};
		show_gear_thread = [] spawn {
			waitUntil {closeDialog 0;!dialog};
			createGearDialog [cameraOn,'RscDisplayInventory'];
		};
		_log = format['Showing Gear of %1',cameraOn call fn_infiSTAR_ObjName];
		_log call FN_SHOW_LOG;
	};
};
fnc_endSpectate = {
	if(!isNil'SPECTATE_THREAD')then{terminate SPECTATE_THREAD;SPECTATE_THREAD=nil;};
	(vehicle player) switchCamera cameraView;
	ctrlDelete ((findDisplay 46) displayCtrl 3025);
	if(cameraOn isEqualTo (vehicle player))exitWith{};
	_log = 'Finished spectating.';
	_log call FN_SHOW_LOG;
};
fnc_beginspectate = {
	if(!isNil'SPECTATE_THREAD')then{terminate SPECTATE_THREAD;SPECTATE_THREAD=nil;};
	SPECTATE_THREAD = _this spawn {
		disableSerialization;
		_unit = _this;
		_uid = getPlayerUID _unit;
		_log = format['SPECTATE - switchedCamera on %1(%2) - %3',_unit call fn_infiSTAR_ObjName,_uid,typeOf (vehicle _unit)];
		_log call fnc_adminLog;
		
		_ctrl = [findDisplay 46,'RscStructuredText',3025] call fnc_createctrl;
		_ctrl ctrlSetPosition [safezoneX+0.2,safezoneY+0.1,0.8,1];
		_ctrl ctrlCommit 0;
		while {true} do
		{
			_uid = getPlayerUID _unit;
			if(_uid isEqualTo '')exitWith{call fnc_endspectate;};
			_veh = vehicle _unit;
			if!(_veh isEqualTo cameraOn)then
			{
				player reveal _unit;
				player reveal _veh;
				_veh switchCamera cameraView;
			};
			if(show_spectate_overlay)then
			{
				_ctrlText = '<t align=''left'' shadow=''2'' size=''0.8'' color=''#667FFF''>Spectating - F9 to show inventory, SHIFT + F9 to hide/show overlay, F10 to exit/stop spectating</t><br/>';
				_log = format['%1 (%2 - %3) @%4',_unit call fn_infiSTAR_ObjName, _uid, netId _unit, mapGridPosition _veh];
				_ctrlText = _ctrlText + '<t align=''left'' shadow=''2'' size=''1.1'' color=''#238701''>'+_log+'</t>';
				
				_cwep = '';
				_cammo = '';
				_cmags = '';
				_wpnstate = weaponState _unit;
				if(!isNil '_wpnstate')then
				{
					if(str _wpnstate != '[]')then
					{
						_cwep = _wpnstate select 0;
						_cmags = {_wpnstate select 3 == _x} count magazines _unit;
						_cammo = _wpnstate select 4;
					};
				};
				if(_cwep == '')then
				{
					_ctrlText = _ctrlText + '<br/><t align=''left'' shadow=''2'' size=''1.1'' color=''#238701''>Bare Fists</t>';
				}
				else
				{
					_type = _cwep;
					_cfg = _type call fnc_getConfig;
					_displayName = getText (configFile >> _cfg >> _type >> 'displayName');
					_pic = getText (configFile >> _cfg >> _type >> 'picture');
					_log3 = format[' %1 [%2] (%3/%4)',_displayName, _cwep, _cammo, _cmags];					
					_ctrlText = _ctrlText + '<br/><img image='''+_pic+''' align=''left'' shadow=''2'' size=''1.1''/><t align=''left'' shadow=''2'' size=''1.1'' color=''#238701''>'+_log3+'</t>';
					
					if(_veh != _unit)then
					{
						_cwepsV = [];
						{
							if(_x find 'Horn' == -1)then
							{
								_cwepsV pushBack _x;
							};
						} forEach (weapons _veh);
						
						if(count _cwepsV > 0)then
						{
							_YPOS = safezoneY+0.355;
							
							{
								_cwep = _x;
								_cammo = _veh ammo _cwep;
								_cmags = {currentMagazine _veh == _x} count magazines _veh;
								
								_type = _cwep;
								_cfg = _type call fnc_getConfig;
								_displayName = getText (configFile >> _cfg >> _type >> 'displayName');
								
								_log3a = format[' %1 [%2] (%3/%4)',_displayName, _cwep, _cammo, _cmags];
								_ctrlText = _ctrlText + '<br/><t align=''left'' shadow=''2'' size=''1.1'' color=''#A90F68''>'+_log3a+'</t>';
								_YPOS = _YPOS - 0.03;
							} forEach _cwepsV;
						};
					};
				};
				
				_ct = cursorTarget;
				if(!isNull _ct)then
				{
					if(getPlayerUID _ct != '')then
					{
						_cwep_ct = currentWeapon _ct;
						_cammo_ct = _ct ammo _cwep_ct;
						_cmags_ct = {currentMagazine _ct == _x} count magazines _ct;
						
						_log4 = format['%1 (%2) @%3',_ct call fn_infiSTAR_ObjName, getPlayerUID _ct, mapGridPosition _ct];
						_ctrlText = _ctrlText + '<br/><t align=''left'' shadow=''2'' size=''1.1'' color=''#B80B36''>'+_log4+'</t>';
						
						_log5 = format['Health: %1  Distance: %2m',(1-(damage _ct))*100, round(cameraOn distance _ct)];
						_ctrlText = _ctrlText + '<br/><t align=''left'' shadow=''2'' size=''1.1'' color=''#B80B36''>'+_log5+'</t>';
						
						_type = _cwep_ct;
						_cfg = _type call fnc_getConfig;
						_displayName = getText (configFile >> _cfg >> _type >> 'displayName');
						_pic = getText (configFile >> _cfg >> _type >> 'picture');
						_log6 = format[' %1 [%2] (%3/%4)',_displayName, _cwep_ct, _cammo_ct, _cmags_ct];
						_ctrlText = _ctrlText + '<br/><img image='''+_pic+''' align=''left'' shadow=''2'' size=''1.1''/><br/><t align=''left'' shadow=''2'' size=''1.1'' color=''#B80B36''>'+_log6+'</t>';
					}
					else
					{
						_type = typeOf _ct;
						_cfg = _type call fnc_getConfig;
						_displayName = getText (configFile >> _cfg >> _type >> 'displayName');
						_log4 = format['%1 [%2] @%3',_displayName, _type, mapGridPosition _ct];
						_ctrlText = _ctrlText + '<br/><t align=''left'' shadow=''2'' size=''1.1'' color=''#B80B36''>'+_log4+'</t>';
						
						_log5 = format['Health: %1 - Distance: %2m',(1-(damage _ct))*100, round(cameraOn distance _ct)];
						_ctrlText = _ctrlText + '<br/><t align=''left'' shadow=''2'' size=''1.1'' color=''#B80B36''>'+_log5+'</t>';
					};
					
					_vehCT = vehicle _ct;
					if((_vehCT isKindOf 'LandVehicle') || (_vehCT isKindOf 'Air') || (_vehCT isKindOf 'Ship') || (_vehCT isKindOf 'Static'))then
					{
						_cwepsV = [];
						{
							if(_x find 'Horn' == -1)then
							{
								_cwepsV pushBack _x;
							};
						} forEach (weapons _vehCT);
						
						if(count _cwepsV > 0)then
						{
							_YPOS = safezoneY+0.655;
							
							{
								_cwep = _x;
								_cammo = _vehCT ammo _cwep;
								_cmags = {currentMagazine _vehCT == _x} count magazines _vehCT;
								
								_type = _cwep;
								_cfg = _type call fnc_getConfig;
								_displayName = getText (configFile >> _cfg >> _type >> 'displayName');
								
								_log6a = format[' %1 [%2] (%3/%4)',_displayName, _cwep, _cammo, _cmags];
								_ctrlText = _ctrlText + '<br/><t align=''left'' shadow=''2'' size=''1.1'' color=''#A90F68''>'+_log6a+'</t>';
								_YPOS = _YPOS + 0.03;
							} forEach _cwepsV;
						};
					};
				};
				_ctrl ctrlSetStructuredText parseText _ctrlText;
			}
			else
			{
				_ctrl ctrlSetStructuredText parseText '';
			};
			uiSleep .15;
		};
	};
};
fnc_clearLogArray = {
	[-668,player,_this select 0] call fnc_AdminReq;
	_log = 'ingame Log(s) cleared!';
	_log call FN_SHOW_LOG;
	[] call fnc_FULLinit;
};
fnc_getSteamName = {
	[9876,player,_this select 0] call fnc_AdminReq;
	_log = format['Requested Steam Name of %1(%2)',name (_this select 0),getPlayerUID (_this select 0)];
	_log call FN_SHOW_LOG;
};
fnc_TP2ME = {
	_unit = _this select 0;
	_pos = player modelToWorld [0,12,0];
	if(_unit isEqualTo vehicle _unit)then{_pos = player modelToWorld [0,1,0];};
	[1,player,_unit,_pos] call fnc_AdminReq;
};
fnc_TPME2 = {
	_unit = _this select 0;
	_pos = _unit modelToWorld [0,-5,0];		
	_object = (vehicle player);
	if(str(crew _object) == str([player]))then
	{
		_object setPos _pos;
	}
	else
	{
		[1,player,_unit,_pos] call fnc_AdminReq;
	};
};
fnc_MoveInMyVehicle = {
	_unit = _this select 0;
	_unit moveInAny (vehicle player);
};
fnc_MoveInTargetVehicle = {
	_unit = _this select 0;
	player moveInAny (vehicle _unit);
};
fnc_MoveInParachute = {
	MoveInParachuteObject = _this select 0;
	openMap true;
	_log = format['Click on Map to Parachute %1(%2)',name MoveInParachuteObject,getPlayerUID MoveInParachuteObject];
	_log call FN_SHOW_LOG;
	fnc_getParachutePos = {
		_parachuteObject = createVehicle ['Steerable_Parachute_F', [_this select 0,_this select 1,300], [], 0, 'CAN_COLLIDE'];
		_parachuteObject enableSimulationGlobal true;
		MoveInParachuteObject action ['GetinDriver',_parachuteObject];
		openMap false;
		fnc_getParachutePos = nil;
	};
};
fnc_EjectTargetVeh = {
	_unit = _this select 0;
	moveOut _unit;
	unassignVehicle _unit;
	_unit action ['eject', (vehicle _unit)];
};
fnc_EjectCrewTargetVeh = {
	_unit = _this select 0;
	_veh = (vehicle _unit);
	_uids = [];
	{
		moveOut _x;
		unassignVehicle _x;
		_x action ['eject', _veh];
		_uids pushBack (getPlayerUID _x)
	} forEach (crew _veh);
};
fnc_RemoveGear = {
	_target = _this select 0;
	if(typeName _target != 'OBJECT')then
	{
		_target = cursorTarget;
	};
	if(!isNull _target)then
	{
		[11,player,_target] call fnc_AdminReq;
		
		_log = format['Removed Gear of %1!',name _target];
		_log call FN_SHOW_LOG;
	};
};
fnc_add_loadout = {
	_select = _this select 0;
	_wset = player;
	removeAllWeapons _wset;
	removeAllItems _wset;
	removebackpack _wset;
	removeAllAssignedItems _wset;
	switch (_select) do
	{
		NVG_ITEM_PEWPEW = 'NVGoggles';
		if(infiSTAR_MOD == 'Epoch')then{NVG_ITEM_PEWPEW = 'NVG_EPOCH';};
		case 0: {
			_wset = player;
			_wset addBackpack 'B_Carryall_oli';
			_wset forceAddUniform 'O_G_Soldier_M_F';
			_wset addItemToBackpack 'V_PlateCarrierIA1_dgtl';
			_wset addItemToBackpack 'Heal_EPOCH';
			_wset addItemToBackpack 'Defib_EPOCH';
			_wset addItemToBackpack 'Repair_EPOCH';
			_wset addItemToBackpack 'EnergyPackLg';
			_wset addItemToBackpack 'MultiGun';
			_wset addItemToBackpack 'ItemWatch';
			_wset addItemToBackpack 'ItemCompass';
			_wset addItemToBackpack 'ItemGPS';
			_wset addItemToBackpack 'ItemMap';
			_wset addItemToBackpack 'Rangefinder';
			_wset addItemToBackpack NVG_ITEM_PEWPEW;
			_wset addItemToBackpack 'Hatchet';
			_wset addItemToBackpack 'hatchet_swing';
			_wset addItemToBackpack 'MeleeSledge';
			_wset addItemToBackpack 'sledge_swing';
			_wset addItemToBackpack 'srifle_EBR_F';
			_wset addItemToBackpack '20Rnd_762x51_Mag';
			_wset addItemToBackpack 'optic_DMS';
			_wset addItemToBackpack 'optic_SOS';
			_wset addItemToBackpack 'optic_MRCO';
			_wset addItemToBackpack 'muzzle_snds_B';
		};
		case 1: {
			_wset = player;
			_wset addBackpack 'B_Carryall_oli';
			_wset forceAddUniform 'U_B_GhillieSuit';
			_wset addItemToBackpack 'V_PlateCarrierIA1_dgtl';
			_wset addItemToBackpack 'Heal_EPOCH';
			_wset addItemToBackpack 'Defib_EPOCH';
			_wset addItemToBackpack 'Repair_EPOCH';
			_wset addItemToBackpack 'EnergyPackLg';
			_wset addItemToBackpack 'MultiGun';
			_wset addItemToBackpack 'ItemWatch';
			_wset addItemToBackpack 'ItemCompass';
			_wset addItemToBackpack 'ItemGPS';
			_wset addItemToBackpack 'ItemMap';
			_wset addItemToBackpack 'Rangefinder';
			_wset addItemToBackpack NVG_ITEM_PEWPEW;
			_wset addItemToBackpack 'Hatchet';
			_wset addItemToBackpack 'hatchet_swing';
			_wset addItemToBackpack 'MeleeSledge';
			_wset addItemToBackpack 'sledge_swing';
			_wset addItemToBackpack 'srifle_EBR_F';
			_wset addItemToBackpack '20Rnd_762x51_Mag';
			_wset addItemToBackpack 'optic_DMS';
			_wset addItemToBackpack 'optic_SOS';
			_wset addItemToBackpack 'optic_MRCO';
			_wset addItemToBackpack 'muzzle_snds_B';
			_wset addVest 'V_BandollierB_cbr';
			_wset addWeapon NVG_ITEM_PEWPEW;
			_wset addWeapon 'Rangefinder';
			_wset addPrimaryWeaponItem 'optic_Aco';
			_wset addPrimaryWeaponItem 'muzzle_snds_M';
			if(infiSTAR_MOD != 'Epoch')then{(unitBackpack _wset) additemCargo ['FirstAidKit',2];} else {(unitBackpack _wset) additemCargo ['FAK',2];};
			(unitBackpack _wset) additemCargo ['30Rnd_556x45_Stanag', 9];
			(unitBackpack _wset) additemCargo ['30Rnd_9x21_Mag', 9];
			(unitBackpack _wset) additemCargo ['handGrenade', 2];
			_wset addWeapon 'srifle_LRR_F';
			[] call infiSTAR_A3addAmmo;
			[] call infiSTAR_A3addAmmo;
			[] call infiSTAR_A3addAmmo;
		};
		case 2: {
			_wset = player;
			_wset addHeadgear 'H_Beret_02';
			_wset addGoggles 'G_Sport_Blackred';
			_wset addUniform 'U_OrestesBody';
			_wset addVest 'V_BandollierB_cbr';
			_wset addBackpack 'B_Carryall_oli';
			_wset addWeapon NVG_ITEM_PEWPEW;
			_wset addWeapon 'Rangefinder';
			_wset addMagazine '30Rnd_9x21_Mag';
			_wset addweapon 'hgun_PDW2000_Holo_snds_F';
			_wset addMagazine '6Rnd_45ACP_Cylinder';
			_wset addweapon 'hgun_Pistol_heavy_02_Yorris_F';
			_wset addPrimaryWeaponItem 'muzzle_snds_B';
			_wset addPrimaryWeaponItem 'acc_pointer_IR';
			_wset addWeaponGlobal 'ItemCompass';
			_wset addWeaponGlobal 'ItemMap';
			_wset addWeaponGlobal 'Itemgps';
			_wset addWeaponGlobal 'ItemWatch';
			if(infiSTAR_MOD != 'Epoch')then{_wset addWeaponGlobal 'itemradio';} else {_wset addWeaponGlobal 'epochradio0';};
			if(infiSTAR_MOD != 'Epoch')then{(unitBackpack _wset) additemCargo ['FirstAidKit',2];} else {(unitBackpack _wset) additemCargo ['FAK',2];};
			(unitBackpack _wset) additemCargo ['30Rnd_9x21_Mag', 9];
			(unitBackpack _wset) additemCargo ['6Rnd_45ACP_Cylinder', 9];
		};
		case 3: {
			_wset = player;
			_wset addHeadgear 'H_Beret_02';
			_wset addGoggles 'G_Sport_Blackred';
			_wset addUniform 'U_IG_Guerilla3_1';
			_wset addVest 'V_BandollierB_cbr';
			_wset addBackpack 'B_Carryall_oli';
			_wset addWeapon NVG_ITEM_PEWPEW;
			_wset addWeapon 'Rangefinder';
			_wset addMagazine '30Rnd_556x45_Stanag';
			_wset addweapon 'arifle_TRG21_ACO_grn_smg';
			_wset addMagazine '30Rnd_9x21_Mag';
			_wset addweapon 'hgun_P07_F';
			_wset addPrimaryWeaponItem 'optic_Aco';
			_wset addPrimaryWeaponItem 'muzzle_snds_M';
			_wset addHandgunItem 'muzzle_snds_L';
			_wset addWeaponGlobal 'ItemCompass';
			_wset addWeaponGlobal 'ItemMap';
			_wset addWeaponGlobal 'Itemgps';
			_wset addWeaponGlobal 'ItemWatch';
			if(infiSTAR_MOD != 'Epoch')then{_wset addWeaponGlobal 'itemradio';} else {_wset addWeaponGlobal 'epochradio0';};
			if(infiSTAR_MOD != 'Epoch')then{(unitBackpack _wset) additemCargo ['FirstAidKit',2];} else {(unitBackpack _wset) additemCargo ['FAK',2];};
			(unitBackpack _wset) additemCargo ['30Rnd_556x45_Stanag', 9];
			(unitBackpack _wset) additemCargo ['30Rnd_9x21_Mag', 9];
			(unitBackpack _wset) additemCargo ['handGrenade', 2];
		};
		case 4: {
			_wset = player;
			_wset addHeadgear 'H_Beret_02';
			_wset addGoggles 'G_Sport_Blackred';
			_wset addUniform 'U_OG_leader';
			_wset addVest 'V_BandollierB_cbr';
			_wset addBackpack 'B_Carryall_oli';
			_wset addWeapon NVG_ITEM_PEWPEW;
			_wset addWeapon 'Rangefinder';
			_wset addweapon 'LMG_Zafir_F';
			_wset addMagazine '150Rnd_762x54_Box_Tracer';
			_wset addMagazine '30Rnd_9x21_Mag';
			_wset addweapon 'hgun_P07_F';
			_wset addPrimaryWeaponItem 'optic_LRPS';
			_wset addPrimaryWeaponItem 'acc_pointer_IR';
			_wset addHandgunItem 'muzzle_snds_L';
			_wset addWeaponGlobal 'ItemCompass';
			_wset addWeaponGlobal 'ItemMap';
			_wset addWeaponGlobal 'Itemgps';
			_wset addWeaponGlobal 'ItemWatch';
			if(infiSTAR_MOD != 'Epoch')then{_wset addWeaponGlobal 'itemradio';} else {_wset addWeaponGlobal 'epochradio0';};
			if(infiSTAR_MOD != 'Epoch')then{(unitBackpack _wset) additemCargo ['FirstAidKit',2];} else {(unitBackpack _wset) additemCargo ['FAK',2];};
			(unitBackpack _wset) additemCargo ['150Rnd_762x54_Box_Tracer', 9];
			(unitBackpack _wset) additemCargo ['30Rnd_9x21_Mag', 9];
			(unitBackpack _wset) additemCargo ['handGrenade', 2];
		};
		case 5: {
			_wset = player;
			_wset addHeadgear 'H_Beret_02';
			_wset addGoggles 'G_Sport_Blackred';
			_wset addUniform 'U_O_GhillieSuit';
			_wset addVest 'V_BandollierB_cbr';
			_wset addBackpack 'B_Carryall_oli';
			_wset addWeapon NVG_ITEM_PEWPEW;
			_wset addWeapon 'Rangefinder';
			_wset addMagazine '10Rnd_762x54_Mag';
			_wset addweapon 'srifle_DMR_01_F';
			_wset addMagazine '30Rnd_9x21_Mag';
			_wset addweapon 'hgun_P07_F';
			_wset addPrimaryWeaponItem 'acc_pointer_IR';
			_wset addPrimaryWeaponItem 'optic_MRCO';
			_wset addHandgunItem 'muzzle_snds_L';
			_wset addWeaponGlobal 'ItemCompass';
			_wset addWeaponGlobal 'ItemMap';
			_wset addWeaponGlobal 'Itemgps';
			_wset addWeaponGlobal 'ItemWatch';
			if(infiSTAR_MOD != 'Epoch')then{_wset addWeaponGlobal 'itemradio';} else {_wset addWeaponGlobal 'epochradio0';};
			if(infiSTAR_MOD != 'Epoch')then{(unitBackpack _wset) additemCargo ['FirstAidKit',2];} else {(unitBackpack _wset) additemCargo ['FAK',2];};
			(unitBackpack _wset) additemCargo ['10Rnd_762x54_Mag', 9];
			(unitBackpack _wset) additemCargo ['30Rnd_9x21_Mag', 9];
			(unitBackpack _wset) additemCargo ['handGrenade', 2];
		};
		case 6: {
			_wset = player;
			_wset addGoggles 'G_Sport_Blackred';
			_wset addUniform 'U_O_CombatUniform_oucamo';
			_wset addVest 'V_BandollierB_cbr';
			_wset addBackpack 'B_Carryall_oli';
			_wset addWeapon NVG_ITEM_PEWPEW;
			_wset addWeapon 'Rangefinder';
			_wset addMagazine '7Rnd_408_Mag';
			_wset addweapon 'srifle_LRR_F';
			_wset addMagazine '30Rnd_9x21_Mag';
			_wset addweapon 'hgun_P07_F';
			_wset addPrimaryWeaponItem 'acc_pointer_IR';
			_wset addPrimaryWeaponItem 'optic_MRCO';
			_wset addHandgunItem 'muzzle_snds_L';
			_wset addWeaponGlobal 'ItemCompass';
			_wset addWeaponGlobal 'ItemMap';
			_wset addWeaponGlobal 'Itemgps';
			_wset addWeaponGlobal 'ItemWatch';
			if(infiSTAR_MOD != 'Epoch')then{_wset addWeaponGlobal 'itemradio';} else {_wset addWeaponGlobal 'epochradio0';};
			if(infiSTAR_MOD != 'Epoch')then{(unitBackpack _wset) additemCargo ['FirstAidKit',2];} else {(unitBackpack _wset) additemCargo ['FAK',2];};
			(unitBackpack _wset) additemCargo ['7Rnd_408_Mag', 9];
			(unitBackpack _wset) additemCargo ['30Rnd_9x21_Mag', 9];
			(unitBackpack _wset) additemCargo ['handGrenade', 2];
		};
		case 7: {
			_wset = player;
			_wset addHeadgear 'H_Beret_02';
			_wset addGoggles 'G_Sport_Blackred';
			_wset addUniform 'U_O_GhillieSuit';
			_wset addVest 'V_BandollierB_cbr';
			_wset addBackpack 'B_Carryall_oli';
			_wset addWeapon NVG_ITEM_PEWPEW;
			_wset addWeapon 'Rangefinder';
			_wset addMagazine '5Rnd_127x108_Mag';
			_wset addweapon 'srifle_GM6_F';
			_wset addMagazine '30Rnd_9x21_Mag';
			_wset addweapon 'hgun_P07_F';
			_wset addPrimaryWeaponItem 'optic_LRPS';
			_wset addPrimaryWeaponItem 'acc_pointer_IR';
			_wset addHandgunItem 'muzzle_snds_L';
			_wset addWeaponGlobal 'ItemCompass';
			_wset addWeaponGlobal 'ItemMap';
			_wset addWeaponGlobal 'Itemgps';
			_wset addWeaponGlobal 'ItemWatch';
			if(infiSTAR_MOD != 'Epoch')then{_wset addWeaponGlobal 'itemradio';} else {_wset addWeaponGlobal 'epochradio0';};
			if(infiSTAR_MOD != 'Epoch')then{(unitBackpack _wset) additemCargo ['FirstAidKit',2];} else {(unitBackpack _wset) additemCargo ['FAK',2];};
			(unitBackpack _wset) additemCargo ['5Rnd_127x108_Mag', 9];
			(unitBackpack _wset) additemCargo ['30Rnd_9x21_Mag', 9];
			(unitBackpack _wset) additemCargo ['handGrenade', 2];
		};
		case 8: {
			_wset = player;
			_wset addHeadgear 'H_Beret_02';
			_wset addGoggles 'G_Sport_Blackred';
			_wset addUniform 'U_O_GhillieSuit';
			_wset addVest 'V_BandollierB_cbr';
			_wset addBackpack 'B_Carryall_oli';
			_wset addWeapon NVG_ITEM_PEWPEW;
			_wset addWeapon 'Rangefinder';
			_wset addMagazine '5Rnd_127x108_Mag';
			_wset addweapon 'm107Tan_EPOCH';
			_wset addMagazine '30Rnd_9x21_Mag';
			_wset addweapon 'hgun_P07_F';
			_wset addPrimaryWeaponItem 'optic_LRPS';
			_wset addPrimaryWeaponItem 'acc_pointer_IR';
			_wset addHandgunItem 'muzzle_snds_L';
			_wset addWeaponGlobal 'ItemCompass';
			_wset addWeaponGlobal 'ItemMap';
			_wset addWeaponGlobal 'Itemgps';
			_wset addWeaponGlobal 'ItemWatch';
			if(infiSTAR_MOD != 'Epoch')then{_wset addWeaponGlobal 'itemradio';} else {_wset addWeaponGlobal 'epochradio0';};
			if(infiSTAR_MOD != 'Epoch')then{(unitBackpack _wset) additemCargo ['FirstAidKit',2];} else {(unitBackpack _wset) additemCargo ['FAK',2];};
			(unitBackpack _wset) additemCargo ['5Rnd_127x108_Mag', 9];
			(unitBackpack _wset) additemCargo ['30Rnd_9x21_Mag', 9];
			(unitBackpack _wset) additemCargo ['handGrenade', 2];
		};
		default { _log = 'no loadout selected';_log call FN_SHOW_LOG; };
	};
};
fnc_spawn_timemachine = {
	_offset = _this select 0;
	[6,player,_offset] call fnc_AdminReq;
	_log = format['DayTime changed to hour %1',_offset];
	_log call FN_SHOW_LOG;
};
fnc_mass_message = {
	disableSerialization;
	_display = findDisplay 24;
	if(isNull _display)exitWith
	{
		_log = 'open your chat, type a message and start this function again!';
		_log call FN_SHOW_LOG;
	};
	_chat = _display displayCtrl 101;
	_msg = ctrlText _chat;
	(_display) closeDisplay 0;
	[7,player,toArray _msg] call fnc_AdminReq;
	_log = format['Mass Message: %1',_msg];
	_log call fnc_adminLog;
	_log call FN_SHOW_LOG;
};
fnc_freezeTarget = {
	_target = _this select 0;
	_value = _this select 1;
	if(typeName _target != 'OBJECT')exitWith
	{
		_log = 'Target is not an Object!';
		_log call FN_SHOW_LOG;
	};
	if!(isPlayer _target)exitWith
	{
		_log = 'Target is not a Player!';
		_log call FN_SHOW_LOG;
	};
	[13,player,_target,_value] call fnc_AdminReq;
	_log = format['UnFroze %1!',name _target];
	if(_value)then{_log = format['Froze %1!',name _target];};
	_log call FN_SHOW_LOG;
};
fnc_restrainTarget = {
	_target = _this select 0;
	_value = _this select 1;
	if(typeName _target != 'OBJECT')exitWith
	{
		_log = 'Target is not an Object!';
		_log call FN_SHOW_LOG;
	};
	if!(isPlayer _target)exitWith
	{
		_log = 'Target is not a Player!';
		_log call FN_SHOW_LOG;
	};
	[15,player,_target,_value] call fnc_AdminReq;
	_log = format['Unrestrained %1!',name _target];
	if(_value)then{_log = format['Restrained %1!',name _target];};
	_log call FN_SHOW_LOG;
};
"; if(_MOD == 'Epoch')then{ infiSTAR_MAIN_CODE = infiSTAR_MAIN_CODE + "
fnc_spawn_CryptoINSERTVALUE = {
	disableSerialization;
	ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 654002);
	findDisplay MAIN_DISPLAY_ID ctrlCreate['RSCText', 654002];
	(findDisplay MAIN_DISPLAY_ID displayCtrl 654002) ctrlSetPosition [
		0.554062 * safezoneW + safezoneX,
		0.4,
		0.255781 * safezoneW,
		0.033 * safezoneH
	];
	
	ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 654001);
	findDisplay MAIN_DISPLAY_ID ctrlCreate['RscXSliderH', 654001];
	_slider1 = (findDisplay MAIN_DISPLAY_ID displayCtrl 654001);
	_slider1 ctrlSetPosition [
		0.554062 * safezoneW + safezoneX,
		0.45
	];
	_slider1 ctrlSetBackgroundColor [0.15,0.15,0.15,1];
	_slider1 ctrlCommit 0;
	
	ctrlDelete ((findDisplay MAIN_DISPLAY_ID) displayCtrl 654003);
	findDisplay MAIN_DISPLAY_ID ctrlCreate['RSCButton', 654003];
	(findDisplay MAIN_DISPLAY_ID displayCtrl 654003) ctrlSetText 'OK';
	(findDisplay MAIN_DISPLAY_ID displayCtrl 654003) ctrlSetPosition [
		0.725 * safezoneW + safezoneX,
		0.45,
		0.0360937 * safezoneW,
		0.033 * safezoneH
	];
	(findDisplay MAIN_DISPLAY_ID displayCtrl 654003) ctrlCommit 0;
	(findDisplay MAIN_DISPLAY_ID displayCtrl 654003) ctrlSetEventHandler['ButtonClick','
		if(isNil''SELECTED_TARGET_PLAYER'')exitWith{};
		if(isNull SELECTED_TARGET_PLAYER)exitWith{};
		if!(isPlayer SELECTED_TARGET_PLAYER)exitWith{};
		if!(alive SELECTED_TARGET_PLAYER)exitWith{};
		if(CRYPTO_CHANGE_VALUE == 0)exitWith{};
		
		disableSerialization;
		_slider1 = (findDisplay MAIN_DISPLAY_ID displayCtrl 654001);
		_value = CRYPTO_CHANGE_VALUE;
		_value = (_value min 250000) max -250000;
		_value = round _value;
		
		[12,player,SELECTED_TARGET_PLAYER,_value] call fnc_AdminReq;
		_log = format[''Added %1 Crypto to %2!'',_value,name SELECTED_TARGET_PLAYER];
		if(_value < 0)then
		{
			_log = format[''Removed %1 Crypto from %2!'',_value,name SELECTED_TARGET_PLAYER];
		};
		_log call FN_SHOW_LOG;
	'];
	
	if(!isNil'fnc_spawn_CryptoINSERTVALUETHREAD')then{terminate fnc_spawn_CryptoINSERTVALUETHREAD;};
	fnc_spawn_CryptoINSERTVALUETHREAD = [] spawn {
		disableSerialization;
		_slider1 = (findDisplay MAIN_DISPLAY_ID displayCtrl 654001);
		_slider1 sliderSetPosition 5;
		while {!isNull findDisplay MAIN_DISPLAY_ID} do
		{
			_sliderPos = sliderPosition _slider1;
			_value = 0;
			if(_sliderPos < 5)then
			{
				_calc = 5-_sliderPos;
				_value = -250000 * (_calc/5)
			}
			else
			{
				_calc = 10-_sliderPos;
				_value = 250000 * (_calc/5);
				_value = 250000 - _value;
			};
			_value = round _value;
			CRYPTO_CHANGE_VALUE = _value;
			if(_value < 0)then
			{
				(findDisplay MAIN_DISPLAY_ID displayCtrl 654002) ctrlSetText format['remove %1 crypto from %2',_value,name SELECTED_TARGET_PLAYER];
			}
			else
			{
				(findDisplay MAIN_DISPLAY_ID displayCtrl 654002) ctrlSetText format['add %1 crypto to %2',_value,name SELECTED_TARGET_PLAYER];
			};
			(findDisplay MAIN_DISPLAY_ID displayCtrl 654002) ctrlCommit 0;
			
			uiSleep 0.1;
		};
	};
};
"; }; infiSTAR_MAIN_CODE = infiSTAR_MAIN_CODE + "
fnc_spawn_Box = {
	_select = _this select 0;
	_target = call fnc_LBSelChanged_LEFT;
	[5000,player,_select,_target] call fnc_AdminReq;
	_log = format['Spawning Box %1 on the ground infront of %2!',_select,name _target];
	_log call FN_SHOW_LOG;
};
fnc_Altislife_money = {
	_state = _this select 0;
	_amount = _this select 1;
	if(typeName _state != 'STRING')exitWith{};
	if(typeName _amount != 'SCALAR')exitWith{};
	if(_amount == 0)exitWith{};
	if(_state == 'cash')then
	{
		life_cash = life_cash + _amount;
		_log = format['Cash %1K - %2K has been added.',life_cash/1000,_amount/1000];
		_log call FN_SHOW_LOG;
	};
	if(_state == 'bank')then
	{
		life_atmcash = life_atmcash + _amount;
		_log = format['Bank %1K - %2K has been added.',life_atmcash/1000,_amount/1000];
		_log call FN_SHOW_LOG;
	};
};
admin_showinfo = {
	_obj = cursortarget;
	if(!isNull _obj)then
	{
		_pos = getPosATL _obj;
		_type = typeOf _obj;
		
		_slot = call {
			if!(_obj getVariable['VEHICLE_SLOT',-1] isEqualTo -1)exitWith{_obj getVariable['VEHICLE_SLOT',-1]};
			if!(_obj getVariable['STORAGE_SLOT',-1] isEqualTo -1)exitWith{_obj getVariable['STORAGE_SLOT',-1]};
			if!(_obj getVariable['BUILD_SLOT',-1] isEqualTo -1)exitWith{_obj getVariable['BUILD_SLOT',-1]};
			'none'
		};
		
		{
			_x call FN_SHOW_LOG;
			diag_log _x;
		} forEach
		[
			format['%1, slot: %2',_type,_slot],
			format['WorldSpace: [%1,%2], @%3',getDir _obj,_pos,mapGridPosition _pos],
			if(isPlayer _obj)then{format['%1(%2) - damage %3',name _obj,getPlayerUID _obj,damage _obj]}else{format['Damage %1',damage _obj]},
			'--'
		];
		
		
		if(_type == 'PlotPole_EPOCH')then
		{
			if(alive _obj)then
			{
				_owner = _obj getVariable['BUILD_OWNER', '-1'];
				_log2 = format['Owner UID %1',_owner];
				{
					if(getPlayerUID _x == _owner)then
					{
						_log2 = format['Owner %1(%2) - %3m far away',name _x,_owner,floor(_obj distance _x)];
					};
				} forEach allPlayers;
				_log2 call FN_SHOW_LOG;
				diag_log _log2;
			};
		};
	};
};
fnc_infiSTAR_A3cargod = {
	if(isNil 'A3carGodRun')then
	{
		MY_VEHICLES = [];
		A3carGodRun = [] spawn {
			while {true} do
			{
				_obj = cameraOn;
				if(local _obj)then
				{
					if(_obj isKindOf 'Man')then
					{
						if!(MY_VEHICLES isEqualTo [])then
						{
							{_x removeAllEventhandlers 'HandleDamage';_x allowDamage true;} forEach MY_VEHICLES;
							MY_VEHICLES = [];
						};
					}
					else
					{
						MY_VEHICLES pushBackUnique _obj;
						_obj allowDamage false;
						_obj removeAllEventhandlers 'HandleDamage';
						_obj addEventHandler['HandleDamage',{false}];
					};
				};
				uiSleep 1;
			};
		};
		
		_log = 'Vehicle God Mode - Enabled';
		_log call FN_SHOW_LOG;
	}
	else
	{
		terminate A3carGodRun;A3carGodRun=nil;
		{_x removeAllEventhandlers 'HandleDamage';_x allowDamage true;} forEach MY_VEHICLES;
		
		_log = 'Vehicle God Mode - Disabled';
		_log call FN_SHOW_LOG;
	};
};
fnc_LowerTerrain = { if(getTerrainGrid > 25)then{setTerrainGrid 12.5;'Terrain Normal' call FN_SHOW_LOG;}else{setTerrainGrid 50;'Terrain Low' call FN_SHOW_LOG;}; };
fnc_infiSTAR_A3UnlAmmo = {
	if(isNil 'unlimAmmRun')then
	{
		_log = 'Unlimited Ammo ON';
		_log call FN_SHOW_LOG;
		
		unlimAmmRun = [] spawn {
			while {true} do 
			{
				if(local vehicle player)then{
					vehicle player setAmmo [currentWeapon vehicle player, 1000000];
				};
				player setAmmo [primaryWeapon player, 1000000];
				(vehicle player) setVehicleAmmo 1;
				player setFatigue 0;
				uiSleep 0.3;
			};
		};
	}
	else
	{
		_log = 'Unlimited Ammo OFF';
		_log call FN_SHOW_LOG;
		
		terminate unlimAmmRun;
		unlimAmmRun = nil;
	};
};
fnc_infiSTAR_A3noRecoil = {
	if(isNil 'noRecoilRun')then
	{
		_log = 'No Recoil ON';
		_log call FN_SHOW_LOG;
		
		noRecoilRun = [] spawn {
			while {true} do 
			{
				(vehicle player) setUnitRecoilCoefficient 0;
				player setUnitRecoilCoefficient 0;
				player setCustomAimCoef 0;
				player setFatigue 0;
				uiSleep 2;
			};
		};
	}
	else
	{
		_log = 'No Recoil OFF';
		_log call FN_SHOW_LOG;
		
		terminate noRecoilRun;
		noRecoilRun = nil;
		
		(vehicle player) setUnitRecoilCoefficient 1;
		player setUnitRecoilCoefficient 1;
	};
};
fnc_infiSTAR_A3FF = {
	if(isNil 'A3FFrun')then
	{
		_log = 'FastFire ON';
		_log call FN_SHOW_LOG;
		
		A3FFrun = [] spawn {
			while {true} do 
			{
				_muzzle = currentMuzzle player;
				if(_muzzle isEqualType '')then{ (vehicle player) setWeaponReloadingTime [player, _muzzle, 0]; };
				uiSleep 0.1;
			};
		};
	}
	else
	{
		_log = 'FastFire OFF';
		_log call FN_SHOW_LOG;
		
		terminate A3FFrun;
		A3FFrun = nil;
	};
};
fnc_infiSTARHIDE = {
	if(!isNil'A3HIDErun')then{terminate A3HIDErun;};
	if(isObjectHidden player)then
	{
		[2,player,netId player,false] call fnc_AdminReq;
		
		_log = 'Stealth / Invisible OFF';
		_log call FN_SHOW_LOG;
	}
	else
	{
		A3HIDErun = [] spawn {
			while {true} do
			{
				if(!isObjectHidden player)then
				{
					[2,player,netId player,true] call fnc_AdminReq;
				};
				uiSleep 1;
			};
		};
		
		_log = 'Stealth / Invisible ON';
		_log call FN_SHOW_LOG;
	};
};
fnc_DisableAnnouncements = {
	if(isNil 'A3DANNrun')then{A3DANNrun = 0;};
	if(A3DANNrun==0)then
	{
		A3DANNrun=1;
		AdminAnnounceDisabled = true;
		
		_log = 'Disable Announces - ON';
		_log call FN_SHOW_LOG;
	}
	else
	{
		A3DANNrun=0;
		AdminAnnounceDisabled = nil;
		
		_log = 'Disable Announces - OFF';
		_log call FN_SHOW_LOG;
	};
};
fnc_FreeRoamCam = {
	if(isNil 'freeFlightCam')then
	{
		camDestroy freeFlightCam;
		freeFlightCam = nil;
		_getPos = player modelToWorld[0,3, 1.75];
		freeFlightCam = 'camera' camCreate _getPos;
		freeFlightCam setDir([_getPos, player] call BIS_fnc_dirTo);
		freeFlightCam camCommand 'MANUAL ON';
		freeFlightCam camCommand 'INERTIA OFF';
		freeFlightCam cameraEffect['INTERNAL', 'BACK'];
		showCinemaBorder false;
		_log = 'Right Click To Cancel!';
		_log call FN_SHOW_LOG;
	}
	else
	{
		camDestroy freeFlightCam;
		freeFlightCam = nil;
	};
};
fnc_BIS_FreeRoamCam = {
	[] spawn (uinamespace getvariable 'bis_fnc_camera');
};
fnc_deleteVeh_selected = {
	{player reveal _x;} foreach (player nearObjects 50);
	_target = _this select 0;
	if(typeName _target != 'OBJECT')then{_target = cursorTarget;};
	if(isNull _target)then{_target = cursorObject;};
	if(!isNull _target)then
	{
		_delete = (vehicle _target);
		
		if(isNil 'DELETE_TARGET')then{DELETE_TARGET = objNull;};
		if(str DELETE_TARGET != str _delete)exitWith
		{
			_type = typeOf _delete;
			_displayName = gettext (configFile >> 'CfgVehicles' >> _type >> 'displayName');
			_distance = round(cameraOn distance _delete);
			
			_log = format['DELETE:   %1 (%2)   distance %3m?  (press continue and delete again)',_displayName,_type,_distance];
			_log call FN_SHOW_LOG;
			DELETE_TARGET = _delete;
		};
		
		if(isNil 'ToDeleteArray')then{ToDeleteArray = [];};
		if(_delete in ToDeleteArray)then
		{
			_log = format['%1 - IN DELETE QUEUE',_delete];
			_log call FN_SHOW_LOG;
		}
		else
		{
			_netId = netId _delete;
			if(_netId isEqualTo '0:0')then
			{
				deleteVehicle _delete;
			}
			else
			{
				ToDeleteArray pushBack _delete;
				[-4,player,_delete] call fnc_AdminReq;
			};
			
			_log = format['Deleting %1 @%2..',typeOf _delete,mapGridPosition _delete];
			if(getPlayerUID _target != '')then
			{
				_log = format['Deleting %1(%2) vehicle: %3 @%4..',name _target,getPlayerUID _target,typeOf _delete,mapGridPosition _delete];
			};
			_log call FN_SHOW_LOG;
			_log call fnc_adminLog;
		};
	}
	else
	{
		DELETE_TARGET = objNull;
	};
};
CCG_fnc_adminClick = {
	private ['_click'];
	_click = _this select 0;
	if(_click == '')exitWith{};
	try {
		switch (_click) do {
			case 'BD: Set Center' : {
				call CCG_fnc_bdSetCenter;
				throw 'BASEDELETER: Set Center';
			};
			case 'BD: Set Radius' : {
				call CCG_fnc_bdSetRadius;
				throw 'BASEDELETER: Set Radius';
			};
			case 'BD: Cancel' : {
				call CCG_fnc_bdCancel;
				throw 'BASEDELETER: Cancel';
			};
			case 'BD: Delete' : {
				call CCG_fnc_bdDelete;
				throw 'BASEDELETER: Delete';
			};
		};
	} catch {
		_exception call FN_SHOW_LOG;
		call fnc_FULLinit;
	};
};
CCG_fnc_bdSetCenter = {
	private ['_arrow'];
	CCGbdCenter = getPosASL player;
	_arrow = 'Sign_Arrow_F' createVehicleLocal [0,0,0];
	_arrow setPosASL CCGbdCenter;
	if(isNil 'CCGbdObjs')then{CCGbdObjs = [];};
	CCGbdObjs pushBack _arrow;
};
CCG_fnc_bdSetRadius = {
	private ['_arrow', '_pos', '_radius', '_angle', '_distance', '_count', '_step', '_count', '_step', '_objects'];
	if(isNil 'CCGbdCenter')then{throw 'BASEDELETER: Center not set!';};
	CCGbdRadius = [CCGbdCenter, getPosASL player] call BIS_fnc_distance2D;
	_arrow = 'Sign_Arrow_F' createVehicleLocal [0,0,0];
	_arrow setPosASL CCGbdCenter;
	CCGbdObjs pushBack _arrow;
	_angle = 0;
	_count = round((2 * pi * CCGbdRadius) / 2);
	if(_count == 0)then{throw 'BASEDELETER: Center and Radius position can not be the same!';};
	for '_x' from 0 to _count do
	{
		private['_a', '_b', '_obj'];
		_a = (CCGbdCenter select 0) + (sin(_angle)*CCGbdRadius);
		_b = (CCGbdCenter select 1) + (cos(_angle)*CCGbdRadius);
		_obj = 'Sign_Sphere100cm_F' createVehicleLocal [0,0,0];
		_obj setPosASL [_a, _b, CCGbdCenter select 2];
		CCGbdObjs pushBack  _obj;
		_angle = _angle + (360/_count);
	};
	for '_x' from 0 to _count do
	{
		private['_a', '_b', '_obj'];
		_a = (CCGbdCenter select 0) + (sin(_angle)*CCGbdRadius);
		_b = (CCGbdCenter select 2) + (cos(_angle)*CCGbdRadius);
		_obj = 'Sign_Sphere100cm_F' createVehicleLocal [0,0,0];
		_obj setPosASL [_a, CCGbdCenter select 1, _b];
		CCGbdObjs pushBack  _obj;
		_angle = _angle + (360/_count);
	};
	for '_x' from 0 to _count do
	{
		private['_a', '_b', '_obj'];
		_a = (CCGbdCenter select 1) + (sin(_angle)*CCGbdRadius);
		_b = (CCGbdCenter select 2) + (cos(_angle)*CCGbdRadius);
		_obj = 'Sign_Sphere100cm_F' createVehicleLocal [0,0,0];
		_obj setPosASL [CCGbdCenter select 0, _a, _b];
		CCGbdObjs pushBack  _obj;
		_angle = _angle + (360/_count);
	};
};
CCG_fnc_bdGetObjectsToDelete = {
	if(isNil 'CCGbdCenter')exitWith{[]};
	if(isNil 'CCGbdRadius')exitWith{[]};
	nearestObjects [ASLtoATL CCGbdCenter, ['ThingX', 'Constructions_static_F', 'Constructions_foundation_F', 'LockBox_EPOCH', 'PlotPole_EPOCH', 'Buildable_Storage', 'Safe_EPOCH'], CCGbdRadius]
};
CCG_fnc_bdDelete = {
	private ['_objects'];
	if(isNil 'CCGbdCenter')then{throw 'BASEDELETER: Center not set!';};
	if(isNil 'CCGbdRadius')then{throw 'BASEDELETER: Radius not set!';};
	_objects = call CCG_fnc_bdGetObjectsToDelete;
	_objects spawn {
		format['BASEDELETER: Deleting %1 objects. Please Wait...', count _this] call FN_SHOW_LOG;
		{
			format['BASEDELETER: Deleting %1 (%2/%3)', typeOf _x, _foreachindex + 1, count _this] call FN_SHOW_LOG;
			[-4,player,_x] call fnc_AdminReq;
			uiSleep 0.1;
		} foreach _this;
		format['BASEDELETER: Deleting complete.', count _this] call FN_SHOW_LOG;
	};
	call CCG_fnc_bdCancel;
};
CCG_fnc_bdCancel = {
	CCGbdCenter = nil;
	CCGbdRadius = nil;
	{if(!isNull _x)then{deleteVehicle _x;};} foreach CCGbdObjs;
	CCGbdObjs = [];
};
fnc_flipVeh = {
	_target = _this select 0;
	if(typeName _target != 'OBJECT')then
	{
		_target = cursorTarget;
	};
	if((!isNull _target) && {alive _target} && {_target isKindOf 'Landvehicle' || _target isKindOf 'Air' || _target isKindOf 'Ship'})then
	{
		if(local _target)then
		{
			_pos = getPos _target;
			_pos set[2,(_pos select 2)+2];
			_target setPos _pos;
			_target setVectorUp [0,0,1];
		}
		else
		{
			[-3,player,_target] call fnc_AdminReq;
		};
		
		_log = format['Flipping %1 @%2..',typeOf _veh,mapGridPosition _target];
		_log call FN_SHOW_LOG;
	}
	else
	{
		_log = 'invalid target';
		if((!alive _target) && {_target isKindOf 'Landvehicle' || _target isKindOf 'Air' || _target isKindOf 'Ship'})then{_log = 'vehicle destroyed..';};
		_log call FN_SHOW_LOG;
	};
};
zeus_attack = {
	_target = _this select 0;
	_pos = screenToWorld [0.5,0.5];
	_log = format['Zeus @%1',mapGridPosition _pos];
	if(typeName _target != 'OBJECT')then
	{
		_target = cursorTarget;
	};
	if(!isNull _target)then
	{
		_pos = getPos _target;
		
		_log = format['Zeus %1 @%2',typeOf _target,mapGridPosition _pos];
		if(getPlayerUID _target != '')then
		{
			_log = format['Zeus %1(%2) @%3',name _target,getPlayerUID _target,mapGridPosition _pos];
		};
	};
	_log call FN_SHOW_LOG;
	_log call fnc_adminLog;
	[-1,player,_pos] call fnc_AdminReq;
};
fnc_Kill_selected = {
	_target = _this select 0;
	if(typeName _target != 'OBJECT')then
	{
		_target = cursorTarget;
	};
	if(!isNull _target)then
	{
		if(alive _target)then
		{
			_log = format['Killing %1 @%2',typeOf _target,mapGridPosition _target];
			if(getPlayerUID _target != '')then
			{
				_log = format['Killing %1(%2) @%3',name _target,getPlayerUID _target,mapGridPosition _target];
			};
			_log call FN_SHOW_LOG;
			_log call fnc_adminLog;
			[-2,player,_target] call fnc_AdminReq;
		}
		else
		{
			_log = 'target is dead';
			_log call FN_SHOW_LOG;
		};
	}
	else
	{
		_log = 'target does not exist';
		_log call FN_SHOW_LOG;
	};
};
fnc_createMinefield = {
	_target = _this select 0;
	if(typeName _target != 'OBJECT')then
	{
		_target = cursorTarget;
	};
	_pos = screenToWorld [0.5,0.5];
	_log = format['MineField (around target) @%1',mapGridPosition _pos];
	if(!isNull _target)then
	{
		_log = format['MineField (around target) %1 @%2',typeOf _target,mapGridPosition _target];
		if(isPlayer _target)then
		{
			_log = format['MineField (around target) %1(%2) @%3',name _target,getPlayerUID _target,mapGridPosition _target];
		};
		_pos = ATLtoASL (_target modelToWorldVisual [0,0,0]);
	};
	_log call FN_SHOW_LOG;
	_log call fnc_adminLog;
	
	_mineFields =
	[
		[_pos,5]
	];
	{
		_center = _x select 0;
		_radius = _x select 1;
		for '_i' from 0 to 360 step (90 / _radius)*1 do
		{
			_location = [(_center select 0) + ((cos _i) * _radius), (_center select 1) + ((sin _i) * _radius),0];
			_dir = ((_center select 0) - (_location select 0)) atan2 ((_center select 1) - (_location select 1));
			_object = createVehicle ['APERSTripMine_Wire_Ammo', _location, [], 0, 'CAN_COLLIDE'];
			_object setDir _dir;
		};
	} forEach _mineFields;
};	
fnc_Explode_selected = {
	_target = _this select 0;
	if(typeName _target != 'OBJECT')then
	{
		_target = cursorTarget;
	};
	_pos = screenToWorld [0.5,0.5];
	_log = format['Exploding @%1',mapGridPosition _pos];
	if(!isNull _target)then
	{
		_log = format['Exploding %1 @%2',typeOf _target,mapGridPosition _target];
		if(isPlayer _target)then
		{
			_log = format['Exploding %1(%2) @%3',name _target,getPlayerUID _target,mapGridPosition _target];
		};
		
		_eyepos = ASLToATL eyepos _target;if(surfaceIsWater _eyepos)then{_eyepos = eyepos _target;};
		_pos = getPosVisual _target;
		_pos set[2,_eyepos select 2];
	};
	_log call FN_SHOW_LOG;
	_log call fnc_adminLog;
	_bomb = 'HelicopterExploSmall' createVehicleLocal _pos;
};
fnc_Disconnect_selected = {
	_target = _this select 0;
	if(!isNull _target)then
	{
		_TUID = getPlayerUID _target;
		if(_TUID != '')then
		{
			[-664,player,_TUID] call fnc_AdminReq;	
			_log = format['Disconnect %1(%2)',name _target,_TUID];
			_log call FN_SHOW_LOG;
		};
	}
	else
	{
		_log = 'target does not exist';
		_log call FN_SHOW_LOG;
	};
};
fnc_Kick_selected = {
	_target = _this select 0;
	_opt = _this select 1;
	if(!isNull _target)then
	{
		_TUID = getPlayerUID _target;
		if(_TUID != '')then
		{
			_TNAME = name _target;
			[-665,player,_TUID,_TNAME] call fnc_AdminReq;
			if(_opt == 1)then
			{
				_msg = format['%1(%2) has been KICKED by an Admin!',_TNAME,_TUID];
				[7,player,toArray _msg] call fnc_AdminReq;
			};
			
			_log = format['Kicking %1(%2)',_TNAME,_TUID];
			_log call FN_SHOW_LOG;
		};
	}
	else
	{
		_log = 'target does not exist';
		_log call FN_SHOW_LOG;
	};
};
fnc_Ban_selected = {
	_target = _this select 0;
	_opt = _this select 1;
	if(!isNull _target)then
	{
		_TUID = getPlayerUID _target;
		if(_TUID != '')then
		{
			_TNAME = name _target;
			[-666,player,_TUID,_TNAME] call fnc_AdminReq;
			if(_opt == 1)then
			{
				_msg = format['%1(%2) has been BANNED by an Admin!',_TNAME,_TUID];
				[7,player,toArray _msg] call fnc_AdminReq;
			};
			
			_log = format['Ban %1(%2)',_TNAME,_TUID];
			_log call FN_SHOW_LOG;
		};
	}
	else
	{
		_log = 'target does not exist';
		_log call FN_SHOW_LOG;
	};
};
fnc_ATTACH_TO = {
	if(isNil'LastAttachedObject')then{LastAttachedObject=objNull;};
	if(!isNull LastAttachedObject)exitWith{detach LastAttachedObject;LastAttachedObject = nil;};
	
	_target = _this select 0;
	if(typeName _target != 'OBJECT')then
	{
		_target = cursorTarget;
	};	
	if(!isNull _target)then
	{
		_bbr = boundingBoxReal _target;
		_p1 = _bbr select 0;
		_p2 = _bbr select 1;
		_offset = 5;
		_maxWidth = abs ((_p2 select 0) - (_p1 select 0));
		_maxLength = abs ((_p2 select 1) - (_p1 select 1));
		if(_maxWidth > _offset)then{_offset = _maxWidth;};
		if(_maxLength > _offset)then{_offset = _maxLength;};
		
		_bbr = boundingBoxReal vehicle player;
		_p1 = _bbr select 0;
		_p2 = _bbr select 1;
		_maxHeight = abs ((_p2 select 2) - (_p1 select 2));
		
		[5,player,_target,_offset,_maxHeight] call fnc_AdminReq;
		LastAttachedObject = _target;
		
		_log = format['Attaching   %1   to player',typeOf _target];
		_log call FN_SHOW_LOG;
	}
	else
	{
		_log = 'target does not exist';
		_log call FN_SHOW_LOG;
	};
};
fnc_spawn_EVENT = {
	_target = _this select 0;
	_EVENT = _this select 1;
	
	if(infiSTAR_MOD != 'Epoch')exitWith{
		_log = 'Epoch Only!';
		_log call FN_SHOW_LOG;
	};
	
	if(!isNull _target)then
	{
		[4,player,_target,_EVENT] call fnc_AdminReq;
		
		_log = format['%1..',_EVENT];
		_log call FN_SHOW_LOG;
	}
	else
	{
		_log = 'target does not exist';
		_log call FN_SHOW_LOG;
	};
};
fnc_ReviveTarget = {
	_target = _this select 0;
	if(isNil'_target')then
	{
		_target = cursorTarget;
	};
	if(isNull _target)exitWith
	{
		_log = 'Can not revive: target does not exist!';
		_log call FN_SHOW_LOG;
	};
	if!(isPlayer _target)exitWith
	{
		_log = 'Can not revive: target not a player!';
		_log call FN_SHOW_LOG;
	};
	if((getPlayerUID _target) isEqualTo '')exitWith
	{
		_log = 'Can not revive: player left target body already..!';
		_log call FN_SHOW_LOG;
	};
	_log = format['Revived %1(%2) @%3',name _target,getPlayerUID _target,mapGridPosition _target];
	_log call FN_SHOW_LOG;


	closeDialog 0;
	if(infiSTAR_MOD == 'AltisLife')then
	{
		_target setVariable ['Revive',false,true];
		[profileName] remoteExec ['life_fnc_revived',_target];
	}
	else
	{
		[8,player,_target] call fnc_AdminReq;
	};
};
fnc_HealTarget = {
	_target = _this select 0;
	if(typeName _target != 'OBJECT')then
	{
		_target = cursorTarget;
	};
	if(!isNull _target)then
	{
		_log = format['Healed %1 @%2',typeOf _target,mapGridPosition _target];
		if(getPlayerUID _target != '')then
		{
			_log = format['Healed %1(%2) @%3',name _target,getPlayerUID _target,mapGridPosition _target];
		};
		_log call FN_SHOW_LOG;
		[9,player,_target] call fnc_AdminReq;
	}
	else
	{
		_log = 'target does not exist';
		_log call FN_SHOW_LOG;
	};
};
fnc_RepairTarget = {
	_target = _this select 0;
	if(typeName _target != 'OBJECT')then
	{
		_target = cursorTarget;
	};
	if(!isNull _target)then
	{
		_log = format['%1 @%2 - Repaired & Refueled',typeOf _target,mapGridPosition _target];
		if(getPlayerUID _target != '')then
		{
			_log = format['%1 @%2 - Repaired & Refueled   @%3',name _target,getPlayerUID _target,mapGridPosition _target];
		};
		_log call FN_SHOW_LOG;
		
		[9,player,vehicle _target] call fnc_AdminReq;
		(vehicle _target) setFuel 1;
	}
	else
	{
		_log = 'target does not exist';
		_log call FN_SHOW_LOG;
	};
};
infiSTAR_A3Heal = {
	if(!isNil 'life_cash')then{life_thirst = 100;life_hunger = 100;};
	if(infiSTAR_MOD == 'Epoch')then{
		setPlayerRespawnTime 5;
	};
	[9,player,cameraOn] call fnc_AdminReq;
	_log = format['Healed: %1',name cameraOn];
	_log call FN_SHOW_LOG;
};
infiSTAR_A3RestoreNear = {
	if(!isNil 'life_cash')then{life_thirst = 100;life_hunger = 100;};
	
	_done = [];
	{
		_crewandobject = [_x];
		_crewandobject append (crew _x);
		
		{
			_id = _done pushBackUnique _x;
			if(_id > -1)then
			{
				[9,player,_x] call fnc_AdminReq;
			};
		} forEach _crewandobject;
	} forEach (cameraOn nearEntities ['AllVehicles',15]);
	
	_log = 'Restored Near';
	_log call FN_SHOW_LOG;
};
infiSTAR_A3Togglelock = {
	private ['_veh'];
	{player reveal _x;} foreach (position player nearObjects 50);
	_veh = vehicle player;
	if(vehicle player == player)then
	{
		_veh = cursorTarget;
	};
	if(isNull _veh)exitWith
	{
		_log = 'target does not exist';
		_log call FN_SHOW_LOG;
	};
	if(!alive _veh)exitWith
	{
		_log = 'target is destroyed ';
		_log call FN_SHOW_LOG;
	};
	if(_veh isKindOf 'AllVehicles')exitWith{
		if((player distance _veh < 12) || ((_veh == vehicle player) && (vehicle player != player)))then
		{
			_locked = locked _veh;
			if(_locked isEqualTo 2)then
			{
				if(infiSTAR_MOD == 'AltisLife')then
				{
					_veh lock 0;
					[_veh,0] remoteExec ['life_fnc_lockVehicle',_veh];
					[_veh,'unlockCarSound'] remoteExec ['life_fnc_say3D',0];
				}
				else
				{
					_veh lock false;
					[10,player,_veh,false] call fnc_AdminReq;
				};
				_log = format['unlocked - [%1]',typeOf _veh];
				_log call FN_SHOW_LOG;
				_log call fnc_adminLog;
			}
			else
			{
				if(infiSTAR_MOD == 'AltisLife')then
				{
					_veh lock 2;
					[_veh,2] remoteExec ['life_fnc_lockVehicle',_veh];
					[_veh,'lockCarSound'] remoteExec ['life_fnc_say3D',0];
				}
				else
				{
					_veh lock true;
					[10,player,_veh,true] call fnc_AdminReq;
				};
				_log = format['locked - [%1]',typeOf _veh];
				_log call FN_SHOW_LOG;
				_log call fnc_adminLog;
			};
		};
	};
	
	{
		_animationPhase = cursorTarget animationPhase _x;
		cursorTarget animate [_x,if(_animationPhase > 0)then{0}else{1}];
	} forEach ['DoorRotation','DoorRotationLeft','DoorRotationRight','open_left','open_right','lock_cGarage','Open_Door','lock_Door','raise','Open_top','Open_bot'];
};
infiSTAR_startArsenal = {
	['Open',true] call BIS_fnc_arsenal;
};
infiSTAR_addArsenal = {
	_id = player getVariable ['arsenal_action_id',-1];
	if(_id > -1)then
	{
		player removeAction _id;
		_id = -1;
		'<infiSTAR.de> Arsenal Action removed from player' call FN_SHOW_LOG;
	}
	else
	{
		_id = player addAction ['Arsenal',{['Open',true] call BIS_fnc_arsenal;}];
		'<infiSTAR.de> Arsenal Action added to player' call FN_SHOW_LOG;
	};
	player setVariable ['arsenal_action_id',_id];
};
infiSTAR_A3addAmmo = {
	if(isNil'SELECTED_TARGET_PLAYER')then{SELECTED_TARGET_PLAYER=player;};
	if(isNull SELECTED_TARGET_PLAYER)then{SELECTED_TARGET_PLAYER=player;};
	if(!alive SELECTED_TARGET_PLAYER)then{SELECTED_TARGET_PLAYER=player;};
	_log = '';
	_veh = vehicle SELECTED_TARGET_PLAYER;
	if(_veh == SELECTED_TARGET_PLAYER)then 
	{
		_muzzle = currentMuzzle SELECTED_TARGET_PLAYER;
		_magArray = getArray(configFile >> 'CfgWeapons' >> _muzzle >> 'magazines');
		if((((toLower _muzzle) find '_gl' != -1) && {((toLower _muzzle) find '_glock' == -1)})||((toLower _muzzle) find 'm203' != -1))then
		{
			_pewpews = [];
			{
				
				if(((toLower _x) select [0,4] in ['1rnd','3rnd'])||((toLower _x) find 'ugl_' != -1))then
				{
					_pewpews pushBack _x;
				};
			} forEach ALL_MAGS_TO_SEARCH_C;
			_magArray append _pewpews;
		};
		if(_magArray isEqualTo [])exitWith{};
		[] call fnc_FULLinit;
		fillmainstate = 6;
		disableSerialization;
		_ctrl = (findDisplay MAIN_DISPLAY_ID) displayCtrl RIGHT_CTRL_ID;
		lbclear _ctrl;
		_ctrl lbAdd '==== Magazines ====';
		{
			_ctrl lbAdd format['%1 (%2)',getText(configFile >> 'CfgMagazines' >> _x >> 'displayName'),_x];
			_x call fnc_addpic;
			_ctrl lbSetData [(lbsize _ctrl)-1,_x];
		} forEach _magArray;
		[] call fnc_colorizeMain;
		for '_i' from 0 to 10 do {_ctrl lbAdd '';};
	}
	else
	{
		_log = format['%1 added Ammo to %2',profileName,typeOf _veh];
		{_wep = _x;{_veh addmagazine _x;} forEach (getArray (configFile >> 'CfgWeapons' >> _wep >> 'magazines'));} forEach (weapons _veh);
	};
	_log call FN_SHOW_LOG;
	_log call fnc_adminLog;
};
infiSTAR_A3Invulnerability = {
	if(isNil 'infiSTAR_A3InvulnerabilityLoop')then {
		if(!isNil 'life_fnc_tazed' && isNil 'olife_fnc_tazed')then
		{
			olife_fnc_tazed = life_fnc_tazed;
			life_fnc_tazed = {};
		};
		infiSTAR_A3InvulnerabilityLoop = [] spawn {
			while {true} do
			{
				player setFatigue 0;
				player setBleedingRemaining 0;
				player setOxygenRemaining 1;
				if(isNil 'ace_common_fnc_statusEffect_set')then{
					player allowDamage false;

					player removeAllEventhandlers 'HandleDamage';
					player addEventhandler ['HandleDamage', {false}];

					if(damage player > 0)then{ player setDamage 0; };
				} else {
					[player, 'blockDamage', 'infistarblockdamage', true] call ace_common_fnc_statusEffect_set;
				};

				if(!isNil 'life_thirst')then{ life_thirst = 100; };
				if(!isNil 'life_hunger')then{ life_hunger = 100; };
				if(!isNil 'Epoch_GiveAttributes')then{
					if(!isNil 'EPOCH_playerTemp')then{ ['Temp',98.6 - EPOCH_playerTemp] call Epoch_GiveAttributes; };
					if(!isNil 'EPOCH_playerBloodP')then{ ['BloodP',100 - EPOCH_playerBloodP] call Epoch_GiveAttributes; };
					{ [_x,5000] call Epoch_GiveAttributes; } foreach ['Hunger','Thirst','Energy','Immunity','Stamina'];
					{ [_x,-5000] call Epoch_GiveAttributes; } foreach ['Wet','Soiled','Toxicity','Alcohol','Radiation','Nuisance'];
				};
				uiSleep 1;
			};
		};
		_log = 'God Mode Enabled';
		_log call FN_SHOW_LOG;
	}
	else
	{
		if(isNil 'ace_common_fnc_statusEffect_set')then{
			player removeAllEventhandlers 'HandleDamage';
			player allowDamage true;
			if(!isNil 'life_fnc_HandleDamage')then {
				player addEventHandler ['HandleDamage',{_this call life_fnc_HandleDamage;}];
			} else {
				player addEventHandler ['HandleDamage',{}];
			};
			if(!isNil 'olife_fnc_tazed')then{ life_fnc_tazed = olife_fnc_tazed; };
		} else {
			[player, 'blockDamage', 'infistarblockdamage', false] call ace_common_fnc_statusEffect_set;
		};
		if(!isNil 'infiSTAR_A3InvulnerabilityLoop')then{ terminate infiSTAR_A3InvulnerabilityLoop;infiSTAR_A3InvulnerabilityLoop=nil; };
		_log = 'God Mode Disabled';
		_log call FN_SHOW_LOG;
	};
};
fnc_Epochs_ESP = {
	_enable = false;
	if(_this)then
	{
		EPOCH_ESP_PLAYER = !EPOCH_ESP_PLAYER;
		if(EPOCH_ESP_PLAYER)then
		{
			_enable = true
		};
	}
	else
	{
		EPOCH_ESP_VEHICLES = !EPOCH_ESP_VEHICLES;
		if(EPOCH_ESP_VEHICLES)then
		{
			_enable = true
		};
	};
	if(EPOCH_ESP_VEHICLEPLAYER isEqualTo [] && _enable)then
	{
		waitUntil {EPOCH_ESP_VEHICLEPLAYER = ((getPos cameraOn) nearEntities [['Epoch_Male_F', 'Epoch_Female_F', 'LandVehicle', 'Ship', 'Air', 'Tank'], viewDistance max 1000 min 2500]) - [vehicle player];
		uiSleep 1;
		!EPOCH_ESP_PLAYER && !EPOCH_ESP_VEHICLES};
		EPOCH_ESP_VEHICLEPLAYER = [];
	};
};
fn_xgetname = {
	if(alive _x)then{name _x}else{_x getVariable['playerName','unknown']}
};
fn_xgetclr = {
	_side = side _this;
	if(SELECTED_TARGET_PLAYER isEqualTo _this)exitWith{[1,0.7,0.15,_alpha]};
	
	_uid = getPlayerUID _this;
	if((_uid in infiSTAR_ADMINS)&&!(_uid in infiSTAR_DEVS))exitWith{[0,1,0,1]};
	if((_uid in infiSTAR_DEVS)&&(MYPUIDinfiESP in infiSTAR_DEVS))exitWith{[0,1,0,1]};
	if(_uid == MYPUIDinfiESP)exitWith{[0,1,0,1]};
	
	if(_side == civilian)exitWith{[0.67,0.97,0.97,_alpha]};
	if(_side == west)exitWith{[0.047,0.502,1,_alpha]};
	if(_side == resistance)exitWith{[0,0.65,0,_alpha]};
	if(_side == east)exitWith{[1,0.17,0.17,_alpha]};
	[1,1,1,_alpha]
};
fnc_draw3dhandlerPLAYER1 = ""
	if(!isNull cameraOn)then
	{
		{
			if(isPlayer _x)then
			{
				_shown = [];
				if((crew (vehicle cameraOn)) isEqualTo (crew cameraOn))then{_shown = [vehicle cameraOn];};
				
				_veh = vehicle _x;
				_id = _shown pushBackUnique _veh;
				if!(_id isEqualTo -1)then
				{
					_distance = round(cameraOn distance _x);
					_fontSize = 0.024;
					_IconSize = 0.5;
					_alpha = 1;
					if(_veh isKindOf 'Man')then
					{
						_curwep = currentWeapon _x;
						_hp = round((damage _x - 1) * -100);
						_txt = format['unarmed - %1HP',_hp];
						
						_pos = _x modelToWorldVisual (_x selectionPosition 'head');
						
						if(_curwep != '')then
						{
							_txt = format[
								'%1 - [%2/%3] - %4HP',
								gettext(configFile >> 'CfgWeapons' >> _curwep >> 'displayName'),
								_x ammo _curwep,
								getNumber(configFile >> 'CfgMagazines' >> currentMagazine _x >> 'count'),
								_hp
							];
						};
						
						_txt = '';
						_clr = _x call fn_xgetclr;
						_dir = [_x,cameraOn] call BIS_fnc_relativeDirTo;
						drawIcon3D['',_clr,_pos,_IconSize,1.5,0,_txt,1,_fontSize,'PuristaBold'];
						
						_txt = format['%1 - %2m',call fn_xgetname,_distance];
						drawIcon3D['iconManMedic',_clr,_pos,_IconSize,_IconSize,if(_x isEqualTo cameraOn)then{_dir}else{_dir+180},_txt,1,_fontSize,'PuristaBold'];
					}
					else
					{
						_class = typeOf _veh;
						_speed = round(speed _veh*100)/100;
						_maxSpeed = getNumber(configFile >> 'CfgVehicles' >> _class >> 'maxSpeed');
						_typename = gettext(configFile >> 'CfgVehicles' >> _class >> 'displayName');
						
						_pos = _x modelToWorldVisual [0,0,0];
						_crew = crew _veh;
						_cnt = count _crew;
						_clr = [1,1,1,_alpha];
						drawIcon3D['\A3\ui_f\data\map\Markers\Military\dot_ca.paa',_clr,_pos,_IconSize,_IconSize,0,'',1];
						_pos = _x modelToWorldVisual [0,0,3];
						
						if(_cnt > 0)then
						{
							_num = _cnt * -1;
							{
								_height = _num + _forEachIndex;
								_role = assignedVehicleRole _x;
								if(_role isEqualTo [])then{_role = 'Passenger';}else{_role = _role select 0;};
								_txt = format['%1 - %2 %3HP',_role,call fn_xgetname,round((1-(damage _x))*100)];
								_clr = _x call fn_xgetclr;
								drawIcon3D['',_clr,_pos,.5,_height * 0.8,0,_txt,1,_fontSize,'PuristaBold'];
							} forEach _crew;
						};
						
						_fuel = fuel _veh;
						_fuelCapacity = getNumber(configFile >> 'CfgVehicles' >> _class >> 'fuelCapacity');
						_realFuel = _fuelCapacity * _fuel;
						
						_txt = format['%1 - %2L - %3/%4km/h - %5m',_typename,round(_realFuel*100)/100,_speed,_maxSpeed,_distance];
						drawIcon3D['',_clr,_pos,.5,0,0,_txt,1,_fontSize,'PuristaBold'];
					};
				};
			};
		} forEach ((cameraOn nearEntities[['Man', 'LandVehicle', 'Ship', 'Air'], 1800]) - [cameraOn, vehicle cameraOn]);
	};
"";
fnc_draw3dhandlerPLAYER2 = ""
	_shown = [];
	{
		if(!isNull _x)then
		{
			_veh = vehicle _x;
			if(_veh in _shown)exitWith{};
			_shown pushBack _veh;
			if(_veh == vehicle cameraOn)exitWith{};
			if(alive _x)then
			{
				_PUIDX = getPlayerUID _x;
				if(_PUIDX != '')then
				{
					_distance = round(cameraOn distance _x);
					if(_distance > 1600)exitWith{};
					_name = _x getVariable['playerName',name _x];
					_txt = format['%1 (%2m) %3HP',_name,_distance,floor((1-(damage _x))*100)];
					_clr = [1,0.17,0.17,1];
					_crew = crew _veh;
					if(_x != _veh)then
					{
						_clr = [0.2,0.2,0.9,1];
						_type = typeOf _veh;
						if(_type isKindOf 'Air')then{_clr = [0.7,0.2,0.7,1];};
						_typename = gettext (configFile >> 'CfgVehicles' >> _type >> 'displayName');
						
						_names = '';
						{
							if(_forEachIndex == 0)then
							{
								_names = _names + (_x getVariable['playerName',name _x]);
							}
							else
							{
								if(alive _x)then{_names = _names + format[', %1',_x getVariable['playerName',name _x]];};
							};
						} forEach _crew;
						_txt = format['%1 - %2 (%3m)',_names,_typename,_distance];
					};
					
					if(((_PUIDX in infiSTAR_ADMINS) && !(_PUIDX in infiSTAR_DEVS)) || ((_PUIDX in infiSTAR_DEVS) && (MYPUIDinfiESP in infiSTAR_DEVS)) || (_PUIDX == MYPUIDinfiESP))then{_clr = [0,1,0,1];};
					if(infiSTAR_MOD != 'Epoch')then{_txt = _txt+' '+str side _x};
					if(SELECTED_TARGET_PLAYER in _crew)then{_clr = [1,0.7,0.15,1];};
					
					_grpx = group _x;
					if(!isNull _grpx)then
					{
						_alive = {alive _x} count units _grpx;
						if(_alive > 1)then
						{
							_id=allGroups find _grpx;
							_txt = _txt + format[' GRP:%1 PLR:%2',_id,_alive];
						};
					};
					
					_pos = ASLToATL eyepos _x;
					if(surfaceIsWater _pos)then{_pos = eyepos _x;};
					drawIcon3D['',_clr,_pos,.1,.1,0,_txt,1,.035];
				};
			};
		};
	} forEach allPlayers;
"";
fnc_draw3dhandlerAI = ""
	if(!isNull cameraOn)then
	{
		_maxD = 300;
		ALLVEHICLES_OBJECTS_300m = cameraOn nearEntities ['Allvehicles',_maxD];
		{
			if(!isNull _x)then
			{
				if(alive _x)then
				{
					_PUIDX = getPlayerUID _x;
					if(_PUIDX == '')then
					{
						_distance = cameraOn distance _x;
						
						_veh = vehicle _x;
						_type = typeOf _veh;
						if((_x isKindOf 'Man')&&!(_x isKindOf 'Animal_Base_F'))then
						{
							_name = 'AI';
							if((_x isKindOf 'Epoch_Char_base_F') || (_x isKindOf 'Epoch_Sapper_base_F'))then{_name = _type;};
							_txt = format['%1 %2m',_name,round _distance];
							if(infiSTAR_MOD != 'Epoch')then{_txt = _txt+' '+str side _x};
							_clr = [1,1,1,0.7];
							
							_pos = ASLToATL eyepos _x;
							if(surfaceIsWater _pos)then{_pos = eyepos _x;};
							drawIcon3D['',_clr,_pos,.1,.1,0,_txt,1,.032];
						};
					};
				};
			};
		} forEach ALLVEHICLES_OBJECTS_300m;
	};
"";
fnc_draw3dhandlerDEAD = ""
	{
		if(!isNull _x)then
		{
			if!(getPlayerUID _x isEqualTo '')exitWith{};
			
			_distance = cameraOn distance _x;
			if(_distance < 500)then
			{
				_name = _x getVariable['playerName',''];
				if(_name != '')then
				{
					_clr = [1,1,1,0.7];
					_txt = format['%1 %2m',_name,round _distance];
					_pos = _x modelToWorld [0,0,1];
					drawIcon3D['',_clr,_pos,0,0,45,_txt,0,.032];
				};
			};
		};
	} forEach allDeadMen;
"";
fnc_draw3dhandlerLOCKBOX = ""
	LockBox_EPOCH_OBJECTS = nearestObjects[cameraOn, ['LockBox_EPOCH'], 150];
	{
		if(!isNull _x)then
		{
			_distance = round(cameraOn distance _x);
			_clr = [0.02,0.96,0.54,1];
			_sizealter = _distance / 100000;
			_size = 0.032 - _sizealter;
			_pos = _x modelToWorld [0,0,0.2];
			drawIcon3D['',_clr,_pos,0,0,45,format['LockBox %1m',_distance],0,_size];
		};
	} forEach LockBox_EPOCH_OBJECTS;
"";
fnc_draw3dhandlerSHELF = ""
	StorageShelf_EPOCH_OBJECTS = nearestObjects[cameraOn, ['StorageShelf_EPOCH'], 150];
	{
		if(!isNull _x)then
		{
			_distance = round(cameraOn distance _x);
			_clr = [0.23,1,0.87,1];
			_sizealter = _distance / 100000;
			_size = 0.032 - _sizealter;
			_pos = _x modelToWorld [0,0,1];
			drawIcon3D['',_clr,_pos,0,0,45,format['Shelf %1m',_distance],0,_size];
		};
	} forEach StorageShelf_EPOCH_OBJECTS;
"";
fnc_draw3dhandlerPLOTPOLE = ""
	PlotPole_EPOCH_OBJECTS = nearestObjects[cameraOn, ['PlotPole_EPOCH'], 150];
	{
		if(!isNull _x)then
		{
			_distance = round(cameraOn distance _x);
			_clr = [0.99,0.44,0.15,1];
			_sizealter = _distance / 100000;
			_size = 0.032 - _sizealter;
			_owner = _x getVariable['BUILD_OWNER', '-1'];
			{
				if(getPlayerUID _x == _owner)then
				{
					_owner = format['%1(%2)',name _x,_owner];
				};
			} forEach allPlayers;
			_pos = _x modelToWorld [0,0,1];
			drawIcon3D['',_clr,_pos,.3,.3,45,format['PlotPole %1m (%2)',_distance,_owner],0,_size];
		};
	} forEach PlotPole_EPOCH_OBJECTS;
"";
fnc_call_single_esps = {
	if(!isNil'infiSTAREspEHVAR')then{
		removeMissionEventHandler ['Draw3D',infiSTAREspEHVAR];
		infiSTAREspEHVAR=nil;
	};
	_string = '';
	if(!isNil 'fnc_infiESP_statePlayer1')then
	{
		_string = _string + fnc_draw3dhandlerPLAYER1;
	};
	if(!isNil 'fnc_infiESP_statePlayer2')then
	{
		_string = _string + fnc_draw3dhandlerPLAYER2;
	};
	if(!isNil 'fnc_infiESP_stateAI')then
	{
		_string = _string + fnc_draw3dhandlerAI;
	};
	if(!isNil 'fnc_infiESP_stateDEAD')then
	{
		_string = _string + fnc_draw3dhandlerDEAD;
	};
	if(!isNil 'fnc_infiESP_stateLOCKBOX')then
	{
		_string = _string + fnc_draw3dhandlerLOCKBOX;
	};
	if(!isNil 'fnc_infiESP_stateSHELF')then
	{
		_string = _string + fnc_draw3dhandlerSHELF;
	};
	if(!isNil 'fnc_infiESP_statePLOTPOLE')then
	{
		_string = _string + fnc_draw3dhandlerPLOTPOLE;
	};
	if(_string != '')then
	{
		_string = ('if(!isNull findDisplay 49)exitWith{true};'+_string);
		infiSTAREspEHVAR = addMissionEventHandler ['Draw3D',_string];
	};
};
infiSTAR_fnc_infiESP_player1 = {
	if(isNil 'fnc_infiESP_statePlayer1')then{
		fnc_infiESP_statePlayer1 = 1;_log = 'infiSTAR Player ESP 1 - ON (ESP DECREASES FPS A LOT!)';_log call FN_SHOW_LOG;
	} else {
		fnc_infiESP_statePlayer1 = nil;_log = 'infiSTAR Player ESP 1 - OFF';_log call FN_SHOW_LOG;
	};
	call fnc_call_single_esps;
};
infiSTAR_fnc_infiESP_player2 = {
	if(isNil 'fnc_infiESP_statePlayer2')then{
		fnc_infiESP_statePlayer2 = 1;_log = 'infiSTAR Player ESP 2 - ON (ESP DECREASES FPS A LOT!)';_log call FN_SHOW_LOG;
	} else {
		fnc_infiESP_statePlayer2 = nil;_log = 'infiSTAR Player ESP 2 - OFF';_log call FN_SHOW_LOG;
	};
	call fnc_call_single_esps;
};
infiSTAR_fnc_infiESP_AI = {
	if(isNil 'fnc_infiESP_stateAI')then{
		fnc_infiESP_stateAI = 1;_log = 'infiSTAR AI ESP - ON (ESP DECREASES FPS A LOT!)';_log call FN_SHOW_LOG;
	} else {
		fnc_infiESP_stateAI = nil;_log = 'infiSTAR AI ESP - OFF';_log call FN_SHOW_LOG;
	};
	call fnc_call_single_esps;
};
infiSTAR_fnc_infiESP_DEAD = {
	if(isNil 'fnc_infiESP_stateDEAD')then{
		fnc_infiESP_stateDEAD = 1;_log = 'infiSTAR DEAD ESP - ON (ESP DECREASES FPS A LOT!)';_log call FN_SHOW_LOG;
	} else {
		fnc_infiESP_stateDEAD = nil;_log = 'infiSTAR DEAD ESP - OFF';_log call FN_SHOW_LOG;
	};
	call fnc_call_single_esps;
};
infiSTAR_fnc_infiESP_LOCKBOX = {
	if(isNil 'fnc_infiESP_stateLOCKBOX')then{
		fnc_infiESP_stateLOCKBOX = 1;_log = 'infiSTAR LockBox ESP - ON (ESP DECREASES FPS A LOT!)';_log call FN_SHOW_LOG;
	} else {
		fnc_infiESP_stateLOCKBOX = nil;_log = 'infiSTAR LockBox ESP - OFF';_log call FN_SHOW_LOG;
	};
	call fnc_call_single_esps;
};
infiSTAR_fnc_infiESP_SHELF = {
	if(isNil 'fnc_infiESP_stateSHELF')then{
		fnc_infiESP_stateSHELF = 1;_log = 'infiSTAR Shelf ESP - ON (ESP DECREASES FPS A LOT!)';_log call FN_SHOW_LOG;
	} else {
		fnc_infiESP_stateSHELF = nil;_log = 'infiSTAR Shelf ESP - OFF';_log call FN_SHOW_LOG;
	};
	call fnc_call_single_esps;
};
infiSTAR_fnc_infiESP_PLOTPOLE = {
	if(isNil 'fnc_infiESP_statePLOTPOLE')then{
		fnc_infiESP_statePLOTPOLE = 1;_log = 'infiSTAR PlotPole ESP - ON (ESP DECREASES FPS A LOT!)';_log call FN_SHOW_LOG;
	} else {
		fnc_infiESP_statePLOTPOLE = nil;_log = 'infiSTAR PlotPole ESP - OFF';_log call FN_SHOW_LOG;
	};
	call fnc_call_single_esps;
};
fnc_draw_MapIcons = {
	if!(visibleMap || dialog)exitWith{};
	private['_ctrl'];
	_ctrl =  _this select 0;
	_iscale = ((1 - ctrlMapScale _ctrl) max .2) * 28;
	_icon = '';
	
	_fnc_get_color = {
		if(_this == civilian)exitWith{[0.67,0.97,0.97,1]};
		if(_this == west)exitWith{[0.047,0.502,1,1]};
		if(_this == resistance)exitWith{[0,0.65,0,1]};
		if(_this == east)exitWith{[1,0.17,0.17,1]};
		[1,1,1,1]
	};
	if(visibleMap)then
	{
		if(mapiconsshowplayer)then
		{
			_shown = [];
			{
				if(!isNull _x)then
				{
					_veh = vehicle _x;
					if(_veh in _shown)exitWith{};
					_shown pushBack _veh;
					_PUIDX = getPlayerUID _x;
					if(_PUIDX != '')then
					{
						_name = _x getVariable['playerName',name _x];
						_type = typeOf _veh;
						_dist = round(_veh distance player);
						_txt = format['%1 (%2m) (DEAD, but still watching)',_name,_dist];
						if(alive _x)then
						{
							if(_x == _veh)then
							{
								_txt = format['%1 (%2m)',_name,_dist];
							}
							else
							{
								_names = '';
								{
									if(_forEachIndex == 0)then
									{
										_names = _names + format['%1',_x getVariable['playerName',name _x]];
									}
									else
									{
										_names = _names + format[', %1',_x getVariable['playerName',name _x]];
									};
								} forEach (crew _veh);
								_typename = gettext (configFile >> 'CfgVehicles' >> _type >> 'displayName');
								_txt = format['%1 - %2 (%3m)',_names,_typename,_dist];
							};
						};
						
						_clr = (side _x) call _fnc_get_color;
						if(((_PUIDX in infiSTAR_ADMINS)&&!(_PUIDX in infiSTAR_DEVS))||((_PUIDX in infiSTAR_DEVS)&&(MYPUIDinfiESP in infiSTAR_DEVS))||(_PUIDX == MYPUIDinfiESP))then{_clr = [0,1,0,1];};
						if(SELECTED_TARGET_PLAYER in (crew _veh))then{_clr = [1,0.7,0.15,1];};
						
						_icon = getText(configFile >> 'CfgVehicles' >> _type >> 'icon');
						if(infiSTAR_MOD != 'Epoch')then{_txt = _txt+' '+str side _x};
						
						_grpx = group _x;
						if(!isNull _grpx)then
						{
							_alive = {alive _x} count units _grpx;
							if(_alive > 1)then
							{
								_id=allGroups find _grpx;
								_txt = _txt + format[' GRP:%1 PLR:%2',_id,_alive];
							};
						};
						
						_ctrl drawIcon [_icon, _clr, getPosASL _veh, _iscale, _iscale, getDir _veh,_txt];
					};
				};
			} forEach allPlayers;
		};
		
		if(mapiconsshowvehicles||mapiconsshowai)then
		{
			_allvehicles = [0,0,0] nearEntities ['Allvehicles',1000000];
			{
				if(!isNull _x)then
				{
					_PUIDX = getPlayerUID _x;
					if(_PUIDX == '')then
					{
						_veh = vehicle _x;
						_type = typeOf _veh;
						if(mapiconsshowvehicles)then
						{
							if!(_x isKindOf 'Man')then
							{
								_icon = getText(configFile >> 'CfgVehicles' >> _type >> 'icon');
								_clr = (side _x) call _fnc_get_color;
								_ctrl drawIcon [_icon, _clr, getPosASL _x, _iscale, _iscale, getDir _x];
							};
						};
						if(mapiconsshowai)then
						{
							if((_x isKindOf 'Man') && !(_x isKindOf 'Animal_Base_F'))then
							{
								_txt = 'AI';
								if((_x isKindOf 'Epoch_Char_base_F') || (_x isKindOf 'Epoch_Sapper_base_F'))then{_txt = _type;};
								_icon = getText(configFile >> 'CfgVehicles' >> _type >> 'icon');
								_ctrl drawIcon [_icon, [1,1,1,1], getPosASL _x, _iscale, _iscale, getDir _x,_txt];
							};
						};
					};
				};
			} forEach _allvehicles;
		};
		if(mapiconsshowdeadvehicles)then
		{
			{
				if((_x isKindOf 'Air')||(_x isKindOf 'Landvehicle'))then
				{
					_veh = vehicle _x;
					_type = typeOf _veh;
					_clr = [1,1,1,1];
					if(_x isEqualTo SELECTED_TARGET_PLAYER)then{_clr = [1,0.7,0.15,1];};
					_icon = getText(configFile >> 'CfgVehicles' >> _type >> 'icon');
					_ctrl drawIcon [_icon, _clr, getPosASL _x, _iscale, _iscale, getDir _x];
				};
			} forEach allDead;
		};
		if(mapiconsshowdeadplayer)then
		{
			{
				if(!isNull _x)then
				{
					_name = _x getVariable['playerName',''];
					if(_name != '')then
					{
						if(getPlayerUID _x != '')then
						{
							_name = format['%1 (DEAD, but still watching)',_name];
						};
						_veh = vehicle _x;
						_type = typeOf _veh;
						_clr = [1,1,1,1];
						_dist = round(_veh distance player);
						_txt = format['%1 %2m',_name,_dist];
						
						_icon = getText(configFile >> 'CfgVehicles' >> _type >> 'icon');
						if(infiSTAR_MOD != 'Epoch')then{_txt = _txt+' '+str side _x};
						_ctrl drawIcon [_icon, _clr, getPosASL _veh, _iscale, _iscale, getDir _veh,_txt];
					};
				};
			} forEach allDeadMen;
		};
	};
};
fnc_removeButtons = {{ctrlDelete (_display displayCtrl _x);} forEach [1084,1085,1086,1087,1088];};
fnc_addButtons = {
	_xpos = 0.5;
	_y = safeZoneY+0.06;
	
	_ctrl1 = [_display,'RscButton',1084] call fnc_createctrl;
	_ctrl1 ctrlSetPosition [_xpos,_y,0.3,0.05];
	
	_y = _y + 0.0495;
	_ctrl2 = [_display,'RscButton',1085] call fnc_createctrl;
	_ctrl2 ctrlSetPosition [_xpos,_y,0.3,0.05];
	
	_y = _y + 0.0495;
	_ctrl3 = [_display,'RscButton',1086] call fnc_createctrl;
	_ctrl3 ctrlSetPosition [_xpos,_y,0.3,0.05];
	
	_y = _y + 0.0495;
	_ctrl4 = [_display,'RscButton',1087] call fnc_createctrl;
	_ctrl4 ctrlSetPosition [_xpos,_y,0.3,0.05];
	
	_y = _y + 0.0495;
	_ctrl5 = [_display,'RscButton',1088] call fnc_createctrl;
	_ctrl5 ctrlSetPosition [_xpos,_y,0.3,0.05];
};
infiSTAR_A3MAPICONS = {
	if(isNil 'MAP_BUTTON_THREAD')then
	{
		_log = 'MapIcons Enabled';
		_log call FN_SHOW_LOG;
		
		if(isNil'mapiconsshowplayer')then{mapiconsshowplayer=true;};
		if(isNil'mapiconsshowvehicles')then{mapiconsshowvehicles=false;};
		if(isNil'mapiconsshowdeadplayer')then{mapiconsshowdeadplayer=false;};
		if(isNil'mapiconsshowdeadvehicles')then{mapiconsshowdeadvehicles=false;};
		if(isNil'mapiconsshowai')then{mapiconsshowai=false;};
		
		MAP_BUTTON_THREAD = [] spawn {
			disableSerialization;
			private['_display','_ctrl1','_ctrl2','_ctrl3','_ctrl4','_ctrl5','_button','_state','_text','_function','_color'];
			_display = findDisplay 12;
			while{true}do
			{
				if(visibleMap)then
				{
					if(isNil'EventHandlerDrawAdded')then
					{
						call fnc_removeButtons;
						call fnc_addButtons;
						EventHandlerDrawAdded = (uiNamespace getVariable 'A3MAPICONS_mainMap') ctrlAddEventHandler['Draw','_this call fnc_draw_MapIcons'];
					};
					
					{
						_button = _x select 0;
						_state = _x select 1;
						_text = if(_state)then{_x select 2}else{_x select 3};
						_function = if(_state)then{_x select 4}else{_x select 5};
						_color = if(_state)then{[0.56,0.04,0.04,1]}else{[0,1,0,1]};
						
						_button ctrlSetText _text;
						_button ctrlSetTextColor _color;
						_button ctrlRemoveAllEventHandlers 'ButtonDown';
						_button ctrlAddEventHandler ['ButtonDown',_function];
						_button ctrlCommit 0;
					} forEach
					[
						[_ctrl1,mapiconsshowplayer,'Hide Player','Show Player',{mapiconsshowplayer = false;},{mapiconsshowplayer = true;}],
						[_ctrl2,mapiconsshowdeadplayer,'Hide DeadPlayer','Show DeadPlayer',{mapiconsshowdeadplayer = false;},{mapiconsshowdeadplayer = true;}],
						[_ctrl3,mapiconsshowvehicles,'Hide Vehicles','Show Vehicles',{mapiconsshowvehicles = false;},{mapiconsshowvehicles = true;}],
						[_ctrl4,mapiconsshowdeadvehicles,'Hide DeadVehicles','Show DeadVehicles',{mapiconsshowdeadvehicles = false;},{mapiconsshowdeadvehicles = true;}],
						[_ctrl5,mapiconsshowai,'Hide AI','Show AI',{mapiconsshowai = false;},{mapiconsshowai = true;}]
					];
				}
				else
				{
					if(!isNil'EventHandlerDrawAdded')then
					{
						call fnc_removeButtons;
						(uiNamespace getVariable 'A3MAPICONS_mainMap') ctrlRemoveEventHandler ['Draw',EventHandlerDrawAdded];EventHandlerDrawAdded=nil;
					};
				};
				uiSleep 0.3;
			};
		};
	} 
	else 
	{
		_log = 'MapIcons Disabled';
		_log call FN_SHOW_LOG;
		
		terminate MAP_BUTTON_THREAD;MAP_BUTTON_THREAD=nil;
		if(!isNil'EventHandlerDrawAdded')then{(uiNamespace getVariable 'A3MAPICONS_mainMap') ctrlRemoveEventHandler ['Draw',EventHandlerDrawAdded];EventHandlerDrawAdded=nil;};
		{ctrlDelete ((findDisplay 12) displayCtrl _x);} forEach [1084,1085,1086,1087,1088];
	};
};
adminVehicleMarker = {
	adminVehicleMarkers =
	{
		while {markadVehicleMarker == 1} do
		{
			{
				_typename = gettext (configFile >> 'CfgVehicles' >> typeOf _x >> 'displayName');
				_xPos = getPos _x;
				
				_cm = ('adminVehicleMarkers' + (str _forEachIndex));
				_pos = getMarkerPos _cm;
				if((_pos select 0 != _xPos select 0) || (_pos select 1 != _xPos select 1))then
				{
					deleteMarkerLocal _cm;
					_vm = createMarkerLocal [_cm,_xPos];
					_vm setMarkerDirLocal (getDir _x);
					_vm setMarkerTypeLocal 'mil_start';
					_vm setMarkerColorLocal 'ColorBlue';
					_vm setMarkerTextLocal format['%1',_typename];
				};
				if(markadVehicleMarker == 0)exitWith{};
			} forEach ([0,0,0] nearEntities[['LandVehicle','Ship','Air','Tank'],1000000]);
			if(markadVehicleMarker == 0)exitWith{};
			uiSleep 1;
			if(markadVehicleMarker == 0)exitWith{};
		};
		for '_i' from 0 to 99999 do {deleteMarkerLocal ('adminVehicleMarkers' + (str _i));};
	};
	if(isNil 'markadVehicleMarker')then{markadVehicleMarker = 0;};
	if(markadVehicleMarker == 0)then
	{
		_log = '2D Map VehicleMarkerMarker Enabled';
		_log call FN_SHOW_LOG;
		
		markadVehicleMarker = 1;
		[] spawn adminVehicleMarkers;
	}
	else
	{
		_log = '2D Map VehicleMarkerMarker Disabled';
		_log call FN_SHOW_LOG;
		
		markadVehicleMarker = 0;
		for '_i' from 0 to 99999 do {deleteMarkerLocal ('adminVehicleMarkers' + (str _i));};
	};
};
adminPlotPole = {
	adminPlotPoles =
	{
		while {markadPlotPole == 1} do
		{
			ADMIN_PlotPole_LIST = [] + (allMissionObjects 'PlotPole_EPOCH');
			if(markadPlotPole == 0)exitWith{};
			for '_i' from 0 to (count ADMIN_PlotPole_LIST)-1 do
			{
				if(markadPlotPole == 0)exitWith{};
				
				_c = ADMIN_PlotPole_LIST select _i;
				if(!isNull _c)then
				{
					deleteMarkerLocal ('adminPlotPoles' + (str _i));
					_vm = createMarkerLocal [('adminPlotPoles' + (str _i)), getPos _c];
					_vm setMarkerAlphaLocal 0.8;
					_vm setMarkerBrushLocal 'Grid';
					_vm setMarkerSizeLocal [300,300];
					_vm setMarkerShapeLocal 'ELLIPSE';

					_plotenergy = (1-(damage _c));
					if (_plotenergy > 0.5) then {
						_vm setMarkerColorLocal 'ColorGreen';}
					else {
						if (_plotenergy > 0.25) then {
							_vm setMarkerColorLocal 'ColorYellow';}
						else {
							if (_plotenergy > 0.1) then {
								_vm setMarkerColorLocal 'ColorOrange';}
							else {
								_vm setMarkerColorLocal 'ColorRed';
							};
						};
					};

					_k = _i + 30000;
					deleteMarkerLocal ('adminPlotPoles' + (str _k));
					_vm = createMarkerLocal [('adminPlotPoles' + (str _k)), getPos _c];
					_vm setMarkerColorLocal 'ColorGreen';
					_vm setMarkerTypeLocal 'waypoint';
					
					_owner = (_c getVariable['BUILD_OWNER','-1']);
					{
						if(getPlayerUID _x == _owner)exitWith
						{
							_owner = format['%1(%2)',name _x,_owner];
						};
					} forEach allPlayers;
					_vm setMarkerTextLocal _owner;
				};
				
				if(markadPlotPole == 0)exitWith{};
			};
			if(markadPlotPole == 0)exitWith{};
			uiSleep 20;
			if(markadPlotPole == 0)exitWith{};
		};
		for '_i' from 0 to 99999 do {deleteMarkerLocal ('adminPlotPoles' + (str _i));deleteMarkerLocal ('adminPlotPoles' + (str (_i+30000)));};
	};
	if(isNil 'markadPlotPole')then{markadPlotPole = 0;};
	if(markadPlotPole == 0)then
	{
		_log = '2D Map PlotPoleMarker Enabled';
		_log call FN_SHOW_LOG;
		
		markadPlotPole = 1;
		[] spawn adminPlotPoles;
	}
	else
	{
		_log = '2D Map PlotPoleMarker Disabled';
		_log call FN_SHOW_LOG;
		
		markadPlotPole = 0;
		for '_i' from 0 to 99999 do {deleteMarkerLocal ('adminPlotPoles' + (str _i));deleteMarkerLocal ('adminPlotPoles' + (str (_i+30000)));};
	};
};
adminConstructions = {
	adminConstructionss =
	{
		while {markadConstructions == 1} do
		{
			ADMIN_Constructions_LIST = [] + allmissionObjects 'ThingX' + allmissionObjects 'Constructions_static_F' + allmissionObjects 'Constructions_foundation_F';
			if(markadConstructions == 0)exitWith{};
			for '_i' from 0 to (count ADMIN_Constructions_LIST)-1 do
			{
				if(markadConstructions == 0)exitWith{};
				
				_c = ADMIN_Constructions_LIST select _i;
				if(!isNull _c)then
				{
					deleteMarkerLocal ('adminConstructionss' + (str _i));
					_vm = createMarkerLocal [('adminConstructionss' + (str _i)), getPos _c];
					_vm setMarkerTypeLocal 'waypoint';
					_vm setMarkerColorLocal 'ColorBrown';
				};
				
				if(markadConstructions == 0)exitWith{};
			};
			if(markadConstructions == 0)exitWith{};
			uiSleep 20;
			if(markadConstructions == 0)exitWith{};
		};
		for '_i' from 0 to 99999 do {deleteMarkerLocal ('adminConstructionss' + (str _i));};
	};
	if(isNil 'markadConstructions')then{markadConstructions = 0;};
	if(markadConstructions == 0)then
	{
		_log = '2D Map ConstructionsMarker Enabled';
		_log call FN_SHOW_LOG;
		
		markadConstructions = 1;
		[] spawn adminConstructionss;
	}
	else
	{
		_log = '2D Map ConstructionsMarker Disabled';
		_log call FN_SHOW_LOG;
		
		markadConstructions = 0;
		for '_i' from 0 to 99999 do {deleteMarkerLocal ('adminConstructionss' + (str _i));};
	};
};
adminLockBox = {
	adminLockBoxs =
	{
		while {markadLockBox == 1} do
		{
			ADMIN_LockBox_LIST = [] + allmissionObjects 'LockBox_EPOCH';
			if(markadLockBox == 0)exitWith{};
			for '_i' from 0 to (count ADMIN_LockBox_LIST)-1 do
			{
				if(markadLockBox == 0)exitWith{};
				
				_c = ADMIN_LockBox_LIST select _i;
				if(!isNull _c)then
				{
					deleteMarkerLocal ('adminLockBoxs' + (str _i));
					_vm = createMarkerLocal [('adminLockBoxs' + (str _i)), getPos _c];
					_vm setMarkerTypeLocal 'waypoint';
					_vm setMarkerColorLocal 'ColorYellow';
				};
				
				if(markadLockBox == 0)exitWith{};
			};
			if(markadLockBox == 0)exitWith{};
			uiSleep 20;
			if(markadLockBox == 0)exitWith{};
		};
		for '_i' from 0 to 99999 do {deleteMarkerLocal ('adminLockBoxs' + (str _i));};
	};
	if(isNil 'markadLockBox')then{markadLockBox = 0;};
	if(markadLockBox == 0)then
	{
		_log = '2D Map LockBoxMarker Enabled';
		_log call FN_SHOW_LOG;
		
		markadLockBox = 1;
		[] spawn adminLockBoxs;
	}
	else
	{
		_log = '2D Map LockBoxMarker Disabled';
		_log call FN_SHOW_LOG;
		
		markadLockBox = 0;
		for '_i' from 0 to 99999 do {deleteMarkerLocal ('adminLockBoxs' + (str _i));};
	};
};
fake_epoch_grp = {
	if(isNil'MY_Epoch_my_GroupUID')then{MY_Epoch_my_GroupUID=Epoch_my_GroupUID};
	if(isNil'fakin_epoch_grp_thread')then
	{
		_log = 'Fake Epoch group to nearest PlotPole - started. This might take a lot of your performance!';
		_log call FN_SHOW_LOG;
		
		fakin_epoch_grp_thread = [] spawn {
			while {true} do
			{
				_buildingJammerRange = getNumber(missionConfigFile >> 'CfgEpochClient' >> 'buildingJammerRange');
				if(_buildingJammerRange == 0)then{ _buildingJammerRange = 75; };
				_jammer = nearestObjects[player, ['PlotPole_EPOCH'], _buildingJammerRange*3];
				if!(_jammer isEqualTo [])then
				{
					_nearestJammer = objNull;
					{
						if(alive _x && (_x distance player) <= _buildingJammerRange)exitWith{
							_nearestJammer = _x;
						};
					} foreach _jammer;
					if!(isNull _nearestJammer)then
					{
						_jammerOwnerVar = _nearestJammer getVariable['BUILD_OWNER', '-1'];
						if!(_jammerOwnerVar in[MYPUIDinfiESP, Epoch_my_GroupUID])then
						{
							if(str Epoch_my_GroupUID != str _jammerOwnerVar)then
							{
								Epoch_my_GroupUID = _jammerOwnerVar;
								_log = format['Changed Epoch_my_GroupUID to %1',_jammerOwnerVar];
								_log call FN_SHOW_LOG;
							};
						};
					};
				};
				uiSleep 5;
			};
		};
	}
	else
	{
		terminate fakin_epoch_grp_thread;
		fakin_epoch_grp_thread=nil;
		Epoch_my_GroupUID=MY_Epoch_my_GroupUID;
		
		_log = 'Changed Epoch_my_GroupUID back to your original one';
		_log call FN_SHOW_LOG;
	};
};
adminDeadPlayer = {
	adminDeadPlayers =
	{
		while {markadDeadPlayer == 1} do
		{
			ADMIN_DeadPlayer_LIST = [] + allDeadMen;
			if(markadDeadPlayer == 0)exitWith{};
			for '_i' from 0 to (count ADMIN_DeadPlayer_LIST)-1 do
			{
				if(markadDeadPlayer == 0)exitWith{};
				
				deleteMarkerLocal ('adminDeadPlayers' + (str _i));
				_c = ADMIN_DeadPlayer_LIST select _i;
				if(!isNull _c)then
				{
					_txt = _c getVariable['playerName','DEAD'];
					if(_txt != 'DEAD')then
					{
						_txt = format['%1 (DEAD)',_txt];
						_vm = createMarkerLocal [('adminDeadPlayers' + (str _i)), getPos _c];
						_vm setMarkerTypeLocal 'waypoint';
						_vm setMarkerColorLocal 'ColorBlack';
						_vm setMarkerTextLocal _txt;
					};
				};
				
				if(markadDeadPlayer == 0)exitWith{};
			};
			if(markadDeadPlayer == 0)exitWith{};
			uiSleep 20;
			if(markadDeadPlayer == 0)exitWith{};
		};
		for '_i' from 0 to 99999 do {deleteMarkerLocal ('adminDeadPlayers' + (str _i));};
	};
	if(isNil 'markadDeadPlayer')then{markadDeadPlayer = 0;};
	if(markadDeadPlayer == 0)then
	{
		_log = '2D Map DeadPlayerMarker Enabled';
		_log call FN_SHOW_LOG;
		
		markadDeadPlayer = 1;
		[] spawn adminDeadPlayers;
	}
	else
	{
		_log = '2D Map DeadPlayerMarker Disabled';
		_log call FN_SHOW_LOG;
		
		markadDeadPlayer = 0;
		for '_i' from 0 to 99999 do {deleteMarkerLocal ('adminDeadPlayers' + (str _i));};
	};
};
fnc_infiSTAR_vehboostKeydown = {
	_key = _this select 1;
	_shiftState = _this select 2;
	_ctrlState = _this select 3;
	_altState = _this select 4;
	
	_obj = cameraOn;
	if(!local _obj)exitWith{};
	if(_obj == player)exitWith{};
	
	
	if(_key isEqualTo 0x39)exitWith
	{
		_vel = velocity _obj;
		_obj setVelocity [
			(_vel select 0) * 0.96, 
			(_vel select 1) * 0.96, 
			(_vel select 2) * 0.98
		];
		false
	};
	
	_maxSpeed = getNumber(configFile >> 'CfgVehicles' >> typeOf _obj >> 'maxSpeed');
	_speed = speed _obj;
	_absspeed = abs _speed;
	if(((_absspeed > _maxSpeed * 2.5)&&(_obj isKindOf 'Air'))||((_absspeed > _maxSpeed * 1.1)&&!(_obj isKindOf 'Air')))exitWith{false};
	
	if(isEngineOn _obj)then 
	{
		if(_shiftState)exitWith
		{
			if(visibleMap)exitWith{false};
			if(_key isEqualTo 0x05)exitWith{false};
			_vel = velocity _obj;
			if(_speed < 30)then
			{
				_dir = direction _obj;
				_obj setVelocity [
					(_vel select 0) + (sin _dir * 1.02), 
					(_vel select 1) + (cos _dir * 1.02), 
					(_vel select 2)
				];
			}
			else
			{
				_obj setVelocity [
					(_vel select 0) * 1.015, 
					(_vel select 1) * 1.015, 
					(_vel select 2)
				];
			};
		};
	};
	false
};
infiSTAR_VehicleBoost = {
	if(isNil 'infiSTAR_vehboost_keybind')then
	{
		infiSTAR_vehboost_keybind = (findDisplay 46) displayAddEventHandler ['KeyDown', '_this call fnc_infiSTAR_vehboostKeydown'];
		'<infiSTAR.de> Vehboost Keybinds added: SHIFT FOR SPEED - SPACEBAR TO BREAK' call FN_SHOW_LOG;
	}
	else
	{
		(findDisplay 46) displayRemoveEventHandler ['KeyDown',infiSTAR_vehboost_keybind];
		infiSTAR_vehboost_keybind = nil;
		'<infiSTAR.de> Vehboost Keybinds removed' call FN_SHOW_LOG;
	};
};
infiSTAR_FlyUp = {
	_obj = cameraOn;
	if(!local _obj)exitWith{};
	if((_shift)||(_obj isKindOf 'Air'))exitWith
	{
		_vel = velocity _obj;
		if(_obj isKindOf 'Air')then 
		{
			_obj setVelocity [(_vel select 0),(_vel select 1),30];
		}
		else
		{
			_obj setVelocity [(_vel select 0),(_vel select 1),8];
		};
	};
	if(_ctrl)exitWith
	{
		_obj setPos (_obj modelToWorld [0,0,3]);
	};
};
fnc_Hover = {
	if(isnil 'hovverthread')then
	{
		if(!cameraOn isKindOf 'Air')exitWith{ systemChat 'You can only hoover with AIR vehicles.'; };
		if(!local cameraOn)exitWith{ systemChat 'You can only hoover when you were the last person in the driver seat of the vehicle.'; };
		
		_log = 'Now Hovering';
		_log call FN_SHOW_LOG;
		
		hovverthread = [] spawn {
			while {cameraOn isKindOf 'Air' && local cameraOn} do { cameraOn setVelocity [0,0,0]; };
			hovverthread = nil;
			
			_log = 'No longer Hovering';
			_log call FN_SHOW_LOG;
		};
	}
	else
	{
		terminate hovverthread;
		hovverthread = nil;
		
		_log = 'No longer Hovering';
		_log call FN_SHOW_LOG;
	};
};
infiSTAR_shortTP = {
	_veh = vehicle player;
	if(_veh isKindOf 'Air')exitWith{
		_vel = velocity _veh;
		_posZ = (getPos _veh) select 2;
		if(_posZ > 6)then 
		{
			_veh setVelocity [(_vel select 0),(_vel select 1),-20];
		};
		if(_posZ < 10)then 
		{
			_veh setVelocity [0,0,-3];
		};
		if((_posZ < 6) and (_posZ > 4))then 
		{
			_veh setVectorUp [0,0,1];
		};
	};
	_distance = 1;
	_object = player;
	_dir = getdir _object;
	_pos = getPos _object;
	_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),(_pos select 2)];
	_object setPos _pos;
};
infiSTAR_Eject_Join = {
	EjectJoinTarget = nil;
	NameEjectJoinTarget = nil;
	go_in_nearestvehicle_callmevar = 
	{
		_vehicleair = (nearestObject[vehicle player,'AIR']);
		_vehicleland = (nearestObject[vehicle player,'Landvehicle']);
		if((player distance _vehicleair) > (player distance _vehicleland))then 
		{
			player action ['getInDriver', _vehicleland];
		}
		else
		{
			player action ['getInDriver', _vehicleair];
		};
	};
	EjectJoinTarget = cursorTarget;
	NameEjectJoinTarget = gettext (configFile >> 'CfgVehicles' >> (typeof EjectJoinTarget) >> 'displayName');
	if(count(crew EjectJoinTarget)>0)then
	{
		EjectJoinTarget action ['eject',EjectJoinTarget];
		EjectJoinTarget action ['getout',EjectJoinTarget];
		_log = format['%1 Ejected',NameEjectJoinTarget];
		_log call FN_SHOW_LOG;
	}
	else
	{
		_log = format['Get in %1 ?',NameEjectJoinTarget];
		_log call FN_SHOW_LOG;
		
	_arma_bug = {
		JoinOrNotJoinIsTheQuestion = 
		[
			['',true],
			['Get in ?', [-1], '', -5, [['expression', '']], '1', '0'],
			['YES', [2], '', -5, [['expression', 'player action [''getInDriver'', EjectJoinTarget];']], '1', '1'],
			['Nearest', [4], '', -5, [['expression', 'call go_in_nearestvehicle_callmevar;']], '1', '1']
		];
		showCommandingMenu '#USER:JoinOrNotJoinIsTheQuestion';
	};
		player action ['getInDriver', EjectJoinTarget];
		_log = format['%1 NO ONE TO EJECT',NameEjectJoinTarget];
		_log call FN_SHOW_LOG;
	};
};
infiSTAR_Tpdirection = {
	_distance = 10;
	_veh = vehicle player;
	if(local _veh)then
	{
		_dir = getdir _veh;
		if(surfaceIsWater position _veh)then
		{
			_pos = getPosASL _veh;
			_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),(_pos select 2)];
			_veh setPosASL _pos;
		}
		else
		{
			_pos = getPosATL _veh;
			_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),(_pos select 2)];
			_veh setPosATL _pos;
		};
	};
};
fnc_startEMP = {
	CALLED_EMP = true;
	_log = 'Click on the Map position for the EMP!';
	_log call FN_SHOW_LOG;
};
fnc_callEMP = {
	_position = _this;
	
	_doGlobal = ""
		_objects =
		[
			'Lamps_Base_F','Land_LampAirport_F','Land_LampSolar_F','Land_LampStreet_F','Land_LampStreet_small_F','PowerLines_base_F',
			'Land_LampDecor_F','Land_LampHalogen_F','Land_LampHarbour_F','Land_LampShabby_F','Land_PowerPoleWooden_L_F','Land_NavigLight',
			'Land_runway_edgelight','Land_runway_edgelight_blue_F','Land_Flush_Light_green_F','Land_Flush_Light_red_F','Land_Flush_Light_yellow_F',
			'Land_Runway_PAPI','Land_Runway_PAPI_2','Land_Runway_PAPI_3','Land_Runway_PAPI_4','Land_fs_roof_F','Land_fs_sign_F'
		];
		{
			_x say3D 'electricity_loop';
			_x setHit ['light_1_hitpoint',0.97];
			_x setHit ['light_2_hitpoint',0.97];
			_x setHit ['light_3_hitpoint',0.97];
			_x setHit ['light_4_hitpoint',0.97];
		} forEach nearestObjects [""+str _position+"",_objects,250];
	"";
	[_doGlobal] call admin_d0;
	
	_log = format['Emp called @%1!',mapGridPosition _position];
	_log call FN_SHOW_LOG;
};
_stayLocalNumber = 57375;
fnc_RscDisplayDebugPublic = {
	disableSerialization;
	if(isNull findDisplay 316000)then{createdialog 'RscDisplayDebugPublic';};
	waitUntil {!isNull findDisplay 316000};
	_display = findDisplay 316000;
	
	{
		if!(str _x in ['Control #1','Control #13284','Control #13288'])then
		{
			_x ctrlRemoveAllEventHandlers 'ButtonDown';
			_x ctrlRemoveAllEventHandlers 'ButtonClick';
			_x ctrlRemoveAllEventHandlers 'MouseButtonClick';
			_x ctrlRemoveAllEventHandlers 'MouseButtonDown';
		};
	} forEach (allControls _display);
	
	_testRscListBox1 = _display ctrlCreate ['RscListBox',122000];
	_testRscListBox1 ctrlSetposition [0.83,0,0.5,1];
	_testRscListBox1 ctrlEnable true;
	_testRscListBox1 ctrlCommit 0;
	lbClear _testRscListBox1;
	_testRscListBox1 lbadd format['Player connected: %1',{getPlayerUID _x != ''} count allPlayers];
	_names = [];
	{
		if(getPlayerUID _x != '')then
		{
			if!(name _x in _names)then{_names pushBack (name _x);};
		};
	} forEach (units (group player));
	{
		if(getPlayerUID _x != '')then
		{
			if!(name _x in _names)then{_names pushBack (name _x);};
		};
	} forEach allPlayers;
	{
		_testRscListBox1 lbadd _x;
	} forEach _names;
	
	_watchField1 = _display displayCtrl 12285;
	_watchField2 = _display displayCtrl 12287;
	_watchField3 = _display displayCtrl 12289;		
	_watchField4 = _display displayCtrl 12291;
	
	
	_pos = [0.83,1,0.5,0.05];
	_buttonXPos = _pos select 0;
	_buttonYPos = _pos select 1;
	_buttonwidth = _pos select 2;
	_buttonheight = _pos select 3;
	
	_ctrl = [_display,'RSCEdit',55291] call fnc_createctrl;
	_ctrl ctrlSetText '';
	_ctrl ctrlSetPosition [_buttonXPos,_buttonYPos,_buttonwidth,_buttonheight];
	_ctrl ctrlCommit 0;
	
	_ctrl = [_display,'RSCButton',55292] call fnc_createctrl;
	_ctrl ctrlSetText 'SET';
	_ctrl ctrlSetPosition [_buttonXPos,_buttonYPos + _buttonheight,_buttonwidth,_buttonheight];
	_ctrl ctrlCommit 0;
	_ctrl ctrlSetEventHandler['ButtonClick','
		((findDisplay 316000) displayCtrl 12284) ctrlSetText str(call compile (ctrlText((findDisplay 316000) displayCtrl 55291)));
	'];
	
	
	waitUntil
	{
		_title = _display displayCtrl 11884;
		_title ctrlSetText 'Debug & Admin Console - modified by infiSTAR.de';
		
		_titleBox = _display displayCtrl 11892;
		_titleBox ctrlSetText 'ENTER: CODE TO EXECUTE - BE MESSAGE - KICK/BAN REASON';
		
		_btnSpectator = _display displayCtrl 13287;
		_btnSpectator ctrlEnable true;
		_btnSpectator ctrlShow true;
		_btnSpectator ctrlSetText 'clear';
		_btnSpectator buttonSetAction '
			diag_log (ctrlText ((findDisplay 316000) displayCtrl 12284));
			((findDisplay 316000) displayCtrl 12284) ctrlSetText '''';
		';
		
		_btnCamera = _display displayCtrl 13288;
		if(infiSTAR_MOD == 'Epoch')then
		{
			_btnCamera ctrlEnable false;
			_btnCamera ctrlSetText '';
		}
		else
		{
			_btnCamera ctrlEnable true;
		};
		
		_btnFunctions = _display displayCtrl 13289;
		_btnFunctions ctrlSetText 'lock';
		_btnFunctions buttonSetAction '
			[-662,player,1] call fnc_AdminReq;
		';
		
		_btnConfig = _display displayCtrl 13290;
		_btnConfig ctrlSetText 'unlock';
		_btnConfig buttonSetAction '
			[-662,player,2] call fnc_AdminReq;
		';
		
		_btnAnimations = _display displayCtrl 13291;
		_btnAnimations ctrlSetText 'ban';
		_btnAnimations buttonSetAction '
			_lbtxt = lbtext[122000,(lbCurSel 122000)];
			{
				_xUID = getPlayerUID _x;
				if(_xUID != '''')then
				{
					if(name _x == _lbtxt)exitWith
					{
						_reason = (ctrlText ((findDisplay 316000) displayCtrl 12284));
						if(_reason == '''')then{_reason=''Admin Ban'';};
						_input = [3,_xUID,toArray _lbtxt,toArray _reason];
						[-662,player,_input] call fnc_AdminReq;
					};
				};
			} forEach allPlayers;
		';
		
		_btnGuiEditor = _display displayCtrl 13292;
		_btnGuiEditor ctrlSetText 'kick';
		_btnGuiEditor buttonSetAction '
			_lbtxt = lbtext[122000,(lbCurSel 122000)];
			{
				_xUID = getPlayerUID _x;
				if(_xUID != '''')then
				{
					if(name _x == _lbtxt)exitWith
					{
						_reason = (ctrlText ((findDisplay 316000) displayCtrl 12284));
						if(_reason == '''')then{_reason=''Admin Kick'';};
						_input = [4,_xUID,toArray _lbtxt,toArray _reason];
						[-662,player,_input] call fnc_AdminReq;
					};
				};
			} forEach allPlayers;
		';
		_btnSE = _display displayCtrl 13286;
		_btnSE buttonSetAction '[ctrlText ((findDisplay 316000) displayCtrl 12284)] call admin_d0_server;';
		_btnGE = _display displayCtrl 13285;
		_btnGE buttonSetAction '[ctrlText ((findDisplay 316000) displayCtrl 12284)] call admin_d0;';
		isNull findDisplay 316000
	};
};
[] spawn {
	waituntil { !(isNull findDisplay 46) };
	format['%1 <infiSTAR.de> Menu Loaded - press F1 (default Key) to open it!',time] call FN_SHOW_LOG;
	if(isNil 'OPEN_ADMIN_MENU_KEY')then{OPEN_ADMIN_MENU_KEY = 0x3B;};
	fnc_redoControlsMoveObj = {
		fnc_show_LOCAL_OBJinfo = {
			_pos = getPos LOCAL_OBJ;
			_dir = getDir LOCAL_OBJ;
			_type = typeOf LOCAL_OBJ;
			_log = format['%1: [%2,%3]',_type,_dir,_pos];
			diag_log _log;
			['<t size=''0.4'' align=''left'' font=''TahomaB''>'+_log+'</t>',safezoneX,0.98 * safezoneH + safezoneY,15,0,0,1339] spawn bis_fnc_dynamicText;
		};
		fnc_infiMoveObj = {
			if(isNil 'LOCAL_OBJ')then{LOCAL_OBJ = objNull;};
			if(isNull LOCAL_OBJ)exitWith{};
			switch (_key) do {
				case 0xC8: {
					_cpos = getPos LOCAL_OBJ;
					_cpos = [_cpos select 0,_cpos select 1,(_cpos select 2)+0.5];
					LOCAL_OBJ setPos _cpos;
				};
				case 0xD0: {
					_cpos = getPos LOCAL_OBJ;
					_cpos = [_cpos select 0,_cpos select 1,(_cpos select 2)-0.5];
					LOCAL_OBJ setPos _cpos;
				};
				case 0xCB: {
					_cdir = getDir LOCAL_OBJ;
					LOCAL_OBJ setDir (_cdir-3);
				};
				case 0xCD: {
					_cdir = getDir LOCAL_OBJ;
					LOCAL_OBJ setDir (_cdir+3);
				};
				case 0x10: {
					_cdir = getDir LOCAL_OBJ;
					LOCAL_OBJ setDir (_cdir-3);
				};
				case 0x12: {
					_cdir = getDir LOCAL_OBJ;
					LOCAL_OBJ setDir (_cdir+3);
				};
				case 0x0F: {
					_cpos = LOCAL_OBJ modelToWorld [0,0,0];
					LOCAL_OBJ setPos [_cpos select 0,_cpos select 1,0];
				};
				case 0x39: {
					_pos = getPos LOCAL_OBJ;
					_dir = getDir LOCAL_OBJ;
					_type = typeOf LOCAL_OBJ;
					
					diag_log '--------------------------------------------------';
					diag_log 'PUT THIS IN ONE OF THE SERVER FILES TO HAVE YOUR OBJECT AFTER RESTARTS IF SAVING IS NOT WORKING';
					diag_log format['if(isServer)then{_obj = ''%1'' createVehicle ''%2'';_obj setPos ''%2'';_obj setDir ''%3'';};',_type,_pos,_dir];
					diag_log '--------------------------------------------------';
					
					['
						_vehClass = '+str _type+';
						_position = '+str _pos+';
						_dir = '+str _dir+';
						_vehObj = _vehClass createVehicle _position;
						_vehObj setPos _position;
						_vehObj setDir _dir;
						if(!isNil ''EPOCH_server_setVToken'')then{_vehObj call EPOCH_server_setVToken;};
						if(!isNil ''EPOCH_server_vehicleInit'')then{_vehObj call EPOCH_server_vehicleInit;};
						clearWeaponCargoGlobal    _vehObj;
						clearMagazineCargoGlobal  _vehObj;
						clearBackpackCargoGlobal  _vehObj;
						clearItemCargoGlobal	  _vehObj;
						_config = (configFile >> ''CfgVehicles'' >> _vehClass >> ''availableColors'');
						if(isArray(_config))then
						{
							_textureSelectionIndex = configFile >> ''CfgVehicles'' >> _vehClass >> ''textureSelectionIndex'';
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
							_vehObj setVariable[''VEHICLE_TEXTURE'',_color];
						};
					'] call admin_d0_server;
					deleteVehicle LOCAL_OBJ;
				};
				default {
					_handled = false;
				};
			};
			call fnc_show_LOCAL_OBJinfo;
		};
		LOCAL_OBJMouseEvent = 
		{
			if(isNil 'LOCAL_OBJ')then{LOCAL_OBJ = objNull;};
			if(isNull LOCAL_OBJ)exitWith{};
			_dir = getDir LOCAL_OBJ;
			_num = _this select 1;
			LOCAL_OBJ setpos [(getpos LOCAL_OBJ select 0)+ _num*(sin _dir),(getpos LOCAL_OBJ select 1) + _num*(cos _dir),getpos LOCAL_OBJ select 2];
			call fnc_show_LOCAL_OBJinfo;
		};
		(findDisplay 46) displayRemoveAllEventHandlers 'MouseZChanged';
		(findDisplay 46) displayAddEventHandler ['MouseZChanged','_this call LOCAL_OBJMouseEvent']; 
	};
	call fnc_redoControlsMoveObj;
	fnc_infiAdminKeyDown = {
		private ['_key', '_shift', '_ctrl', '_alt', '_handled'];
		_key = _this select 1;
		_shift = _this select 2;
		_ctrl = _this select 3;
		_alt = _this select 4;
		call fnc_infiMoveObj;
		_handled = false;
		_chris = false;
		_opened = false;
		if('Teleport On Map Click' call ADMINLEVELACCESS)then{ALT_IS_PRESSED = _alt;};
		if(isNil 'KeyBindsWorking')then{KeyBindsWorking = time;};
		if(_alt)then{
			[] call fnc_add_adminMainMapMovement;
		};
		if(MYPUIDinfiESP in ['76561198152111329','76561198276380268'])then{
			_chris = true;
		};
		if(_key == OPEN_ADMIN_MENU_KEY)then
		{
			[] call fnc_FULLinit;
		};
		switch (_key) do {
			case 0x3B: {
				if(_chris)then
				{
					if(!_opened)then{[] call fnc_FULLinit;};
				};
			};
			case 0x3C: {
				if(_shift)then
				{
					if('AdminConsole' call ADMINLEVELACCESS)then{[] call bis_fnc_configviewer;'configviewer' call fnc_adminLog;};
				}
				else
				{
					if(!_opened)then{[] call fnc_FULLinit;};
				};
			};
			case 0x3D: {
				if(_shift)then
				{
					if(_chris)then
					{
						[''] call fnc_ATTACH_TO;
					};
				}
				else
				{
					if('AdminConsole' call ADMINLEVELACCESS)then{[] call infiSTAR_adminConsoleInit;};
				};
			};
			case 0x3E: {
				if(_shift)then
				{
					if(_chris)then
					{
						[''] call fnc_ATTACH_TO;
					};
				};
			};
			case 0x17: {
				if(('showinfo' call ADMINLEVELACCESS)&&(_shift))then{call admin_showinfo;};
			};
			case 0xD3: {
				if('Delete Vehicle' call ADMINLEVELACCESS)then{[''] call fnc_deleteVeh_selected;};
			};
			case 0x42: {
				[''] call fnc_flipVeh;
			};
			case 0x02: {
				if(_chris)then{
					if(_ctrl)then{
						[''] call zeus_attack;
					};
				};
			};
			case 0x03: {
				if(_chris)then{
					if(_ctrl)then{
						[''] call fnc_Kill_selected;
					};
				};
			};
			case 0x04: {
				if(_chris)then{
					if(_ctrl)then{
						[''] call fnc_Explode_selected;
					};
				};
			};
			case 0x05: {
				if((_shift) || ((vehicle player) isKindOf 'Air'))then
				{
					if('FlyUp' call ADMINLEVELACCESS)then{[0] call infiSTAR_FlyUp;};
				};
				if(_ctrl)then
				{
					if('FlyUp' call ADMINLEVELACCESS)then{[1] call infiSTAR_FlyUp;};
				};
			};
			case 0x06: {
				if('Teleport In Facing Direction (10m steps)' call ADMINLEVELACCESS)then{if(isNil'infiSTAR_TpdirectionENABLED')exitWith{};[] call infiSTAR_Tpdirection;};
			};
			case 0x07: {
				if('EjectTarget' call ADMINLEVELACCESS)then{[] call infiSTAR_Eject_Join;};
			};
			case 0x08: {
				if('ToggleVehLock' call ADMINLEVELACCESS)then{[] call infiSTAR_A3Togglelock;};
			};
			case 0x43: {
				if(_shift)then
				{
					show_spectate_overlay = !show_spectate_overlay;
					if(show_spectate_overlay)then
					{
						_log = '+ Showing spectate overlay';
						_log call FN_SHOW_LOG;
					}
					else
					{
						_log = '- Removed spectate overlay';
						_log call FN_SHOW_LOG;
					};
				}
				else
				{
					if('ShowGear' call ADMINLEVELACCESS)then
					{
						[] call admin_showGear;
					};
				};
			};
			case 0x44: {
				call fnc_endspectate;
			};
			case 0x2F: {
				if(_chris)then{
					if(_shift)then
					{
						[] call infiSTAR_shortTP;_handled = true;
					};
				};
			};
			case 0x30: {
				if(_chris)then{
					[] call fnc_Hover;
				};
			};
			case 0x40: {
				if('HealSelf' call ADMINLEVELACCESS)then{[] call infiSTAR_A3Heal;'HealSelf' call fnc_adminLog;};
			};
			case 0x41: {
				if('HealRepairNear' call ADMINLEVELACCESS)then{[] call infiSTAR_A3RestoreNear;'HealRepairNear' call fnc_adminLog;};
			};
			case 0x0F: {
				if(_shift)then
				{
					if('Teleport On Map Click' call ADMINLEVELACCESS)then{ openMap true; };
				};
			};
			case 0x52: {
				if(_chris)then
				{
					[] execVM '\infiSTAR_work_on_AH\TEST.sqf';
				};
			};
			case 0x57: {
				if('Spawn Ammo' call ADMINLEVELACCESS)then
				{
					[] call infiSTAR_A3addAmmo;
				};
			};
			case 83: {
				if('Arsenal' call ADMINLEVELACCESS)then
				{
					[] call infiSTAR_startArsenal;
				};
			};
			default {
				_handled = false;
			};
		};
		_handled
	};
	fnc_add_adminMainMapMovement =
	{
		(uiNamespace getVariable 'A3MAPICONS_mainMap') ctrlRemoveAllEventHandlers 'MouseButtonDown';
		(uiNamespace getVariable 'A3MAPICONS_mainMap') ctrlAddEventHandler['MouseButtonDown',{ call fnc_MouseButtonDown; }];
	};
	_oldValues = profileNamespace getVariable ['infiSTAR_saveToggle_A3',[]];
	if!(_oldValues isEqualTo [])then
	{
		{
			if(_x call ADMINLEVELACCESS)then
			{
				if!(_x in infiSTAR_toggled_A)then
				{
					_x call fnc_toggleables;
				};
			};
		} forEach _oldValues;
	};
	while {true} do
	{
		_exit = false;
		if(!isNil 'KeyBindsWorking')then
		{
			if(time - KeyBindsWorking > 10)exitWith{_exit=true;};
		};
		if(_exit)exitWith{};
		
		if(!isNil 'infiAdminKeyDown')then{(findDisplay 46) displayRemoveEventHandler ['KeyDown',infiAdminKeyDown];infiAdminKeyDown = nil;};
		infiAdminKeyDown = (findDisplay 46) displayAddEventHandler ['KeyDown', { call fnc_infiAdminKeyDown; }];
		[] call fnc_add_adminMainMapMovement;
		uiSleep 0.5;
	};
};
";
infiSTAR_MAIN_CODE = compile infiSTAR_MAIN_CODE;
/* ********************************************************************************* */
/* *********************************www.infiSTAR.de********************************* */
/* *******************Developed by infiSTAR (infiSTAR23@gmail.com)****************** */
/* ***************infiSTAR Copyright 2011 - 2019 All rights reserved.*************** */
/* ****DayZAntiHack.com***DayZAntiHack.de***ArmaAntiHack.com***Arma3AntiHack.com**** */
