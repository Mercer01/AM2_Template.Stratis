///////////////////Gear, Equipment and Arsenal Restriction Script v1.2/////////////////////
/////////////////////////////////By Indianawinny///////////////////////////////////////////

private ["_safeZone","_dis","_toolAllowed","_restrictedTool"];

_safeZone = getMarkerPos "Base"; // The marker it uses to get the area around.
_dis = 200; // Area around the marker, in Meters.

//Fortify Tool

_toolAllowed = [
	//The slots that can use the tool
	"B_Officer_F",
	"B_Patrol_Soldier_TL_F",
	"B_crew_F",
	"B_Pilot_F",
	"B_soldier_UAV_F"
];

_restrictedTool = [
	// The Fortify Tool
	"ACE_Fortify"
];

//////////////////////////////////DO NOT MODIFY BELOW////////////////////////////////////////////
while{true} do {
	while {_safeZone distance player < _dis} do {
		if (({_x in (uniformItems player)} count _restrictedTool) > 0) then {
			if (({player isKindOf _x} count _toolAllowed) < 1) then {
				{player removeItem _x;} count _restrictedTool;
				titleText ["That's not your job!", "PLAIN", 3]; titleFadeOut 1; // The comment it tells the player
			};
		};
		if (({_x in (vestItems player)} count _restrictedTool) > 0) then {
			if (({player isKindOf _x} count _toolAllowed) < 1) then {
				{player removeItem _x;} count _restrictedTool;
				titleText ["That's not your job!", "PLAIN", 3]; titleFadeOut 1; // The comment it tells the player
			};
		};
		if (({_x in (backpackItems player)} count _restrictedTool) > 0) then {
			if (({player isKindOf _x} count _toolAllowed) < 1) then {
				{player removeItem _x;} count _restrictedTool;
				titleText ["That's not your job!", "PLAIN", 3]; titleFadeOut 1; // The comment it tells the player
			};
		};
		sleep 10;
	};
	sleep 30;
};