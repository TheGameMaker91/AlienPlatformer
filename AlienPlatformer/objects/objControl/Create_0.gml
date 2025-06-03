/// @description Insert description here
// Check if the current room is the init room:
if (room == rmInit)
{
	// If it is, then we need to do some setup. Firtsly, we need to go to the start room:
	if (room_exists(global.start_room))
	{
		room_goto(global.start_room);
	}
}

// Declare global variables:
global.die_on_level_exit	= true;
global.score				= 0;
global.lives				= 3;
global.health				= 3;
global.coins				= 0;
global.gems					= 0;
global.keys[COLORS.BLUE]	= 0;
global.keys[COLORS.GREEN]	= 0;
global.keys[COLORS.RED]		= 0;
global.keys[COLORS.YELLOW]	= 0;

draw_set_font(fntGameTextLg);
