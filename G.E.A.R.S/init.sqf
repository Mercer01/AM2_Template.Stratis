///////////////////Gear, Equipment and Arsenal Restriction Script v1.2/////////////////////
/////////////////////////////////By Indianawinny///////////////////////////////////////////

//This file executs all the scripts in G.E.A.R.S (Except supressors), if any new ones are added they need to be put in here and vice versa.
//This needs to be executed in the init.sqf in the main mission folder ([] execVM "G.E.A.R.S\init.sqf";)
_player = _this select 0;
_uid = getPlayerUID _player;

// if(_uid == "76561198048384891") exitWith {};

[] execVM "G.E.A.R.S\MG.sqf";
sleep 1;
[] execVM "G.E.A.R.S\DMR.sqf";
sleep 1;
[] execVM "G.E.A.R.S\Laser.sqf";
sleep 1;
[] execVM "G.E.A.R.S\Radio.sqf";
sleep 1;
[] execVM "G.E.A.R.S\Scopes.sqf";
sleep 1;
[] execVM "G.E.A.R.S\Tablet.sqf";
sleep 1;
[] execVM "G.E.A.R.S\UAV.sqf";
sleep 1;
[] execVM "G.E.A.R.S\NVGs.sqf";
sleep 1;
[] execVM "G.E.A.R.S\Static.sqf";
sleep 1;
[] execVM "G.E.A.R.S\Ghillie.sqf";
sleep 1;
[] execVM "G.E.A.R.S\Banned_Items.sqf";
sleep 1;
[] execVM "G.E.A.R.S\Tool.sqf";
sleep 1;
[] execVM "G.E.A.R.S\Ladder.sqf";
sleep 1;