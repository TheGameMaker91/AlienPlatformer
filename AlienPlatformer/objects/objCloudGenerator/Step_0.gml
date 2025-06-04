/// @description Insert description here
// You can write your code in this editor
if (!level_is_castle())
{
	if (cloud_timer > 0)
		cloud_timer--;
	else
	{
		if (instance_number(objItemCloud) < max_clouds)
		{
			var _inst = instance_create_layer(room_width, irandom_range(min_height, max_height), "Instances", objItemCloud);
				_inst.xspeed = -0.5;
			cloud_timer = random_range(500, 1000);
		}
	}
}
