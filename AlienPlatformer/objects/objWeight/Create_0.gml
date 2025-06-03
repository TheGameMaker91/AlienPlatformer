/// @description Insert description here
// Inherit the parent event
event_inherited();

// Just set the properties of the weight object:
yspeed			= 0;
grav			= 0;		// This is set to 0 until we need the weight to be dropped.
drop			= false;	// Lets the weight know when to be dropped.
drop_on_enemy	= false;	// Determines whether or not to drop when an entity goes under it.
target			= noone;	// The target to detect.