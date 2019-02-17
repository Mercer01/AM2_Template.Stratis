// Disable saving (Needed for multiplayer)
enableSaving [false,false];

// Enables ambient sounds and animals (Bunny Wabits)
enableEnvironment true;

// Remove empty groups, preventing zeus spawn limitations
[] spawn {
    while{true} do {
        sleep 60;
        {
            if(local _x && count units _x == 0) then {
                deleteGroup _x;
                sleep 1;
            };
        } forEach allGroups;
    };
};

// Sets Higher Recoil for players
player setUnitRecoilCoefficient 1.5;

// starts script to show all units on map for zeuses, because zeuses need to know what is going on
[] execVM 'Scripts\unit_markers_for_zeus.sqf';

// Passes AI groups simulation to headless clients (HC for short), does nothing if HCs are not available, can use up to 3 HCs named HC, HC2, HC3
[] execVM "Scripts\passToHCs.sqf";

// Stop bullets and nades at base. If the base is under attack at the beginning, remove this section.
[] execVM "Scripts\NoBaseNades.sqf";

// Stop bullets and nades at base. If the base is under attack at the beginning, remove this section.
[] execVM "Scripts\admin_or_zeus_actions.sqf";

// Removes suppressors. If it's a stealth mission, remove this section.
[] execVM "G.E.A.R.S\Supressors.sqf";

// Executes Equipment Restriction Script.
[player] execVM "G.E.A.R.S\init.sqf";

//Remove this line for custom uniform
player addUniform "UK3CB_BAF_U_CombatUniform_MTP";


["Fire Support", "Direct Cruise-Missile", { [_this select 1, _this select 0, getMarkerPos "MisileStart", "ammo_Missile_Cruise_01", 500] execVM "Scripts\guidedMissile_direct.sqf" }] call Ares_fnc_RegisterCustomModule;
["Fire Support", "Laser Cruise-Missile", { [_this select 1, _this select 0, getMarkerPos "MisileStart", "ammo_Missile_Cruise_01", 500] execVM "Scripts\guidedMissile_laser.sqf" }] call Ares_fnc_RegisterCustomModule;
["Fire Support", "Direct Missile", { [_this select 1, _this select 0, getMarkerPos "MisileStart", "M_Scalpel_AT", 500] execVM "Scripts\guidedMissile_direct.sqf" }] call Ares_fnc_RegisterCustomModule;
["Fire Support", "Laser Missile", { [_this select 1, _this select 0, getMarkerPos "MisileStart", "M_Scalpel_AT", 500] execVM "Scripts\guidedMissile_laser.sqf" }] call Ares_fnc_RegisterCustomModule;