#include "player_sys.sqf"

class playerSettings {
    idd = playersys_DIALOG;
    movingEnable = 1;
    enableSimulation = 1;

    class controlsBackground {
		class moneyStatusInfo: Life_RscStructuredText {
            idc = 2015;
            sizeEx = 0.020;
            text = "";
			x = 0.407164 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.139254 * safezoneW;
			h = 0.055 * safezoneH;
        };    
    };

    class controls {
		class PicTablet: life_RscPicture
		{
			idc = 1215;
			text = "textures\menu.paa";
			x = 0.293698 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.412603 * safezoneW;
			h = 0.55 * safezoneH;
		};
		class ButtonInventory: Life_RscButtonMenu
		{
			idc = 2400;
			x = 0.309171 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0722056 * safezoneW;
			h = 0.132 * safezoneH;
		};
		class ButtonMarket: Life_RscButtonMenu
		{
			idc = 2407;
			x = 0.309171 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0722056 * safezoneW;
			h = 0.132 * safezoneH;
		};
		class ButtonSync: Life_RscButtonMenu
		{
			idc = 2408;
			x = 0.309171 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.0722056 * safezoneW;
			h = 0.132 * safezoneH;
		};
		class ButtonPerks: Life_RscButtonMenu
		{
			idc = 2405;
			x = 0.386534 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0722056 * safezoneW;
			h = 0.132 * safezoneH;
		};
		class ButtonKeyChain: Life_RscButtonMenu
		{
			idc = 2401;
			x = 0.463897 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0722056 * safezoneW;
			h = 0.132 * safezoneH;
		};
		class ButtonGang: Life_RscButtonMenu
		{
			idc = 2406;
			x = 0.54126 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0722056 * safezoneW;
			h = 0.132 * safezoneH;
		};
		class ButtonMobile: Life_RscButtonMenu
		{
			idc = 2409;
			x = 0.618623 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0722056 * safezoneW;
			h = 0.132 * safezoneH;
		};
		class ButtonProfession: Life_RscButtonMenu
		{
			idc = 2402;
			x = 0.386534 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0722056 * safezoneW;
			h = 0.132 * safezoneH;
		};
		class ButtonTBA23: Life_RscButtonMenu
		{
			idc = 2403;
			x = 0.463897 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0722056 * safezoneW;
			h = 0.132 * safezoneH;
		};
		class ButtonTBA24: Life_RscButtonMenu
		{
			idc = 2404;
			x = 0.54126 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0722056 * safezoneW;
			h = 0.132 * safezoneH;
		};
		class ButtonSettings: Life_RscButtonMenu
		{
			idc = 2410;
			x = 0.618623 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0722056 * safezoneW;
			h = 0.132 * safezoneH;
		};
		class ButtonPNC: Life_RscButtonMenu
		{
			idc = 2411;
			x = 0.386534 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.0722056 * safezoneW;
			h = 0.132 * safezoneH;
		};
		class ButtonAdmin: Life_RscButtonMenu
		{
			idc = 2412;
			x = 0.463897 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.0722056 * safezoneW;
			h = 0.132 * safezoneH;
		};
		class ButtonTBA34: Life_RscButtonMenu
		{
			idc = 2413;
			x = 0.54126 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.0722056 * safezoneW;
			h = 0.132 * safezoneH;
		};
		class ButtonTBA35: Life_RscButtonMenu
		{
			idc = 2414;
			x = 0.618623 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.0722056 * safezoneW;
			h = 0.132 * safezoneH;
		};
		class PicInventory: life_RscPicture
		{
			idc = 1200;
			text = "textures\icons\inventory.paa";
			x = 0.319486 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.0515754 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class PicPerks: life_RscPicture
		{
			idc = 1201;
			text = "textures\icons\perks.paa";
			x = 0.396849 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.0515754 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class PicKeyChain: life_RscPicture
		{
			idc = 1202;
			text = "textures\icons\keychain.paa";
			x = 0.474212 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.0515754 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class PicGang: life_RscPicture
		{
			idc = 1203;
			text = "textures\icons\gang.paa";
			x = 0.551575 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.0515754 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class PicMobile: life_RscPicture
		{
			idc = 1204;
			text = "textures\icons\mobile.paa";
			x = 0.628939 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.0515754 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class PicMarket: life_RscPicture
		{
			idc = 1205;
			text = "textures\icons\market.paa";
			x = 0.319486 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.0515754 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class PicProfession: life_RscPicture
		{
			idc = 1206;
			text = "textures\icons\professions.paa";
			x = 0.396849 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.0515754 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class PicTBA24: life_RscPicture
		{
			idc = 1207;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.474212 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.0515754 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class PicSettings: life_RscPicture
		{
			idc = 1209;
			text = "textures\icons\settings.paa";
			x = 0.628939 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.0515754 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class PicSync: life_RscPicture
		{
			idc = 1210;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.319486 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0515754 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class PicPNC: life_RscPicture
		{
			idc = 1211;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.396849 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0515754 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class PicAdmin: life_RscPicture
		{
			idc = 1212;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.474212 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0515754 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class PicTBA34: life_RscPicture
		{
			idc = 1213;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.551575 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0515754 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class PicTBA35: life_RscPicture
		{
			idc = 1214;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.628939 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0515754 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class txtInventory: Life_RscStructuredText
		{
			idc = 1100;
			text = "$STR_PM_Inventory"; //--- ToDo: Localize;
			x = 0.324644 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.0412603 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			sizeEx = 1 * GUI_GRID_H;
		};
		class txtPerks: Life_RscStructuredText
		{
			idc = 1101;
			text = "$STR_PM_Perks"; //--- ToDo: Localize;
			x = 0.402007 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.0412603 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			sizeEx = 1 * GUI_GRID_H;
		};
		class txtKeyChain: Life_RscStructuredText
		{
			idc = 1102;
			text = "$STR_PM_KeyChain";
			x = 0.47937 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.0412603 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			sizeEx = 1 * GUI_GRID_H;
		};
		class txtGang: Life_RscStructuredText
		{
			idc = 1103;
			text = "$STR_PM_Gang"; //--- ToDo: Localize;
			x = 0.556733 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.0412603 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			sizeEx = 1 * GUI_GRID_H;
		};
		class txtMobile: Life_RscStructuredText
		{
			idc = 1104;
			text = "$STR_PM_Mobile"; //--- ToDo: Localize;
			x = 0.634096 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.0412603 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			sizeEx = 1 * GUI_GRID_H;
		};
		class txtMarket: Life_RscStructuredText
		{
			idc = 1105;
			text = "$STR_PM_Market"; //--- ToDo: Localize;
			x = 0.324644 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0412603 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			sizeEx = 1 * GUI_GRID_H;
		};
		class txtProfession: Life_RscStructuredText
		{
			idc = 1106;
			text = "$STR_PM_Profession"; //--- ToDo: Localize;
			x = 0.402007 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0412603 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			sizeEx = 1 * GUI_GRID_H;
		};
		class txtTBA23: Life_RscStructuredText
		{
			idc = 1107;
			text = "TBA2-3"; //--- ToDo: Localize;
			x = 0.47937 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0412603 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			sizeEx = 1 * GUI_GRID_H;
		};
		class txtTBA24: Life_RscStructuredText
		{
			idc = 1108;
			text = "TBA2-4"; //--- ToDo: Localize;
			x = 0.556733 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0412603 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			sizeEx = 1 * GUI_GRID_H;
		};
		class txtSettings: Life_RscStructuredText
		{
			idc = 1109;
			text = "$STR_PM_Settings"; //--- ToDo: Localize;
			x = 0.634096 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0412603 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			sizeEx = 1 * GUI_GRID_H;
		};
		class txtTBA35: Life_RscStructuredText
		{
			idc = 1110;
			text = "TBA3-5"; //--- ToDo: Localize;
			x = 0.634096 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.0412603 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			sizeEx = 1 * GUI_GRID_H;
		};
		class txtTBA34: Life_RscStructuredText
		{
			idc = 1111;
			text = "TBA3-4"; //--- ToDo: Localize;
			x = 0.556733 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.0412603 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			sizeEx = 1 * GUI_GRID_H;
		};
		class txtAdmin: Life_RscStructuredText
		{
			idc = 1112;
			text = "$STR_PM_Admin"; //--- ToDo: Localize;
			x = 0.47937 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.0412603 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			sizeEx = 1 * GUI_GRID_H;
		};
		class txtPNC: Life_RscStructuredText
		{
			idc = 1113;
			text = "$STR_PM_PNC"; //--- ToDo: Localize;
			x = 0.402007 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.0412603 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			sizeEx = 1 * GUI_GRID_H;
		};
		class txtSync: Life_RscStructuredText
		{
			idc = 1114;
			text = "$STR_PM_SyncData"; //--- ToDo: Localize;
			x = 0.324644 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.0412603 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			sizeEx = 1 * GUI_GRID_H;
		};
		class moneyStatusInfo: Life_RscStructuredText
		{
			idc = 2015;
            sizeEx = 0.020;
            text = "";
			x = 0.407164 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.139254 * safezoneW;
			h = 0.055 * safezoneH;
		};
    };
};
