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

idle_spr = sprPlayer1Idle;
walk_spr = sprPlayer1Walk;
jump_spr = sprPlayer1Jump;
facing_dir = 1;
move_dir = 0;
move_spd = 4;
xspeed = 0;
yspeed = 0;

grav = 0.275;
term_vel = 10;
jump_max = 2;
jump_count = 0;
jump_hold_timer = 0;
jump_hold_frames[0] = 18;
jspeed[0] = -5.5;
jump_hold_frames[1] = 10;
jspeed[1] = -4.5;
on_ground = true;

coyote_hang_frames = 4;
coyote_hang_timer = 0;
coyote_jump_frames = 5;
coyote_jump_timer = 0;

player_state = player_state_normal;
active = false;
start_x = x;
start_y = y;
invincibility_frames = 30;
invincible = false;
hurt = false;
dead = false;

// Active timer:
alarm[0] = 15;
