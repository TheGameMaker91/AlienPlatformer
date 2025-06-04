/// @description Insert description here
// handle screen wrap:
if (x < 0)
{
	var _cloud_height = irandom_range(72, 350);
	x = -128;
	y = floor(_cloud_height / 70) * 70;
}
x += xspeed;
