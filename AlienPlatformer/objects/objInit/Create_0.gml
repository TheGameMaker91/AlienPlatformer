/// @description Insert description here
// Handle initial setup:
global.start_room	= rmCastle_1A;

var _inst;
_inst = objControl;
if (!instance_exists(_inst))
	instance_create_layer(0, 0, "Instances", _inst);

_inst = objCloudGenerator;
if (!instance_exists(_inst))
	instance_create_layer(0, 0, "Instances", _inst);
