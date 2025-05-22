/// @description Insert description here
// You can write your code in this editor
function set_on_ground(_val = true)
{
	if (_val)
	{
		on_ground = true;
		coyote_hang_timer = coyote_hang_frames;
	}
	else
	{
		on_ground = false;
		coyote_hang_timer = 0;
	}
}

controls_setup();

move_dir = 0;
move_spd = 4;
xspeed = 0;
yspeed = 0;

grav = 0.275;
term_vel = 4;
jump_max = 2;
jump_count = 0;
jump_hold_timer = 0;
jump_hold_frames[0] = 18;
jspeed[0] = -5.5;
jump_hold_frames[1] = 10;
jspeed[1] = -3.5;
on_ground = true;

coyote_hang_frames = 4;
coyote_hang_timer = 0;
coyote_jump_frames = 5;
coyote_jump_timer = 0;
