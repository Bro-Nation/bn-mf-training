/*
    File: fn_sites_create_navy.sqf
    Author: Savage Game Design
	Modified: Dirt
    Public: idk
    
    Description:
		Creates a new naval site in the given location.
    
    Parameter(s):
		_pos - Position to spawn the HQ site at
    
    Returns:
        Function reached the end [BOOL]
    
    Example(s):
        [markerPos "myHq"] call vn_mf_fnc_sites_create_navy
*/



params ["_pos"];

[
	"navy", 
	_pos,
	"factory",
	//Setup Code
	{
		params ["_siteStore"];
		private _siteId = _siteStore getVariable "site_id";
		private _sitePos = getPos _siteStore;
		private _spawnPos = _sitePos;//[_sitePos #0, _sitePos #1, (_sitePos #2)+3];
		
		private _objects = [_spawnPos] call vn_mf_fnc_create_navy_buildings;
		
		
		{
			if(_x isKindOf "StaticWeapon" || _x isKindOf "LandVehicle" || _x isKindOf "Air" || typeOf _x in ['Land_Net_Fence_Gate_F'] || _x isKindOf "Building") then {
				[_x, true] call para_s_fnc_enable_dynamic_sim;
			};

			if(typeof _x == "O_Boat_Armed_01_hmg_F" || typeof _x == "O_APC_Wheeled_02_rcws_v2_F" || typeof _x == "class vn_o_boat_03_01") then {
				_x enableSimulation true;
				createVehicleCrew _x;
				_x setVehicleRadar 1;
				_x setVehicleReportOwnPosition true;
				_x setVehicleReceiveRemoteTargets true;
				_x setVehicleReportRemoteTargets true;
			};
		} forEach _objects;
		
		vn_site_objects append _objects;

		_objects apply {
			[_x, true] call para_s_fnc_enable_dynamic_sim;
			createVehicleCrew _x;
		};
		
		
		private _markerPos = _objects getPos [10 + random 20, random 360];//_spawnPos getPos [10 + random 20, random 360];
		
		private _navyMarker = createMarker [format ["AA_%1", _siteId], _markerPos];
		_navyMarker setMarkerType "o_antiair";
		_navyMarker setMarkerText "AA"; 
		_navyMarker setMarkerAlpha 0;
		
		
		
		//70% chance to spawn an ambush
		if (random 1 < 0.7) then {
			_siteStore setVariable ["aiObjectives", [[_spawnPos, 1, 1] call para_s_fnc_ai_obj_request_ambush]];
		} else {
			_siteStore setVariable ["aiObjectives", [[_spawnPos, 1, 1] call para_s_fnc_ai_obj_request_defend]];
		};

		_siteStore setVariable ["aiObjectives", []];
		_siteStore setVariable ["markers", [_navyMarker]];
		_siteStore setVariable ["objectsToDestroy", _objects];
		
	},
	//Teardown condition check code
	{
		//Check if we need to teardown every 15 seconds.
		15 call _fnc_periodicallyAttemptTeardown;
	},
	//Teardown condition
	{
		params ["_siteStore"];
		//Teardown when destroyed
		(_siteStore getVariable "aiObjectives" findIf {alive _x} == -1)
	},
	//Teardown code
	{
		params ["_siteStore"];

		{
			deleteMarker _x;
		} forEach (_siteStore getVariable "markers");

		{
			deleteVehicle _x;
		} forEach (_siteStore getVariable "objectsToDestroy");

		{
			[_x] call para_s_fnc_ai_obj_finish_objective;
		} forEach (_siteStore getVariable ["aiObjectives", []]);
	}
] call vn_mf_fnc_sites_create_site;

