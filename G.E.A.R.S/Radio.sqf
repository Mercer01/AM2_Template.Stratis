///////////////////Gear, Equipment and Arsenal Restriction Script v1.2/////////////////////
///////////////////////////////By Indianawinny and PREACHr/////////////////////////////////

private ["_safeZone","_dis","_backpacksAllowed","_backpacksRestricted"];

_safeZone = getMarkerPos "Base"; // The marker it uses to get the area around.
_dis = 200; // Area around the marker, in Meters.

//Long Range Radio

_backpacksAllowed = [
	//The slots that can use the radios
	"B_Officer_F",
	"B_Survivor_F",
	"B_Soldier_TL_F",
	"B_Patrol_Soldier_TL_F",
	"B_Soldier_SL_F",
	"B_diver_TL_F",
	"B_recon_TL_F",
	"B_Pilot_F",
	"B_Fighter_Pilot_F",
	"B_Helipilot_F",
	"B_crew_F",
	"B_spotter_F"
];

_backpacksRestricted = [
	// The Radios
	"OPXT_aor1_1523",
	"OPXT_aor2_1523",
	"OPXT_aoru_1523",
	"OPXT_multicam_1523",
	"OPXT_multicamb_1523",
	"OPXT_surpat_1523",
	"OPXT_goao_1523_S",
	"OPXT_goa_1523_S",
	"UK3CB_BAF_B_Bergen_DPMW_JTAC_A",
	"UK3CB_BAF_B_Bergen_DPMW_JTAC_H_A",
	"UK3CB_BAF_B_Bergen_DPMW_SL_A",
	"UK3CB_BAF_B_Bergen_MTP_SL_A",
	"UK3CB_BAF_B_Bergen_MTP_JTAC_A",
	"UK3CB_BAF_B_Bergen_MTP_JTAC_H_A"
];

//////////////////////////////////DO NOT MODIFY BELOW////////////////////////////////////////////
while {true} do {
	while {_safeZone distance player < _dis} do {
		if(({player isKindOf _x} count _backpacksAllowed) < 1) then {
			if((_backpacksRestricted find (backpack player)) >= 0) then {
				removeBackpack player;
				player addBackpack "MC_Backpack_Kitbag"; //Backpack it is gonna get replaced with
				titleText ["Uhhhhhhhhhhh right then, seems you dont know how to use a LR radio", "PLAIN", 3]; // The comment it tells the player
				titleFadeOut 1; 
			};
		};
		sleep 10;
	};
	sleep 30;
};