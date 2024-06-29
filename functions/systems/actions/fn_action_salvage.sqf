
/*
    File: fn_action_salvage.sqf
    Author: DIRT
    
    Description:
        Adds the "hold action" to objects for salvaging underwater/bugged vehicles
        
        Players must be:
        	- explosive specialist trained
        	- within 5 metres of the vehicle
        	- have a salvage kit in their inventory (limpet mine + minedetector + toolkit)
        	- not opfor


    Parameter(s):
        objs - Array - the objects this hold action will be attached to (_this entries)
    
    Returns:
        None
    
   	See here for more detail on the implementation:
		https://community.bistudio.com/wiki/BIS_fnc_holdActionAdd
*/


private _actionText = "$ALVAGE";
private _actionIdleIcon = "custom\holdactions\holdAction_destroy_ca.paa";
private _actionProgressIcon = _actionIdleIcon;


private _isNotOpfor = "side player != east";
private _isInRangeOfSalvage = "player distance cursorObject < 5";
private _isPlayerHasSalvageKit = "'vn_b_item_toolkit' in ((vestItems player) + (uniformItems player) + (backpackItems player))";  //'vn_b_item_toolkit' in ((vestItesm player) + (uniformItems player) + (backpackItems player)); or "'vn_b_item_toolkit' in (backpackItems player)";
private _isPlayerHasMD = "'MineDetector' in ((vestItems player) + (uniformItems player) + (backpackItems player))";
private _isPlayerHasCharge = "'vn_mine_limpet_01_mag' in ((vestItems player) + (uniformItems player) + (backpackItems player))";
private _isPlayerExplosiveSpecialist = "player getUnitTrait 'explosiveSpecialist'";
/////////////////////////////////////////SALVAGABLE VEHICLES/////////////////////////////////////////////////////////////

