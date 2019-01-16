/*
Guided Missile script V.1.1 created by Barbuse, dec 2016

To use this script add the following code into a trigger:
nul=[target, targetPos, startLocation, missileType, missileLaunchingHeight] execVM "guidedMissile.sqf"
For exemple, if the target is laser designated by the player:
nul=[laserTarget player,[0,0,0], getPos startLocation, "M_Scalpel_AT", 500] execVM "guidedMissile.sqf"

Add module to zeus. Put in mission init.sqf. A marker with the ID "MissileStart" has to be placed in the mission.:
if (isClass (configFile >> "CfgPatches" >> "Ares")) then
{
	// Ares is loaded, register the custom module.
	["Fire Support", "Ship to Laser Missile", { [_this select 1, _this select 0, getMarkerPos "MisileStart", "M_Scalpel_AT", 500] execVM "guidedMissile.sqf" }] call Ares_fnc_RegisterCustomModule;
};

*/

//initializing parameters
_target = _this select 0;
_targetPos = _this select 1;
_startPos = _this select 2;
_missileType = _this select 3;
_missileHeight = _this select 4;
_delete = false;

//defining parameters
//the faster the target, the more checks it will need 100 is good for fast moving targets such as aircrafts
_perSecondsChecks = 100;
//actual speed of a AIM-54 Phoenix AA missile
_missileSpeed = 6174;//6174
_pos = [0,0,0];

//if no target is found -> exit
if (isNull _target) then {
	_delete = true;
	_veh = "HeliHEmpty" createVehicle _targetPos;
	hideObject _veh;
	_target = _veh;
};

//create missile and setting pos
_startPos = getPos _target;
_pos = [_startPos select 0, _startPos select 1, _missileHeight];

//creating missile
_missile = _missileType createVehicle _pos;


//ajusting missile pos while flying
while {alive _missile} do {
if (_missile distance _target > (_missileSpeed / 10)) then {
_dirHor = [_missile, _target] call BIS_fnc_DirTo;
_missile setDir _dirHor;

_dirVer = asin ((((getPosASL _missile) select 2) - ((getPosASL _target) select 2)) / (_target distance _missile));
_dirVer = (_dirVer * -1);
[_missile, _dirVer, 0] call BIS_fnc_setPitchBank;

_flyingTime = (_target distance _missile) / _missileSpeed;
_velocityX = (((getPosASL _target) select 0) - ((getPosASL _missile) select 0)) / _flyingTime;
_velocityY = (((getPosASL _target) select 1) - ((getPosASL _missile) select 1)) / _flyingTime;
_velocityZ = (((getPosASL _target) select 2) - ((getPosASL _missile) select 2)) / _flyingTime;
_missile setVelocity [_velocityX, _velocityY, _velocityZ];


sleep (1/ _perSecondsChecks);
};
};

if(_delete) then
{
	deleteVehicle _target;
};