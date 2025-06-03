/// @description Insert description here
// You can write your code in this editor
if (active)
{
	script_execute(player_state);
	
	if (!dead)
	{
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
	
		// Find a springboard:
		var _item = instance_place(x, y + yspeed, objItemSpringboard);
		if (_item != noone && yspeed > 0)
		{
			yspeed = -15;
			_item.image_speed = 0.5;
			set_on_ground(true);
		}
		
		// Get flattened by weights:
		_item = instance_place(x, y - 1, objWeight);
		if (on_ground)
			if (_item != noone)
				kill_player();
		else
			yspeed = -yspeed;
		
		// Gain a 1up when the player collects 50 coins:
		if (global.coins >= 50)
		{
			global.coins -= 50;
			global.lives++;
		}
		
		// For now, restart the game on game over:
		if (global.lives == 0)
			game_restart();
	}
	
	// Check if we're invincible:
	if (invincible)
		image_alpha = 0.5;
	else
		image_alpha = 1;
}
