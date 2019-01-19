class Life_key_management {
    idd = 2700;
    name= "life_key_chain";
    movingEnable = 0;
    enableSimulation = 1;
    onLoad = "[] spawn life_fnc_keyMenu;";

    class controlsBackground {
        class picTablet: life_RscPicture
        {
        	idc = 1200;
        	text = "tablet.paa";
        	x = 0.293698 * safezoneW + safezoneX;
        	y = 0.225 * safezoneH + safezoneY;
        	w = 0.412603 * safezoneW;
        	h = 0.55 * safezoneH;
        };
    };

    class controls {
        class Title: PMenu_RscStructuredText
        {
        	idc = 1000;
        	text = "Key Chain"; //--- ToDo: Localize;
        	x = 0.324644 * safezoneW + safezoneX;
        	y = 0.335 * safezoneH + safezoneY;
        	w = 0.345555 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {0,0,0,1};
        };
        class KeyChainList: Life_RscListBox
        {
        	idc = 2701;
        	sizeEx = 0.035;
        	x = 0.324644 * safezoneW + safezoneX;
        	y = 0.368 * safezoneH + safezoneY;
        	w = 0.345555 * safezoneW;
        	h = 0.209 * safezoneH;
        };
        class NearPlayers: Life_RscCombo
        {
        	idc = 2702;
        	x = 0.324644 * safezoneW + safezoneX;
        	y = 0.588 * safezoneH + safezoneY;
        	w = 0.345555 * safezoneW;
        	h = 0.022 * safezoneH;
        };
        class GiveKey: Pmenu_RscButtonMenu
        {
        	idc = 2703;
        	text = "Give"; //--- ToDo: Localize;
        	onButtonClick = "[] call life_fnc_keyGive";
        	x = 0.386534 * safezoneW + safezoneX;
        	y = 0.621 * safezoneH + safezoneY;
        	w = 0.0979933 * safezoneW;
        	h = 0.022 * safezoneH;
        	colorBackground[] = {-1,-1,-1,1};
        };
        class DropKey: Pmenu_RscButtonMenu
        {
        	idc = -1;
        	text = "Drop"; //--- ToDo: Localize;
        	onButtonClick = "[] call life_fnc_keyDrop";
        	x = 0.494842 * safezoneW + safezoneX;
        	y = 0.621 * safezoneH + safezoneY;
        	w = 0.0979933 * safezoneW;
        	h = 0.022 * safezoneH;
        	colorBackground[] = {-1,-1,-1,1};
        };
    };
};