/// @description Insert description here
// You can write your code in this editor
if (cloud_timer > 0)
	cloud_timer--;
else
{
	var _inst = instance_create_layer(view_wport[0], irandom_range(min_height, max_height), "Instances", objItemCloud);
		_inst.xspeed = -0.5;
	cloud_timer = random_range(300, 500);
}
