function player_state_normal()
{
	get_controls();

	move_dir += (right_key / 16) - (left_key / 16);
	if (move_dir < -1)
		move_dir = -1;
	if (move_dir > 1)
		move_dir = 1;
	
	if (!right_key && !left_key)
	{
		move_dir *= 0.90;
		image_index = 0;
		image_speed = 0;
	}
	
	if (move_dir != 0 && on_ground)
		facing_dir = move_dir;
	xspeed = move_dir * move_spd;		
	
	if (facing_dir < 0)
		facing_dir = -1;
	if (facing_dir > 0)
		facing_dir = 1;
	
	if (x < 36)
		x = 36;
	if (x > room_width - 36)
		x = room_width - 36;
	
	#region Handle falling in a bottomless pit
	// Check y-coord:
	if (y > room_height)
		if (global.die_on_level_exit)
			kill_player();
		else
			y = 0;
	
	#endregion
	#region Handle sprite control
	if (abs(xspeed) > 1)
	{
		image_speed = xspeed / 4;
		sprite_index = walk_spr;
	}
	else
		sprite_index = idle_spr;
	if (!on_ground)
		sprite_index = jump_spr;

	#endregion
	#region Handle collision with items
	// Collision with buttons:
	var _item = instance_place(x, y + yspeed, objItemButton);
	if (_item != noone && yspeed > 0)
	{
		if (!_item.pressed)
			_item.pressed = true;
	}
	
	// Check collision with coins:
	_item = instance_place(x, y, objItemCoin);
	if (_item != noone)
	{
		if (_item.item_index == 0)
		{
			global.coins++;
		}
		else if (_item.item_index == 1)
		{
			global.coins += 2;
		}
		else if (_item.item_index == 2)
		{
			global.coins += 5;
		}
		instance_destroy(_item);
	}
	
	// Check collision with flags:
	_item = instance_place(x, y, objItemFlag);
	if (_item != noone)
	{
		if (!_item.captured)
			_item.captured = true;
		start_x = _item.checkpoint_x;
		start_y = _item.checkpoint_y;
	}
	
	// Check collision with gems:
	_item = instance_place(x, y, objItemGem);
	if (_item != noone)
	{
		if (_item.gem_color == COLORS.BLUE)
			global.gems++;
		else if (global.gems == COLORS.GREEN)
			global.gems += 2;
		else if (global.gems == COLORS.RED)
			global.gems += 5;
		else if (global.gems == COLORS.YELLOW)
			global.gems += 10;
		instance_destroy(_item);
	}
	
	// Check collision with keys:
	_item = instance_place(x, y, objItemKey);
	if (_item != noone)
	{
		global.keys[_item.key_color]++;
		instance_destroy(_item);
	}
	
	// Check collision with mushroom:
	_item = instance_place(x, y, objItemMushroom);
	if (_item != noone)
	{
		if (_item.item_index == 0)
			global.lives++;
		else if (_item.item_index == 1)
			global.lives += 2;
		instance_destroy(_item);
	}
	
	// Check collision with spikes:
	_item = instance_place(x, y + 1, objItemSpikes);
	if (_item != noone && !invincible)
	{
		if (!hurt)
		{
			player_state = player_state_hurt;
		}
	}
	#endregion
	#region Handle invincibility
	if (invincible)
	{
		if (invincibility_frames > 0)
		{
			invincibility_frames--;
		}
		else
		{
			invincibility_frames = 30;
			invincible = false;
		}
	}
	#endregion
	#region Handle locks
	var _inst = collision_circle(x, y, 36, objLock, false, true);
	if (_inst != noone && keyboard_check_pressed(ord("E")))
	{
		// Check to see which type of lock it is (so we know which key to use):
		var _color = _inst.color;
		if (global.keys[_color] > 0)
		{
			global.keys[_color]--;
			_inst.locked = false;
		}
	}
	#endregion
}

function player_state_hurt()
{
	if (!hurt)
	{
		hurt_player();
		hurt = true;
		alarm[1] = 50;
	}	
}
