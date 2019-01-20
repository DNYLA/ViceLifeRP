/*
*    FORMAT:
*        STRING (Conditions) - Must return boolean :
*            String can contain any amount of conditions, aslong as the entire
*            string returns a boolean. This allows you to check any levels, licenses etc,
*            in any combination. For example:
*                "call life_coplevel && license_civ_someLicense"
*            This will also let you call any other function.
*            
*
*    ARRAY FORMAT:
*        0: STRING (Classname): Item Classname
*        1: STRING (Nickname): Nickname that will appear purely in the shop dialog
*        2: SCALAR (Buy price)
*        3: SCALAR (Sell price): To disable selling, this should be -1
*        4: STRING (Conditions): Same as above conditions string
*
*    Weapon classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Weapons
*    Item classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Items
*
*/
class WeaponShops {
    //Armory Shops
    class gun {
        name = "Gun Store";
        side = "civ";
        conditions = "license_civ_gun";
        items[] = {
            { "hgun_Rook40_F", "", 25000, 12500, "" },  //rook
			{ "hgun_Pistol_heavy_02_F", "", 30000, 12500, "" },  //zubr
			{ "hgun_Pistol_heavy_01_F", "", 35000, 12500, "" },  //4-five
			{ "hgun_PDW2000_F", "", 40000, 10000, "" },  //pdw
			{ "arifle_SDAR_F", "", 45000, 10000, "" },  //sdar
			{ "SMG_01_F", "", 60000, 10000, "" },  //vermin 
			{ "SMG_02_F", "", 65000, 10000, "" },  //sting
			{ "arifle_TRG20_F", "", 70000, 12500, "" },  //TRG20
			{ "arifle_TRG21_F", "", 75000, 12500, "" },  //TRG21
			{ "arifle_Mk20_F", "", 90000, 12500, "" },  //Mk20
			{ "arifle_SPAR_01_blk_F", "", 100000, 16500, "" }, //spar Apex DLC
			{ "FirstAidKit", "", 200, 110},
			{ "Medikit", "", 5000, 110},
			{ "ToolKit", "", 5000, 110},
			{ "ItemGPS", "", 100, 110},
			{ "ItemMap", "", 100, 110},
			{ "ItemRadio", "", 100, 110},
			{ "ItemCompass", "", 100, 110},
			{ "ItemWatch", "", 100, 110}
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "", 125, 60, "" },
            { "6Rnd_45ACP_Cylinder", "", 150, 75, "" },
            { "9Rnd_45ACP_Mag", "", 200, 100, "" },
            { "30Rnd_9x21_Mag", "", 250, 125, "" },
            { "30Rnd_9x21_Mag_SMG_02", "", 250, 125, "" }, //Apex DLC
            { "10Rnd_9x21_Mag", "", 250, 125, "" }, //Apex DLC
			{ "30Rnd_556x45_Stanag", "", 250, 125, "" }, //5.56 down
			{ "30Rnd_556x45_Stanag_Tracer_Red", "", 250, 125, "" },
			{ "30Rnd_556x45_Stanag_Tracer_Green", "", 250, 125, "" },
			{ "30Rnd_556x45_Stanag_Tracer_Yellow", "", 250, 125, "" }
        };
        accs[] = {
            { "optic_ACO_grn_smg", "", 1950, 475, "" },
			{ "optic_Holosight", "", 1000, 475, "" },
			{ "acc_pointer_IR", "", 1000, 475, "" },
			{ "muzzle_snds_L", "", 5000, 475, "" },
			{ "muzzle_snds_M", "", 5000, 475, "" },
			{ "muzzle_snds_acp", "", 5000, 475, "" },
			{ "optic_Arco", "", 10000, 475, "" },
			{ "optic_ERCO_blk_F", "", 10000, 475, "" },
			{ "optic_Hamr", "", 10000, 475, "" }, //RCO
			{ "optic_Holosight", "", 10000, 475, "" },
			{ "optic_Holosight_smg", "", 5000, 475, "" },
			{ "optic_SOS", "", 50000, 475, "" },
			{ "optic_MRCO", "", 11000, 475, "" },
			{ "acc_flashlight", "", 5000, 475, "" }
        };
    };

    class rebel {
        name = "Rebel Weapons";
        side = "civ";
        conditions = "license_civ_rebel";
        items[] = {
            { "hgun_Rook40_F", "", 25000, 12500, "" },  //rook
			{ "hgun_Pistol_heavy_02_F", "", 30000, 12500, "" },  //zubr
			{ "hgun_Pistol_heavy_01_F", "", 35000, 12500, "" },  //4-five
			{ "hgun_PDW2000_F", "", 40000, 10000, "" },  //pdw
			{ "arifle_SDAR_F", "", 45000, 10000, "" },  //sdar
			{ "SMG_01_F", "", 60000, 10000, "" },  //vermin 
			{ "SMG_02_F", "", 65000, 10000, "" },  //sting
			{ "arifle_AKS_F", "", 70000, 11000, "" }, //AKS Apex DLC
			{ "arifle_TRG20_F", "", 70000, 12500, "" },  //TRG20
			{ "arifle_TRG21_F", "", 75000, 12500, "" },  //TRG21
			{ "arifle_Mk20_F", "", 90000, 12500, "" },  //Mk20
			{ "arifle_SPAR_01_blk_F", "", 100000, 16500, "" }, //spar Apex DLC
			{ "arifle_ARX_blk_F", "", 115000, 11000, "" }, //Type 115 Apex DLC
			{ "arifle_Katiba_F", "", 150000, 15000, "" }, //Katiba
            { "arifle_MX_F", "", 150000, 12500, "" }, //MX
			{ "arifle_MXC_F", "", 145000, 12500, "" }, //MXC
			{ "arifle_MX_SW_F", "", 150000, 12500, "" }, //MX SW
			{ "arifle_MXM_F", "", 170000, 12500, "" }, //MXM
            { "arifle_CTAR_blk_F", "", 95000, 15000, "" }, //car-95 Apex DLC
			{ "FirstAidKit", "", 200, 110},
			{ "Medikit", "", 5000, 110},
			{ "ToolKit", "", 5000, 110},
			{ "ItemGPS", "", 100, 110},
			{ "ItemMap", "", 100, 110},
			{ "ItemRadio", "", 100, 110},
			{ "ItemCompass", "", 100, 110},
			{ "ItemWatch", "", 100, 110}

        };
        mags[] = {
            { "16Rnd_9x21_Mag", "", 125, 60, "" },
            { "6Rnd_45ACP_Cylinder", "", 150, 75, "" },
            { "9Rnd_45ACP_Mag", "", 200, 100, "" },
            { "30Rnd_9x21_Mag", "", 250, 125, "" },
			{ "30Rnd_65x39_caseless_green", "", 250, 125, "" }, //katiba down
			{ "30Rnd_65x39_caseless_green_mag_Tracer", "", 250, 125, "" },
			{ "3Rnd_SmokeGreen_Grenade_shell", "", 250, 125, "" },
			{ "UGL_FlareWhite_F", "", 250, 125, "" },
			{ "UGL_FlareGreen_F", "", 250, 125, "" },
			{ "UGL_FlareRed_F", "", 250, 125, "" },
			{ "UGL_FlareYellow_F", "", 250, 125, "" },
			{ "1Rnd_Smoke_Grenade_shell", "", 250, 125, "" },
			{ "1Rnd_SmokeRed_Grenade_shell", "", 250, 125, "" },
			{ "1Rnd_SmokeGreen_Grenade_shell", "", 250, 125, "" },
			{ "1Rnd_SmokeYellow_Grenade_shell", "", 250, 125, "" },
			{ "1Rnd_SmokePurple_Grenade_shell", "", 250, 125, "" },
			{ "30Rnd_556x45_Stanag", "", 250, 125, "" }, //mk-20 down
			{ "30Rnd_556x45_Stanag_Tracer_Red", "", 250, 125, "" },
			{ "30Rnd_556x45_Stanag_Tracer_Green", "", 250, 125, "" },
			{ "30Rnd_556x45_Stanag_Tracer_Yellow", "", 250, 125, "" },
			{ "30Rnd_65x39_caseless_mag_Tracer", "", 250, 125, "" }, //MX
			{ "30Rnd_65x39_caseless_mag", "", 250, 125, "" },
			{ "3Rnd_UGL_FlareWhite_F", "", 250, 125, "" },
			{ "30Rnd_9x21_Mag", "", 250, 125, "" },
			{ "30Rnd_9x21_Red_Mag", "", 250, 125, "" },
			{ "30Rnd_9x21_Yellow_Mag", "", 250, 125, "" },
			{ "30Rnd_9x21_Green_Mag", "", 250, 125, "" },
			{ "30Rnd_45ACP_Mag_SMG_01", "", 250, 125, "" },
			{ "30Rnd_45ACP_Mag_SMG_01_tracer_green", "", 250, 125, "" },
			{ "30Rnd_65x39_caseless_green", "", 250, 125, "" },
			{ "30Rnd_65x39_caseless_green_mag_Tracer", "", 250, 125, "" },
			{ "10Rnd_9x21_Mag", "", 250, 125, "" },
			{ "UGL_FlareWhite_F", "", 250, 125, "" },
			{ "UGL_FlareGreen_F", "", 250, 125, "" },
			{ "1Rnd_SmokeRed_Grenade_shell", "", 250, 125, "" },
			{ "1Rnd_SmokeGreen_Grenade_shell", "", 250, 125, "" },
			{ "30Rnd_545x39_Mag_F", "", 250, 125, "" },
			{ "30Rnd_545x39_Mag_Green_F", "", 250, 125, "" },
			{ "30Rnd_65x39_caseless_mag", "", 250, 125, "" }

        };
        accs[] = {
            { "optic_ACO_grn_smg", "", 1950, 475, "" },
			{ "optic_Holosight", "", 1000, 475, "" },
			{ "acc_pointer_IR", "", 1000, 475, "" },
			{ "muzzle_snds_H", "", 79500, 475, "" },
			{ "muzzle_snds_L", "", 5000, 475, "" },
			{ "muzzle_snds_M", "", 5000, 475, "" },
			{ "muzzle_snds_acp", "", 5000, 475, "" },
			{ "optic_Arco", "", 10000, 475, "" },
			{ "optic_ERCO_blk_F", "", 10000, 475, "" },
			{ "optic_Hamr", "", 10000, 475, "" }, //RCO
			{ "optic_Holosight", "", 10000, 475, "" },
			{ "optic_Holosight_smg", "", 5000, 475, "" },
			{ "optic_SOS", "", 50000, 475, "" },
			{ "optic_MRCO", "", 11000, 475, "" },
			{ "optic_DMS", "", 35000, 475, "" },
			{ "optic_LRPS", "", 200000, 475, "" },
			{ "acc_flashlight", "", 5000, 475, "" }
        };
    };

    class AdvancedRebel {
        name = "Advanced Rebel";
        side = "civ";
        conditions = "STR_License_Advanced_Rebel";
        items[] = {
            { "hgun_Rook40_F", "", 25000, 12500, "" },  //rook
			{ "hgun_Pistol_heavy_02_F", "", 30000, 12500, "" },  //zubr
			{ "hgun_Pistol_heavy_01_F", "", 35000, 12500, "" },  //4-five
			{ "hgun_PDW2000_F", "", 40000, 10000, "" },  //pdw
			{ "arifle_SDAR_F", "", 45000, 10000, "" },  //sdar
			{ "SMG_01_F", "", 60000, 10000, "" },  //vermin 
			{ "SMG_02_F", "", 65000, 10000, "" },  //sting
			{ "arifle_AKS_F", "", 70000, 11000, "" }, //AKS Apex DLC
			{ "arifle_TRG20_F", "", 70000, 12500, "" },  //TRG20
			{ "arifle_TRG21_F", "", 75000, 12500, "" },  //TRG21
			{ "arifle_Mk20_F", "", 90000, 12500, "" },  //Mk20
			{ "arifle_SPAR_01_blk_F", "", 100000, 16500, "" }, //spar Apex DLC
			{ "arifle_ARX_blk_F", "", 115000, 11000, "" }, //Type 115 Apex DLC
            { "arifle_MX_F", "", 150000, 12500, "" }, //MX
			{ "arifle_MXC_F", "", 145000, 12500, "" }, //MXC 
			{ "arifle_MXM_F", "", 170000, 12500, "" }, //MXM
			{ "arifle_CTAR_blk_F", "", 95000, 15000, "" }, //car-95 Apex DLC
			{ "arifle_Katiba_F", "", 150000, 15000, "" }, //Katiba
			{ "arifle_AKM_F", "", 170000, 11000, "" }, //AKM Apex DLC
            { "srifle_DMR_01_F", "", 200000, 25000, "" }, //Rahim
			{ "srifle_EBR_F", "", 230000, 11000}, //MK-18
			{ "arifle_AK12_F", "", 220000, 11000, "" }, //AK-12 Apex DLC
			{ "srifle_DMR_03_F", "", 500000, 11000}, //MK-1 EMR
			{ "FirstAidKit", "", 200, 110},
			{ "Medikit", "", 5000, 110},
			{ "ToolKit", "", 5000, 110},
			{ "ItemGPS", "", 100, 110},
			{ "ItemMap", "", 100, 110},
			{ "ItemRadio", "", 100, 110},
			{ "ItemCompass", "", 100, 110},
			{ "ItemWatch", "", 100, 110}
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "", 125, 60, "" },
            { "6Rnd_45ACP_Cylinder", "", 150, 75, "" },
            { "9Rnd_45ACP_Mag", "", 200, 100, "" },
            { "30Rnd_9x21_Mag", "", 250, 125, "" },
			{ "20Rnd_762x51_Mag", "", 1250, 125, "" }, //mkI
			{ "30Rnd_65x39_caseless_green", "", 250, 125, "" }, //katiba down
			{ "30Rnd_65x39_caseless_green_mag_Tracer", "", 250, 125, "" },
			{ "3Rnd_SmokeGreen_Grenade_shell", "", 250, 125, "" },
			{ "UGL_FlareWhite_F", "", 250, 125, "" },
			{ "UGL_FlareGreen_F", "", 250, 125, "" },
			{ "UGL_FlareRed_F", "", 250, 125, "" },
			{ "UGL_FlareYellow_F", "", 250, 125, "" },
			{ "1Rnd_Smoke_Grenade_shell", "", 250, 125, "" },
			{ "1Rnd_SmokeRed_Grenade_shell", "", 250, 125, "" },
			{ "1Rnd_SmokeGreen_Grenade_shell", "", 250, 125, "" },
			{ "1Rnd_SmokeYellow_Grenade_shell", "", 250, 125, "" },
			{ "1Rnd_SmokePurple_Grenade_shell", "", 250, 125, "" },
			{ "30Rnd_556x45_Stanag", "", 250, 125, "" }, //mk-20 down
			{ "30Rnd_556x45_Stanag_Tracer_Red", "", 250, 125, "" },
			{ "30Rnd_556x45_Stanag_Tracer_Green", "", 250, 125, "" },
			{ "30Rnd_556x45_Stanag_Tracer_Yellow", "", 250, 125, "" },
			{ "30Rnd_65x39_caseless_mag_Tracer", "", 250, 125, "" }, //MX
			{ "30Rnd_65x39_caseless_mag", "", 250, 125, "" },
			{ "3Rnd_UGL_FlareWhite_F", "", 250, 125, "" },
			{ "30Rnd_9x21_Mag", "", 250, 125, "" },
			{ "30Rnd_9x21_Red_Mag", "", 250, 125, "" },
			{ "30Rnd_9x21_Yellow_Mag", "", 250, 125, "" },
			{ "30Rnd_9x21_Green_Mag", "", 250, 125, "" },
			{ "30Rnd_45ACP_Mag_SMG_01", "", 250, 125, "" },
			{ "30Rnd_45ACP_Mag_SMG_01_tracer_green", "", 250, 125, "" },
			{ "30Rnd_65x39_caseless_green", "", 250, 125, "" },
			{ "30Rnd_65x39_caseless_green_mag_Tracer", "", 250, 125, "" },
			{ "30Rnd_762x39_Mag_F", "", 250, 125, "" },
			{ "30Rnd_762x39_Mag_Green_F", "", 250, 125, "" },
			{ "10Rnd_9x21_Mag", "", 250, 125, "" },
			{ "UGL_FlareWhite_F", "", 250, 125, "" },
			{ "UGL_FlareGreen_F", "", 250, 125, "" },
			{ "1Rnd_SmokeRed_Grenade_shell", "", 250, 125, "" },
			{ "1Rnd_SmokeGreen_Grenade_shell", "", 250, 125, "" },
			{ "30Rnd_545x39_Mag_F", "", 250, 125, "" },
			{ "30Rnd_545x39_Mag_Green_F", "", 250, 125, "" },
			{ "30Rnd_65x39_caseless_mag", "", 250, 125, "" }
        };
        accs[] = {
            { "optic_ACO_grn_smg", "", 1950, 475, "" },
			{ "optic_Holosight", "", 1000, 475, "" },
			{ "acc_pointer_IR", "", 1000, 475, "" },
			{ "muzzle_snds_H", "", 79500, 475, "" },
			{ "muzzle_snds_L", "", 5000, 475, "" },
			{ "muzzle_snds_M", "", 5000, 475, "" },
			{ "muzzle_snds_B", "", 150000, 475, "" },
			{ "muzzle_snds_acp", "", 5000, 475, "" },
			{ "optic_Arco", "", 10000, 475, "" },
			{ "optic_ERCO_blk_F", "", 10000, 475, "" },
			{ "optic_Hamr", "", 10000, 475, "" }, //RCO
			{ "optic_Holosight", "", 10000, 475, "" },
			{ "optic_Holosight_smg", "", 5000, 475, "" },
			{ "optic_SOS", "", 50000, 475, "" },
			{ "optic_MRCO", "", 11000, 475, "" },
			{ "optic_DMS", "", 35000, 475, "" },
			{ "optic_LRPS", "", 200000, 475, "" },
			{ "optic_KHS_blk", "", 150000, 475, "" },
			{ "acc_flashlight", "", 5000, 475, "" }
        };
    };

    //Basic Shops
    class genstore {
        name = "Altis General Store";
        side = "civ";
        conditions = "";
        items[] = {
            { "Binocular", "", 1500, 75, "" },
			{ "Rangefinder", "", 3000, 75, "" },
            { "ItemGPS", "", 100, 50, "" },
            { "ItemMap", "", 100, 25, "" },
            { "ItemCompass", "", 100, 25, "" },
            { "ItemWatch", "", 100, 25, "" },
            { "FirstAidKit", "", 150, 75, "" },
			{ "Medikit", "", 5000, 75, "" },
			{ "ToolKit", "", 1000, 75, "" },
			{ "ItemRadio", "", 100, 75, "" },
            { "NVGoggles", "", 2500, 1000, "" }

        };
        mags[] = {};
        accs[] = {};
    };

    class f_station_store {
        name = "Altis Fuel Station Store";
        side = "";
        conditions = "";
        items[] = {
            { "Binocular", "", 1500, 75, "" },
			{ "Rangefinder", "", 3000, 75, "" },
            { "ItemGPS", "", 100, 50, "" },
            { "ItemMap", "", 100, 25, "" },
            { "ItemCompass", "", 100, 25, "" },
            { "ItemWatch", "", 100, 25, "" },
            { "FirstAidKit", "", 150, 75, "" },
			{ "Medikit", "", 5000, 75, "" },
			{ "ToolKit", "", 1000, 75, "" },
			{ "ItemRadio", "", 100, 75, "" },
            { "NVGoggles", "", 2500, 1000, "" }
        };
        mags[] = {};
        accs[] = {};
    };

    //Cop Shops
    class cop_basic {
        name = "Police Armory";
        side = "cop";
        conditions = "";
        items[] = {
            { "hgun_P07_snds_F", $STR_W_items_StunPistol, 0, 1000, "" },
            { "hgun_P07_F", "", 0, 3750, "call life_coplevel >= 2" },
            { "hgun_P07_khk_F", "", 0, 3750, "call life_coplevel >= 2" }, //Apex DLC
			{ "hgun_Rook40_F", "", 0, 12500, "call life_coplevel >= 2" },  //rook
			{ "hgun_Pistol_heavy_02_F", "", 0, 12500, "call life_coplevel >= 2" },  //zubr
			{ "hgun_Pistol_heavy_01_F", "", 0, 12500, "call life_coplevel >= 2" },  //4-five
            { "SMG_02_ACO_F", "", 0, 15000, "call life_coplevel >= 2" }, //Sting
            { "hgun_ACPC2_F", "", 0, 8750, "call life_coplevel >= 2" }, //ACP-C2
			{ "arifle_TRG20_F", "", 0, 12500, "call life_coplevel >= 3" },  //TRG20
			{ "arifle_TRG21_F", "", 0, 12500, "call life_coplevel >= 3" },  //TRG21
			{ "arifle_Mk20_F", "", 0, 12500, "call life_coplevel >= 3" },  //Mk20
			{ "arifle_SPAR_01_blk_F", "", 0, 16500, "call life_coplevel >= 4" }, //spar Apex DLC
			{ "arifle_ARX_blk_F", "", 0, 11000, "call life_coplevel >= 5" }, //Type 115 Apex DLC
            { "arifle_MX_F", "", 0, 12500, "call life_coplevel >= 5" }, //MX
			{ "arifle_Katiba_F", "", 0, 15000, "call life_coplevel >= 6" }, //Katiba
			{ "arifle_MXC_F", "", 0, 12500, "call life_coplevel >= 6" }, //MXC 
			{ "arifle_CTAR_blk_F", "", 0, 15000, "call life_coplevel >= 6" }, //car-95 Apex DLC
			{ "arifle_MXM_F", "", 0, 12500, "call life_coplevel >= 7" }, //MXM
			{ "arifle_MX_SW_F", "", 0, 12500, "call life_coplevel >= 7" },
			{ "srifle_DMR_07_blk_F", "", 0, 16000, "call life_coplevel >= 7" }, //CMR
			{ "srifle_DMR_01_F", "", 0, 25000, "call life_coplevel >= 8" }, //Rahim
			{ "arifle_SPAR_03_blk_F", "", 0, 25000, "call life_coplevel >= 8" }, //Spar-17
			{ "srifle_EBR_F", "", 0, 11000, "call life_coplevel >= 9"}, //MK-18
			{ "srifle_DMR_06_camo_F", "", 0, 11000, "call life_coplevel >= 9"}, //MK14
			{ "srifle_DMR_03_F", "", 0, 11000, "call life_coplevel >= 10"}, //MK-1 EMR
			{ "Binocular", "", 1500, 75, "" },
			{ "Rangefinder", "", 3000, 75, "" },
            { "ItemGPS", "", 100, 50, "" },
            { "ItemMap", "", 100, 25, "" },
            { "ItemCompass", "", 100, 25, "" },
            { "ItemWatch", "", 100, 25, "" },
            { "FirstAidKit", "", 150, 75, "" },
			{ "Medikit", "", 5000, 75, "" },
			{ "ToolKit", "", 1000, 75, "" },
			{ "ItemRadio", "", 100, 75, "" },
            { "NVGoggles", "", 2500, 1000, "" }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "", 0, 60, "" },
            { "20Rnd_556x45_UW_mag", $STR_W_mags_TaserRifle, 0, 60, "" },
            { "11Rnd_45ACP_Mag", "", 0, 65, "" },
            { "30Rnd_65x39_caseless_mag", "", 0, 65, "" },
            { "30Rnd_9x21_Mag", "", 0, 125, "" },
            { "9Rnd_45ACP_Mag", "", 0, 100, "" },
            { "20Rnd_650x39_Cased_Mag_F", "", 0, 100, "" }, //Apex DLC
			{ "16Rnd_9x21_Mag", "", 0, 60, "" },
            { "6Rnd_45ACP_Cylinder", "", 0, 75, "" },
            { "9Rnd_45ACP_Mag", "", 0, 100, "" },
            { "30Rnd_9x21_Mag", "", 0, 125, "" },
			{ "20Rnd_762x51_Mag", "", 0, 125, "" }, //mkI
			{ "30Rnd_65x39_caseless_green", "", 0, 125, "" }, //katiba down
			{ "30Rnd_65x39_caseless_green_mag_Tracer", "", 0, 125, "" },
			{ "3Rnd_SmokeGreen_Grenade_shell", "", 0, 125, "" },
			{ "UGL_FlareWhite_F", "", 0, 125, "" },
			{ "UGL_FlareGreen_F", "", 0, 125, "" },
			{ "UGL_FlareRed_F", "", 0, 125, "" },
			{ "UGL_FlareYellow_F", "", 0, 125, "" },
			{ "1Rnd_Smoke_Grenade_shell", "", 0, 125, "" },
			{ "1Rnd_SmokeRed_Grenade_shell", "", 0, 125, "" },
			{ "1Rnd_SmokeGreen_Grenade_shell", "", 0, 125, "" },
			{ "1Rnd_SmokeYellow_Grenade_shell", "", 0, 125, "" },
			{ "1Rnd_SmokePurple_Grenade_shell", "", 0, 125, "" },
			{ "30Rnd_556x45_Stanag", "", 0, 125, "" }, //mk-20 down
			{ "30Rnd_556x45_Stanag_Tracer_Red", "", 0, 125, "" },
			{ "30Rnd_556x45_Stanag_Tracer_Green", "", 0, 125, "" },
			{ "30Rnd_556x45_Stanag_Tracer_Yellow", "", 0, 125, "" },
			{ "30Rnd_65x39_caseless_mag_Tracer", "", 0, 125, "" }, //MX
			{ "100Rnd_65x39_caseless_mag", "", 0, 125, "" }, //MX SW 100rnd
			{ "100Rnd_65x39_caseless_mag_Tracer", "", 0, 125, "" }, //MX SW Tracer 100rnd 
			{ "30Rnd_65x39_caseless_mag", "", 0, 125, "" },
			{ "3Rnd_UGL_FlareWhite_F", "", 0, 125, "" },
			{ "30Rnd_9x21_Mag", "", 0, 125, "" },
			{ "30Rnd_9x21_Red_Mag", "", 0, 125, "" },
			{ "30Rnd_9x21_Yellow_Mag", "", 0, 125, "" },
			{ "30Rnd_9x21_Green_Mag", "", 0, 125, "" },
			{ "30Rnd_45ACP_Mag_SMG_01", "", 0, 125, "" },
			{ "30Rnd_45ACP_Mag_SMG_01_tracer_green", "", 0, 125, "" },
			{ "30Rnd_65x39_caseless_green", "", 0, 125, "" },
			{ "30Rnd_65x39_caseless_green_mag_Tracer", "", 0, 125, "" },
			{ "30Rnd_762x39_Mag_F", "", 0, 125, "" },
			{ "30Rnd_762x39_Mag_Green_F", "", 0, 125, "" },
			{ "10Rnd_9x21_Mag", "", 0, 125, "" },
			{ "UGL_FlareWhite_F", "", 0, 125, "" },
			{ "UGL_FlareGreen_F", "", 0, 125, "" },
			{ "1Rnd_SmokeRed_Grenade_shell", "", 0, 125, "" },
			{ "1Rnd_SmokeGreen_Grenade_shell", "", 0, 125, "" },
			{ "30Rnd_545x39_Mag_F", "", 0, 125, "" },
			{ "30Rnd_545x39_Mag_Green_F", "", 0, 125, "" },
			{ "30Rnd_65x39_caseless_mag", "", 0, 125, "" }
        };
        accs[] = {
            { "muzzle_snds_L", "", 0, 325, "" },
            { "optic_MRD", "", 0, 1375, "call life_coplevel >= 1" },
            { "acc_flashlight", "", 0, 375, "call life_coplevel >= 2" },
            { "muzzle_snds_H", "", 0, 1375, "call life_coplevel >= 2" },
			{ "optic_ACO_grn_smg", "", 0, 475, "call life_coplevel >= 2" },
			{ "acc_pointer_IR", "", 0, 475, "call life_coplevel >= 2" },
			{ "muzzle_snds_M", "", 0, 475, "call life_coplevel >= 3" }, //5.56 suppressor
			{ "muzzle_snds_B", "", 0, 475, "call life_coplevel >= 10" }, //7.62 suppressor
			{ "muzzle_snds_acp", "", 0, 475, "call life_coplevel >= 2" },
			{ "optic_Arco", "", 0, 475, "call life_coplevel >= 2" },
			{ "optic_ERCO_blk_F", "", 0, 475, "call life_coplevel >= 2" },
			{ "optic_Hamr", "", 0, 475, "call life_coplevel >= 2" }, //RCO
			{ "optic_Holosight", "", 0, 475, "call life_coplevel >= 2" },
			{ "optic_Holosight_smg", "", 0, 475, "call life_coplevel >= 2" },
			{ "optic_SOS", "", 0, 475, "call life_coplevel >= 4" },
			{ "optic_MRCO", "", 0, 475, "call life_coplevel >= 2" },
			{ "optic_DMS", "", 0, 475, "call life_coplevel >= 4" },
			{ "optic_LRPS", "", 0, 475, "call life_coplevel >= 7" }
        };
    };

    //Medic Shops
    class med_basic {
        name = "Medic Store";
        side = "med";
        conditions = "";
        items[] = {
            { "Binocular", "", 1500, 75, "" },
			{ "Rangefinder", "", 3000, 75, "" },
            { "ItemGPS", "", 100, 50, "" },
            { "ItemMap", "", 100, 25, "" },
            { "ItemCompass", "", 100, 25, "" },
            { "ItemWatch", "", 100, 25, "" },
            { "FirstAidKit", "", 150, 75, "" },
			{ "Medikit", "", 5000, 75, "" },
			{ "ToolKit", "", 1000, 75, "" },
			{ "ItemRadio", "", 100, 75, "" },
            { "NVGoggles", "", 2500, 1000, "" }
        };
        mags[] = {};
        accs[] = {};
    };
};
