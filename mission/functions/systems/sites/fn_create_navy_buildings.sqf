/*
	File: fn_create_navy_buildings.sqf
	Author: Cerebral
	Modified: Dirt 
	Public: idk
	
	Description:
		Creates a navy encampment at the given position.
	
	Parameter(s):
		_position - Position of the navy [Position3D]
	
	Returns:
		Array containing the navy buildings [Array]
	
	Example(s): none
	
	O_Heli_Light_02_dynamicLoadout_F 
*/

params ["_position"];

vn_mf_navy_compositions = [
	[ 
	["class vn_o_boat_03_01",[1.56641,-12.1094,2],0,1,0,[0,0],"","",true,false] 
	],
	
	[
	["class vn_o_boat_03_01",[1.14355,3.16797,2],0,1,0,[-0.151951,0.458424],"","",true,false]
	],
	
	[
	["class vn_o_boat_03_01",[14.8896,-11.1729,2],0,1,0,[0,0],"","",true,false]
	]

];

private _randomAngle = [0,360] call BIS_fnc_randomInt;

private _navyObjects = [_position, _randomAngle, selectRandom vn_mf_navy_compositions] call BIS_fnc_objectsMapper; //vn_mf_aa_compositions
{

	if (typeof _x == "O_Boat_Armed_01_hmg_F" || typeof _x == "O_APC_Wheeled_02_rcws_v2_F" || typeof _x == "class vn_o_boat_03_01") then {
		//_x allowDamage false;
		//_x setPos [getPos _x # 0, getPos _x # 1, 1];
		//_x setVectorUp (surfaceNormal getPos _x);
		//_x allowDamage true;
		_x enableSimulation true;
		createVehicleCrew _x;
	};
	
} forEach _navyObjects;

_navyObjects 