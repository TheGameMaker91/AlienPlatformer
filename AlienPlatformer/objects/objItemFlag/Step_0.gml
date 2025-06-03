/// @description Insert description here
// You can write your code in this editor
if (!captured)
{
	sprite_index = sprFlagHanging;
	image_index = flag_color;
}
else
{
	sprite_index = sprFlagCaptured;
	image_index = clamp(image_index, flag_color * 2, (flag_color * 2) + 1);
	checkpoint_x = x;
	checkpoint_y = y;
	
	flag_timer--;
	if (flag_timer <= 0)
	{
		if (image_index < (flag_color * 2) + 1)
			image_index++;
		else
			image_index = flag_color * 2;
		flag_timer = 15;
	}
}
