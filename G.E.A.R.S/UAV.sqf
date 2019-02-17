///////////////////Gear, Equipment and Arsenal Restriction Script v1.2/////////////////////
/////////////////////////////////By Indianawinny///////////////////////////////////////////

private ["_safeZone","_dis","_uavAllowed","_restrictedUav"];

_safeZone = getMarkerPos "Base"; // The marker it uses to get the area around.
_dis = 200; // Area around the marker, in Meters.

//UAV Terminal

_uavAllowed = [
	//The slots that can use the Terminal
	"B_Officer_F",
	"B_recon_TL_F",
	"B_sniper_F",
	"B_spotter_F",
	"B_soldier_UAV_F",
	"B_Pilot_F",
	"B_Fighter_Pilot_F",
	"B_Helipilot_F",
	"B_Patrol_Soldier_TL_F",
	"B_crew_F"
];

_restrictedUav = [
	// The Terminal
	"B_UavTerminal"
];

//////////////////////////////////DO NOT MODIFY BELOW////////////////////////////////////////////
while {true} do {
	while {_safeZone distance player < _dis} do {
		if (({_x in (assignedItems player)} count _restrictedUav) > 0) then {
			if (({player isKindOf _x} count _uavAllowed) < 1) then {
				{player unassignItem  _x; player removeItem  _x;} count _restrictedUav;
				player linkItem "ItemMicroDAGR"; //The Item it is gonna get replaced with
				titleText ["Please hand that to someone who will find it more useful.", "PLAIN", 3]; // The comment it tells the player
				titleFadeOut 1;
			};
		};
		if (({_x in (uniformItems player)} count _restrictedUav) > 0) then {
			if (({player isKindOf _x} count _uavAllowed) < 1) then {
				{player removeItem _x;} count _restrictedUav;
				player addItemToUniform"ItemMicroDAGR"; //The Item it is gonna get replaced with
				titleText ["Please hand that to someone who will find it more useful.", "PLAIN", 3]; // The comment it tells the player
				titleFadeOut 1; 
			};
		};
		if (({_x in (vestItems player)} count _restrictedUav) > 0) then {
			if (({player isKindOf _x} count _uavAllowed) < 1) then {
				{player removeItem _x;} count _restrictedUav;
				player addItemToVest "ItemMicroDAGR"; //The Item it is gonna get replaced with
				titleText ["Please hand that to someone who will find it more useful.", "PLAIN", 3]; // The comment it tells the player
				titleFadeOut 1;
			};
		};
		if (({_x in (backpackItems player)} count _restrictedUav) > 0) then {
			if (({player isKindOf _x} count _uavAllowed) < 1) then {
				{player removeItem _x;} count _restrictedUav;
				player addItemToBackpack "ItemMicroDAGR"; //The Item it is gonna get replaced with
				titleText ["Please hand that to someone who will find it more useful.", "PLAIN", 3]; // The comment it tells the player
				titleFadeOut 1; 
			};
		};
		sleep 10;
	};
	sleep 30;
};