private _isValidObjectType = "(typeOf cursorObject in 
[

 'CUP_B_AH64_DL_USA',
 'CUP_B_MH60L_DAP_4x_US',
 'CUP_B_MH60L_DAP_2x_US',
 'CUP_B_AH1Z_Dynamic_USMC',
 'CUP_B_AH64D_DL_USA',
 'RHS_MELB_AH6M',
 'CUP_B_MV22_USMC',
 'CUP_B_MV22_USMC_RAMPGUN',
 'B_Heli_Transport_01_F',
 'CUP_B_MH60S_USMC',
 'CUP_B_UH60S_USN',
 'CUP_B_CH53E_USMC',
 'RHS_CH_47F_cargo',
 'CUP_B_CH47F_HIL',
 'CUP_B_Mi17_CDF',
 'ej_UH60M_NATO',
 'ADF_Heli_Transport_01_F',
 'ADF_Heli_Transport_02a_F',
 'CUP_C_412_Sheriff',
 'CUP_B_MH6M_USA',
 'CUP_B_MH47E_USA',
 'ej_MH60L',
 'CUP_B_UH60M_US',
 'RHS_UH60M_MEV',
 'CUP_C_Merlin_HC3_CIV_Lux',
 'C_Heli_Light_01_civil_F',
 'CUP_C_412_Luxury',
 'CUP_B_Mi17_VIV_CDF',
 'rhs_uh1h_hidf',
 'ADF_Heli_Light_01',
 'ej_MH80',
 'RHS_MELB_MH6M',
 'ej_MH60M',
 'CUP_B_MH6M_OBS_USA',
 'FIR_F15EX_OG_123FS',
 'FIR_F15EX_OG_114FS',
 'rhsusf_f22',
 'CUP_B_A10_DYN_USA',
 'FIR_F16C_HG',
 'FIR_F16C_MY_515',
 'FIR_F18C_VMFA251',
 'FIR_F18C_Scar',
 'USAF_C130J',
 'CUP_B_LAV25_desert_USMC',
 'CUP_B_AAV_USMC',
 'rhsusf_m113d_usarmy',
 'rhsusf_m113d_usarmy_M240',
 'CUP_B_M7Bradley_USA_D',
 'CUP_B_M2A3Bradley_USA_D',
 'rhsusf_M142_usarmy_D',
 'RHS_M6',
 'rhsusf_stryker_m1132_m2_d',
 'RHS_M2A3_BUSKIII',
 'rhsusf_m109d_usarmy',
 'CUP_B_M1A2C_TUSK_II_Desert_US_Army',
 'rhsusf_m1a2sep1tuskiid_usarmy',
 'B_Truck_01_cargo_F',
 'B_Truck_01_box_F',
 'CUP_B_Boxer_Empty_HIL',
 'CUP_B_Boxer_GMG_HIL',
 'CUP_B_Boxer_HMG_HIL',
 'CUP_B_MTVR_HIL',
 'CUP_B_M1126_ICV_MK19_Desert',
 'CUP_B_M1126_ICV_M2_Desert',
 'ADF_APC_tracked_01_cannon_F',
 'B_T_Truck_01_fuel_F',
 'rhsusf_M977A4_REPAIR_BKIT_usarmy_wd',
 'rhsusf_M977A4_AMMO_BKIT_usarmy_wd',
 'rhsusf_stryker_m1126_mk19_d',
 'rhsusf_stryker_m1126_m2_d',
 'rhsusf_stryker_m1134_wd',
 'CUP_B_Mastiff_GMG_GB_D',
 'ADF_LSV_01_armed_F',
 'B_G_Offroad_01_armed_F',
 'rhsusf_m998_w_4dr',
 'B_MRAP_01_hmg_F',
 'CUP_B_M151_HIL',
 'CUP_B_M151_M2_HIL',
 'CUP_B_nM1025_Mk19_USMC_DES',
 'CUP_B_nM1025_M2_USMC_DES',
 'CUP_B_M1151_Mk19_DSRT_USMC',
 'CUP_B_M1151_Deploy_DSRT_USMC',
 'CUP_B_RG31E_M2_USMC',
 'CUP_B_RG31_Mk19_USMC',
 'B_MRAP_01_gmg_F',
 'CUP_B_TowingTractor_NATO',
 'B_LSV_01_unarmed_F',
 'C_Offroad_01_comms_F',
 'C_Hatchback_01_F',
 'CUP_O_Hilux_unarmed_TK_CIV_White',
 'rhsusf_M1230a1_usarmy_wd',
 'C_Van_02_medevac_F',
 'C_IDAP_Van_02_medevac_F',
 'C_Offroad_01_repair_F',
 'C_IDAP_Offroad_01_F',
 'rhsusf_m998_w_2dr_fulltop',
 'rhsusf_m998_w_2dr',
 'C_Hatchback_01_sport_F',
 'C_Van_02_vehicle_F',
 'B_LSV_01_AT_F',
 'B_LSV_01_armed_F',
 'B_Quadbike_01_F',
 'CUP_B_M1030_USA',
 'B_GEN_Van_02_vehicle_F',
 'C_Offroad_01_F',
 'ADF_MRAP_01_hmg_F',
 'CUP_B_BAF_Coyote_L2A1_D',
 'CUP_B_Jackal2_GMG_GB_D',
 'rhsgref_hidf_m1025_mk19',
 'rhsgref_hidf_m998_4dr',
 'B_GEN_Van_02_transport_F',
 'rhsusf_m113d_usarmy_medical',
 'B_UGV_01_rcws_F',
 'B_UGV_01_F',
 'rhsusf_M1220_M2_usarmy_d',
 'rhsusf_M1220_M153_M2_usarmy_d',
 'rhsusf_M1238A1_M2_socom_d',
 'rhsusf_mrzr4_d',
 'CUP_B_nM1025_SOV_M2_USMC_DES',
 'CUP_B_RHIB_USMC',
 'CUP_B_RHIB2Turret_USMC',
 'CUP_B_LCU1600_USMC',
 'B_Boat_Armed_01_minigun_F',
 'B_SDV_01_F',
 'ghosthawk_CG_Blu',
 'MEF_USMC_Ghosthawk',
 'RHS_UH60M_d',
 'RHS_UH60M_MEV2_d',
 'class mohawk_CG'

])"; 
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
private _conditionToShow = format [
	"(%1 && %2 && %3 && %4 && %5 && %6 && %7)",
	_isNotOpfor, 
	_isInRangeOfSalvage, 
	_isValidObjectType,
	_isPlayerHasSalvageKit,
	_isPlayerHasMD,
	_isPlayerHasCharge,
	_isPlayerExplosiveSpecialist
	
];

// WARN: if changing this make sure you change the logic in _codeOnStart too!!
private _isPlayerExplosiveSpecialist = "player getUnitTrait 'explosiveSpecialist'";
private _isPlayerHasSalvageKit = "'vn_b_item_toolkit' in ((vestItems player) + (uniformItems player) + (backpackItems player))"; //"'vn_b_item_toolkit' in (backpackItems player)";

