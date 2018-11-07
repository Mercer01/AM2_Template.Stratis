///////////////////Gear, Equipment and Arsenal Restriction Script v1.2/////////////////////
///////////////////////////////By Indianawinny and PREACHr/////////////////////////////////

private ["_safeZone","_dis","_ladderAllowed","_ladderRestricted"];

_safeZone = getMarkerPos "Base"; // The marker it uses to get the area around.
_dis = 200; // Area around the marker, in Meters.

//Telescopic Ladder

_ladderAllowed = [
//The slots that can use the radios
"B_Officer_F",
"B_Pilot_F",
"B_recon_TL_F",
"B_sniper_F",
"B_spotter_F"
];

_ladderRestricted = [
// The Ladder
"ACE_TacticalLadder_Pack"
];

//////////////////////////////////DO NOT MODIFY BELOW////////////////////////////////////////////
while {true} do {
	while {_safeZone distance player < _dis} do {
		if(({player isKindOf _x} count _ladderAllowed) < 1) then {
			if((_ladderRestricted find (backpack player)) >= 0) then {
				removeBackpack player;
				player addBackpack "MC_Backpack_Kitbag"; //Backpack it is gonna get replaced with
				titleText ["Please hand that to someone who will find it more useful.", "PLAIN", 3]; // The comment it tells the player
				titleFadeOut 1; 
			};
		};
		sleep 10;
	};
	sleep 30;
};