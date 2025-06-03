/// @description Insert description here
// Handle Y collision regardless of state (used for things like death):
var _sub_pixel = 0.5;
var _pixel_check = _sub_pixel * sign(yspeed);
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
y += yspeed;
yspeed += grav;

if (drop_on_enemy)
{
	var _inst = collision_line(x, y, x, y + 770, target, false, true);
	if (_inst != noone)
	{
		if (!drop)
			drop = true;
	}
}

if (drop)
	grav = 0.85;
else
	grav = 0;