private _conditionToProgress = format [
	"(%1 && %2 && %3 && %4 && %5)",
	_conditionToShow,
	_isPlayerExplosiveSpecialist,
	_isPlayerHasSalvageKit,
	_isPlayerHasMD,
	_isPlayerHasCharge
];

private _codeOnStart = {};
	/*
	private _playerIsExplosiveSpecialist = "player getUnitTrait 'explosiveSpecialist'";
	private _playerHasSalvageKit = "'vn_b_item_toolkit' in ((vestItems player) + (uniformItems player) + (backpackItems player))"; //(backpackItems player);
	if (not _playerHasSalvageKit || not _playerIsExplosiveSpecialist) exitWith {
	    ["SALVAGEFailed", []] remoteExec ["para_c_fnc_show_notification", player];
	};
	if (true) exitWith {
	    ["SALVAGEStart", []] remoteExec ["para_c_fnc_show_notification", player];
	};
};
*/
private _codeOnTick = {};
private _codeOnComplete = {
	_charge = createMine ["SatchelCharge_F", player, [], 0]; 
	_charge attachTo [cursorTarget,[0,0,-1]];
	player removeItem "vn_mine_limpet_01_mag";
	["SALVAGESuccess", []] remoteExec ["para_c_fnc_show_notification", player];
	sleep 30;
	_bomb = createVehicle ["R_80mm_HE", getPos _charge, [], 0, "CAN_COLLIDE"];
};
private _codeOnInterrupted = {};
private _extraArgsArr = [];
private _actionDurationSeconds = 10;
private _actionPriority = -10;
private _actionRemoveOnComplete = false;
private _showWhenUncon = false;

[
	player,
	_actionText,
	_actionIdleIcon,
	_actionProgressIcon,
	_conditionToShow,
	_conditionToProgress,
	_codeOnStart,
	_codeOnTick,
	_codeOnComplete,
	_codeOnInterrupted,
	_extraArgsArr,
	_actionDurationSeconds,
	_actionPriority,
	_actionRemoveOnComplete,
	_showWhenUncon
] call BIS_fnc_holdActionAdd;



/*   OLD CODE 
_mine = createMine ["UnderwaterMine", player, [], 0];

_charge = createMine ["SatchelCharge_F", player, [], 0]; 
player addOwnedMine _charge;
_charge attachTo [cursorTarget,[0,0,-1]];


		sleep 15;
		private _bomb = createVehicle ["Rocket_04_HE_F", getPos _task, [], 0, "CAN_COLLIDE"]; ammo_Bomb_SDB 	R_80mm_HE      R_230mm_HE    Bomb_04_F '500lbs'  BombCluster_02_Ammo_F '1000lbs'    M_Titan_AT  'titan AT missile'
		_target setDamage [1, false];

private _isPlayerHasSalvageKit = "['vn_prop_med_wormpowder', 'vn_b_item_toolkit', 'vn_mine_limpet_01_mag']  in (bakpackItems player)";

////////////////////////////////////////////////////////////////////////
[this,       
 "DEMO",       
 "\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\destroy_ca.paa",       
 "\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\destroy_ca.paa",       
 "_this distance _target < 5 && 'vn_prop_med_wormpowder' in magazines _this",                                 
    "_caller distance _target < 5 && 'vn_prop_med_wormpowder' in magazines _caller",              
 {},                    
 {},
 {_target setDamage [1, false];},       
 {},       
 [],       
 20,       
 0,       
 false,       
 false       
] remoteExec ["BIS_fnc_holdActionAdd", 0, this];



////////////////////////////////////////////////////////////////////////////////////


if (hasInterface) then {
[this,       
 "DEMO",       
 "\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\destroy_ca.paa",       
 "\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\destroy_ca.paa",       
 "_this distance _target < 5 && 'vn_prop_med_wormpowder' in magazines _this",                                 
    "_caller distance _target < 5 && 'vn_prop_med_wormpowder' in magazines _caller",              
 {},                    
 {},
 {_target setDamage [1, false];},       
 {},       
 [],       
 20,       
 0,       
 false,       
 false       
] remoteExec ["BIS_fnc_holdActionAdd", 0, this];
};



*/