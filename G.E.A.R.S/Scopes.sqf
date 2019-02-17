///////////////////Gear, Equipment and Arsenal Restriction Script v1.2/////////////////////
/////////////////////////////////By Indianawinny///////////////////////////////////////////

private ["_safeZone","_dis","_opticsAllowed","_specialisedOptics"];
 
_safeZone = getMarkerPos "Base"; // The marker it uses to get the area around.
_dis = 200; // Area around the marker, in Meters.

//Scopes

_opticsAllowed = [
	//The slots that can use the scopes
	"B_Officer_F",
	"B_soldier_M_F",
	"B_Patrol_soldier_M_F",
	"B_Sharpshooter_F",
	"B_Recon_Sharpshooter_F",
	"B_sniper_F",
	"B_recon_TL_F",
	"B_soldier_UAV_F",
	"B_spotter_F",
	"B_ghillie_ard_F",
	"B_ghillie_lsh_F",
	"B_ghillie_sard_F",
	"B_Pilot_F",
	"B_crew_F"
];

_specialisedOptics = [
	// The Scopes
	"optic_DMS",
	"optic_LRPS",
	"optic_NVS",
	"optic_AMS",
	"optic_AMS_khk",
	"optic_AMS_snd",
	"optic_KHS_blk",
	"optic_KHS_hex",
	"optic_KHS_old",
	"optic_KHS_tan",
	"optic_DMS_ghex_F",
	"optic_LRPS_ghex_F",
	"optic_LRPS_tna_F",
	"optic_SOS_khk_F",
	"optic_SOS",
	"ACE_optic_LRPS_2D",
	"ACE_optic_LRPS_PIP",
	"ACE_optic_SOS_2D",
	"ACE_optic_SOS_PIP",
	"rhs_acc_dh520x56",
	"rhsusf_acc_M8541",
	"rhsusf_acc_M8541_low",
	"rhsusf_acc_M8541_low_d",
	"rhsusf_acc_M8541_low_wd",
	"rhsusf_acc_premier_low",
	"rhsusf_acc_premier_anpvs27",
	"rhsusf_acc_premier",
	"rhsusf_acc_LEUPOLDMK4",
	"rhsusf_acc_LEUPOLDMK4_2",
	"rhsusf_acc_LEUPOLDMK4_2_d",
	"RKSL_optic_PMII_312",
	"RKSL_optic_PMII_312_des",
	"RKSL_optic_PMII_312_wdl",
	"RKSL_optic_PMII_312_sunshade",
	"RKSL_optic_PMII_312_sunshade_des",
	"RKSL_optic_PMII_312_sunshade_wdl",
	"RKSL_optic_PMII_525",
	"RKSL_optic_PMII_525_des",
	"RKSL_optic_PMII_525_wdl",
	// "optic_Arco",
	// "optic_Arco_blk_F",
	// "optic_Arco_ghex_F",
	"optic_ERCO_blk_F",
	"optic_ERCO_khk_F",
	"optic_ERCO_snd_F",
	// "optic_Hamr",
	// "optic_Hamr_khk_F",
	"optic_MRCO",
	"ACE_optic_MRCO_2D",
	// "ACE_optic_Hamr_2D",
	// "ACE_optic_Hamr_PIP",
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
	"rhsusf_acc_g33_T1",
	"rhsusf_acc_g33_xps3_tan",
	"rhsusf_acc_g33_xps3",

	//2x Removal
	"RKSL_optic_LDS",
	"RKSL_optic_LDS_C",
	// "optic_ERCO_blk_F",
	// "optic_ERCO_khk_F",
	// "optic_ERCO_snd_F",
	"rhsusf_acc_su230",
	"rhsusf_acc_su230_c",
	"rhsusf_acc_su230_mrds",
	"rhsusf_acc_su230_mrds_c",
	"rhsusf_acc_su230a",
	"rhsusf_acc_su230a_c",
	"rhsusf_acc_su230a_mrds",
	"rhsusf_acc_su230a_mrds_c",
	"rhsusf_acc_ELCAN_ard",
	"rhsusf_acc_ELCAN",
	"rhsusf_acc_ACOG2_USMC",
	"rhsusf_acc_ACOG3_USMC",
	"rhsusf_acc_ACOG_USMC",
	"rhsusf_acc_anpvs27",
	"rhsusf_acc_g33_t1",
	"rhsusf_acc_g33_xps3",
	"rhsusf_acc_g33_xps3tan",
	"rhsusf_acc_ACOG",
	"rhsusf_acc_ACOG2",
	"rhsusf_acc_ACOG3",
	"rhsusf_acc_ACOG_anpvs27",
	"rhsusf_acc_ACOG_RMR",
	"rhsusf_acc_ACOG_RMR_d",
	"rhsusf_acc_ACOG_RMR_wd",
	// "ACE_optic_MRCO_2D",
	"optic_Hamr",
	"ACE_optic_Hamr_2D",
	"ACE_optic_Hamr_PIP",
	"optic_ERCO_blk_F"
];

//////////////////////////////////DO NOT MODIFY BELOW////////////////////////////////////////////
while {true} do {
	while {_safeZone distance player < _dis} do {
		if (({_x in (primaryWeaponItems player)} count _specialisedOptics) > 0) then {
			if (({player isKindOf _x} count _opticsAllowed) < 1) then {
				{player removePrimaryWeaponItem  _x;} count _specialisedOptics;
				titleText ["Stop stealing from the marksmen!", "PLAIN", 3]; // The comment it tells the player
				titleFadeOut 1; 
			};
		};
		if (({_x in (backpackItems player)} count _specialisedOptics) > 0) then {
			if (({player isKindOf _x} count _opticsAllowed) < 1) then {
				{player removeItem _x;} count _specialisedOptics;
				titleText ["Stop stealing from the marksmen!", "PLAIN", 3]; // The comment it tells the player
				titleFadeOut 1;
			};
		};
		if (({_x in (vestItems player)} count _specialisedOptics) > 0) then {
			if (({player isKindOf _x} count _opticsAllowed) < 1) then {
				{player removeItem _x;} count _specialisedOptics;
				titleText ["Stop stealing from the marksmen!", "PLAIN", 3]; // The comment it tells the player
				titleFadeOut 1; 
			};
		};
		if (({_x in (uniformItems player)} count _specialisedOptics) > 0) then {
			if (({player isKindOf _x} count _opticsAllowed) < 1) then {
				{player removeItem _x;} count _specialisedOptics;
				titleText ["Stop stealing from the marksmen!", "PLAIN", 3]; // The comment it tells the player
				titleFadeOut 1; 
			};
		};
		sleep 5;
	};
	sleep 30;
};