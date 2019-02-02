class Life_cell_phone {
    idd = 3000;
    name= "life_cell_phone";
    movingEnable = 0;
    enableSimulation = 1;
    onLoad = "[] spawn life_fnc_cellphone";

    class controlsBackground {
        class picTablet: Life_RscPicture
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
        class textEdit: Life_RscEdit
        {
        	idc = 3003;
        	x = 0.334959 * safezoneW + safezoneX;
        	y = 0.401 * safezoneH + safezoneY;
        	w = 0.330083 * safezoneW;
        	h = 0.154 * safezoneH;
        };
        class EMSRequest: Life_RscButtonMenu
        {
        	idc = 3022;
        	text = "NHS"; //--- ToDo: Localize;
        	onButtonClick = "[] call TON_fnc_cell_emsrequest";
        	x = 0.345274 * safezoneW + safezoneX;
        	y = 0.599 * safezoneH + safezoneY;
        	w = 0.0825207 * safezoneW;
        	h = 0.022 * safezoneH;
        	colorBackground[] = {0.075,0.749,0.208,1};
        };
        class TextCopButton: Life_RscButtonMenu
        {
        	idc = 3016;
        	text = "Police"; //--- ToDo: Localize;
        	onButtonClick = "[] call TON_fnc_cell_textcop";
        	x = 0.45874 * safezoneW + safezoneX;
        	y = 0.599 * safezoneH + safezoneY;
        	w = 0.0825207 * safezoneW;
        	h = 0.022 * safezoneH;
        	colorBackground[] = {0.078,0.129,0.529,1};
        };
        class TextAdminButton: Life_RscButtonMenu
        {
        	idc = 3017;
        	text = "Admin"; //--- ToDo: Localize;
        	onButtonClick = "[] call TON_fnc_cell_textadmin";
        	x = 0.572206 * safezoneW + safezoneX;
        	y = 0.599 * safezoneH + safezoneY;
        	w = 0.0825207 * safezoneW;
        	h = 0.022 * safezoneH;
        	colorBackground[] = {0.529,0.078,0.129,1};
        };
        class TextMsgButton: Life_RscButtonMenu
        {
        	idc = 3015;
        	text = "Send"; //--- ToDo: Localize;
        	onButtonClick = "[] call TON_fnc_cell_textmsg";
        	x = 0.45875 * safezoneW + safezoneX;
        	y = 0.56555556 * safezoneH + safezoneY;
        	w = 0.0825 * safezoneW;
        	h = 0.02222223 * safezoneH;
        };
        class PlayerList: Life_RscCombo
        {
        	idc = 3004;
        	x = 0.42 * safezoneW + safezoneX;
        	y = 0.36777778 * safezoneH + safezoneY;
        	w = 0.12375 * safezoneW;
        	h = 0.02222223 * safezoneH;
        };
        class txtMessage: Life_RscStructuredText
        {
        	idc = 1100;
        	text = "To:"; //--- ToDo: Localize;
        	x = 0.42 * safezoneW + safezoneX;
        	y = 0.346 * safezoneH + safezoneY;
        	w = 0.29398 * safezoneW;
        	h = 0.022 * safezoneH;
        	colorBackground[] = {-1,-1,-1,1};
        };
        class AdminMsgAllButton: Life_RscButtonMenu
        {
        	idc = 3021;
        	onButtonClick = "[] call TON_fnc_cell_adminmsgall";
        	text = "MSG All"; //--- ToDo: Localize;
        	x = 0.5725 * safezoneW + safezoneX;
        	y = 0.56555556 * safezoneH + safezoneY;
        	w = 0.0825 * safezoneW;
        	h = 0.02222223 * safezoneH;
        };
    };
};