///////////////////Gear, Equipment and Arsenal Restriction Script v1.2/////////////////////
/////////////////////////////////By Indianawinny///////////////////////////////////////////
// All scopes greater than or equal to 4x that are restricted for some reason or another


private ["_safeZone","_dis","_4xAllowed","_restrictedOptics"];
 
_safeZone = getMarkerPos "Base"; // The marker it uses to get the area around.
_dis = 200; // Area around the marker, in Meters.

//Scopes

_4xAllowed = [
	//The slots that can use the scopes
	"B_Officer_F",
	"B_soldier_M_F",
	"B_Patrol_soldier_M_F",
	"B_Sharpshooter_F",
	"B_Recon_Sharpshooter_F",
	"B_sniper_F",
	"B_recon_TL_F",
	"B_spotter_F",
	"B_ghillie_ard_F",
	"B_ghillie_lsh_F",
	"B_ghillie_sard_F",
	"B_Survivor_F",
	"B_Soldier_TL_F",
	"B_Soldier_SL_F",
	"B_Pilot_F"
];

_restrictedOptics = [
	// The Scopes
	"ACE_optic_Arco_PIP",
	"ACE_optic_Arco_2D",
	"RKSL_optic_LDS",
	"RKSL_optic_LDS_C",
	//RHS
	"rhsusf_acc_ACOG2_USMC_pip",
	"rhsusf_acc_ACOG3_USMC_pip",
	"rhsusf_acc_ACOG_USMC_pip",
	"rhsusf_acc_ELCAN_pip",
	"rhsusf_acc_ELCAN_ard_pip",
	"rhsusf_acc_ACOG_pip",
	"rhsusf_acc_ACOG2_pip",
	"rhsusf_acc_ACOG3_pip",
	"rhsusf_acc_ACOG_anpvs27_pip",
	"rhsusf_acc_ACOG_MDO_pip",
	"rhsusf_acc_ACOG_d_pip",
	"rhsusf_acc_ACOG_wd_pip",
	"rhsusf_acc_ACOG_RMR_pip",
	"rhsusf_acc_SpecterDR_pip",
	"rhsusf_acc_SpecterDR_OD_pip",
	"rhsusf_acc_SpecterDR_D_pip",
	"rhsusf_acc_SpecterDR_A_pip",
	"rhsusf_acc_ACOG2_USMC_3d",
	"rhsusf_acc_ACOG3_USMC_3d",
	"rhsusf_acc_ACOG_USMC_3d",
	"rhsusf_acc_ELCAN_3d",
	"rhsusf_acc_ELCAN_ard_3d",
	"rhsusf_acc_ACOG_3d",
	"rhsusf_acc_ACOG2_3d",
	"rhsusf_acc_ACOG3_3d",
	"rhsusf_acc_ACOG_anpvs27_3d",
	"rhsusf_acc_ACOG_MDO_3d",
	"rhsusf_acc_ACOG_d_3d",
	"rhsusf_acc_ACOG_wd_3d",
	"rhsusf_acc_ACOG_RMR_3d",
	"rhsusf_acc_SpecterDR_3d",
	"rhsusf_acc_SpecterDR_OD_3d",
	"rhsusf_acc_SpecterDR_D_3d",
	"rhsusf_acc_SpecterDR_A_3d",
	"rhsusf_acc_ACOG2_USMC",
	"rhsusf_acc_ACOG3_USMC",
	"rhsusf_acc_ACOG_USMC",
	"rhsusf_acc_ELCAN",
	"rhsusf_acc_ELCAN_ard",
	"rhsusf_acc_ACOG",
	"rhsusf_acc_ACOG2",
	"rhsusf_acc_ACOG3",
	"rhsusf_acc_ACOG_anpvs27",
	"rhsusf_acc_ACOG_MDO",
	"rhsusf_acc_ACOG_d",
	"rhsusf_acc_ACOG_wd",
	"rhsusf_acc_ACOG_RMR",
	"rhsusf_acc_SpecterDR",
	"rhsusf_acc_SpecterDR_OD",
	"rhsusf_acc_SpecterDR_D",
	"rhsusf_acc_SpecterDR_A",

	// RHS part 2
	"rhsusf_acc_su230a_mrds_c",
	"rhsusf_acc_su230a_mrds",
	"rhsusf_acc_su230a_c",
	"rhsusf_acc_su230a",
	"rhsusf_acc_su230_mrds_c",
	"rhsusf_acc_su230_mrds",
	"rhsusf_acc_su230_c",
	"rhsusf_acc_su230"
];

//////////////////////////////////DO NOT MODIFY BELOW////////////////////////////////////////////
while {true} do {
	while {_safeZone distance player < _dis} do {
		if (({_x in (primaryWeaponItems player)} count _restrictedOptics) > 0) then {
			if (({player isKindOf _x} count _4xAllowed) < 1) then {
			{player removePrimaryWeaponItem  _x;} count _restrictedOptics;
			player addPrimaryWeaponItem "optic_aco"; //Scope it is gonna get replaced with
			titleText ["You are not issued that!", "PLAIN", 3]; // The comment it tells the player
			titleFadeOut 1; 
		};
	};
		if (({_x in (backpackItems player)} count _restrictedOptics) > 0) then {
			if (({player isKindOf _x} count _4xAllowed) < 1) then {
			{player removeItem _x;} count _restrictedOptics;
			player addItemToBackpack "optic_aco"; //Scope it is gonna get replaced with
			titleText ["You are not issued that!", "PLAIN", 3]; // The comment it tells the player
			titleFadeOut 1; 
		};
	};
		if (({_x in (vestItems player)} count _restrictedOptics) > 0) then {
			if (({player isKindOf _x} count _4xAllowed) < 1) then {
			{player removeItem _x;} count _restrictedOptics;
			player addItemToVest "optic_aco"; //Scope it is gonna get replaced with
			titleText ["You are not issued that!", "PLAIN", 3]; // The comment it tells the player
			titleFadeOut 1; 
		};
	};
		if (({_x in (uniformItems player)} count _restrictedOptics) > 0) then {
			if (({player isKindOf _x} count _4xAllowed) < 1) then {
			{player removeItem _x;} count _restrictedOptics;
			player addItemToUniform "optic_aco"; //Scope it is gonna get replaced with
			titleText ["You are not issued that!", "PLAIN", 3]; // The comment it tells the player
			titleFadeOut 1;
		};
	};
	sleep 10;
	};
	sleep 30;
};