/*
	File: fn_action_vehspawner_show_spawn_point.sqf
	Author: 'DJ' Dijksterhuis
	Public: No
	
	Description:
		MACV players can walk up to a vehicle spawner sign and force the vehicle position back to spawn point.
	
	Parameter(s): none
	
	Returns:
	
	Example(s):
		call vn_mf_fnc_action_macv_force_reset_vehicle;
*/

// player is curator
// looking at a spawner sign
// less than 3m from the sign
// vehicle for spawn point is recorded as IDLE client side

// private _role = assignedVehicleRole player select 0;

private _conditionToShow = [
	// player is in a vehicle
	"(vehicle player != player)",
	// player is the driver
	"((assignedVehicleRole player select 0) == 'driver')",
	// player's vehicle was created by mike force veh spawner system
	"!(((vehicle player) getVariable ['veh_asset_spawnPointId', false]) isEqualTo false)",
	// draw3d is not already shown in the display
	"((player getVariable ['veh_asset_spawnPoint_draw3d_active', false]) isEqualTo false)"
] joinString " && ";

player addAction
[
	"Locate Vehicle's Spawn Point",  // title
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		private _id = (vehicle player) getVariable ['veh_asset_spawnPointId', false];
		private _spawnPos = vn_mf_veh_asset_spawn_points_client get _id get 'spawnLocation' get 'pos';
		private _iconPos = [_spawnPos select 0, _spawnPos select 1, 1];  // reset z position

		// stop player spamming the event handler and draw icon
		player setVariable ["veh_asset_spawnPoint_draw3d_active", true];

		// spawn so we can sleep
		// is this needed?
		private _scriptHandle = [getPos player, _iconPos] spawn {

			private _eventHandlerId = addMissionEventHandler [
				"draw3D",
				{
					drawIcon3D
					[
						"\A3\ui_f\data\map\markers\handdrawn\end_CA.paa",  // icon
						[1, 1, 1, 0.6],  // color rgb-a
						_thisArgs select 1,  // AGL position
						1,  // width
						1,  // height
						0,  // angle
						"Vehicle's Spawn Point",  // text
						2,  // 0 - noshadow, 1 - shadow, 2 - outline
						0.035,  // text size
						"RobotoCondensed",  // font
						"center",  // text align
						true,  // drawSideArrows
						0,  // text offset x
						0  // text offset y
					];
				},
				[_this select 0, _this select 1]
			];
			// wait then remove the event handler -- remove the icon from display
			sleep 10;
			removeMissionEventHandler ["draw3D", _eventHandlerId];
		};

		// once script is executed let player draw icon in ui again
		waitUntil { scriptDone _scriptHandle };
		player setVariable ["veh_asset_spawnPoint_draw3d_active", false];

	},  // script
	nil,  // arguments
	0,  // priority -- set to 0 because not going to be needed in combat
	false,  // showWindow
	true,  // hideOnUse
	"CommandingMenuSelect9",  // shortcut
	_conditionToShow,  // condition
	5,  // radius
	false,  // unconscious
	"",  // selection
	""  // memoryPoint
];