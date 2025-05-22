/// @description Insert description here
// You can write your code in this editor
get_controls();

move_dir = right_key - left_key;

if (move_dir != 0)
	facing_dir = move_dir;

xspeed = move_dir * move_spd;

#region Handle the x-collision & movement
// X Collision:
var _sub_pixel = 0.5;
if (place_meeting(x + xspeed, y, objSolid))
{
	if (!place_meeting(x + xspeed, y - abs(xspeed) - 1, objSolid))
	{
		while (place_meeting(x + xspeed, y, objSolid))
		{
			y -= _sub_pixel;
		}
	}
	else
	{
		var _pixel_check = _sub_pixel * sign(xspeed);
		while (!place_meeting(x + _pixel_check, y, objSolid))
		{
			x += _pixel_check;
		} 
		xspeed = 0;
	}
}

if (yspeed >= 0 && !place_meeting(x + xspeed, y + 1, objSolid) && place_meeting(x + xspeed, y + abs(xspeed) + 1, objSolid))
{
	while (!place_meeting(x + xspeed, y + _sub_pixel, objSolid))
	{
		y += _sub_pixel;
	}
}

x += xspeed;
#endregion
#region Handle the y-collision & movement
if (coyote_hang_timer > 0)
{
	coyote_hang_timer--;
}
else
{
	yspeed += grav;
	set_on_ground(false);
}

if (on_ground)
{
	jump_count = 0;
	jump_hold_timer = 0;
}
else
{
	if (jump_count == 0)
		jump_count = 1;
	
	coyote_hang_timer = 0;
}

// Jump:
if (jump_key_buffered && jump_count < jump_max)
{
	jump_key_buffered = false;
	jump_key_buffer_timer = 0;
	
	jump_count++; 
	
	// Set the jump hold timer:
	jump_hold_timer = jump_hold_frames[jump_count - 1];
	
	set_on_ground(false);
}

if (!jump_key)
{
	jump_hold_timer = 0;
}

// Jump based on the timer/holding the button:
if (jump_hold_timer > 0)
{
	yspeed = jspeed[jump_count - 1];
	jump_hold_timer--;
}

// Cap falling speed:
if (yspeed > term_vel)
	yspeed = term_vel;

// Y collision:
if (place_meeting(x, y + yspeed, objSolid))
{
	var _pixel_check = _sub_pixel * sign(yspeed);
	while (!place_meeting(x, y + _pixel_check, objSolid))
	{
		y += _pixel_check;
	}
	
	if (yspeed < 0)
		jump_hold_timer = 0;
	
	yspeed = 0;
}

// Set if i'm on the ground:
if (yspeed >= 0 && place_meeting(x, y + 1, objSolid))
{
	set_on_ground(true);
}

y += yspeed;
#endregion
#region Handle sprite control
if (abs(xspeed) > 0)
	sprite_index = walk_spr
if (xspeed == 0)
	sprite_index = idle_spr;
if (!on_ground)
	sprite_index = jump_spr;

#endregion
