function controls_setup()
{
	buffer_time = 10;
	jump_key_buffered = 0;
	jump_key_buffer_timer = 0;
}

function get_controls()
{
	right_key			= keyboard_check(vk_right) + gamepad_button_check(0, gp_padr);
	right_key			= clamp(right_key, 0, 1);
	
	left_key			= keyboard_check(vk_left) + gamepad_button_check(0, gp_padl);
	left_key			= clamp(left_key, 0, 1);
	
	jump_key_pressed	= keyboard_check_pressed(vk_space) + gamepad_button_check_pressed(0, gp_face1);
	jump_key_pressed	= clamp(jump_key_pressed, 0, 1);
	
	jump_key			= keyboard_check(vk_space) + gamepad_button_check(0, gp_face1);
	jump_key			= clamp(jump_key, 0, 1);
	
	duck_key			= keyboard_check(vk_down);
	run_key				= keyboard_check(vk_shift);
	
	action_key			= keyboard_check_pressed(ord("E"));
	
	// Jump key buffering:
	if (jump_key_pressed)
	{
		jump_key_buffer_timer = buffer_time;
	}
	if (jump_key_buffer_timer > 0)
	{
		jump_key_buffered = true;
		jump_key_buffer_timer--;
	}
	else
	{
		jump_key_buffered = false;
	}
}

function explode()
{
	instance_destroy();
	
	// Create particle explosion...
}

function hurt_player(_amount)
{
	if (global.health > 0)
	{
		
		sprite_index		= sprPlayer1Hurt;
		if (facing_dir == 1)
			xspeed			= -1;
		else
			xspeed			= 1;
		yspeed				= -5;
		invincibility_frames= 150;
		invincible			= true;
		global.health		-= _amount;
	}
}

function kill_player()
{
	// We'll need to pause the game, play a sound, subrtact a life, and reset the level:
	if (!dead)
	{
		// This is, for the most part, temporary:
		global.lives--;
		if (facing_dir == 1)
			xspeed			= -1;
		else
			xspeed			= 1;
		yspeed				= -5;
		dead				= true;
		alarm[2]			= 30;
	}
}

function draw_text_shadowed(_x, _y, _text)
{
	draw_set_color(c_black);
	draw_text(_x + 2, _y + 2, _text);
	draw_set_color($efefef);
	draw_text(_x, _y, _text);
}

function level_is_castle()
{
	return (
		room == rmCastle_1A
	);
}
