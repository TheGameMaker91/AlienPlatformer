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
