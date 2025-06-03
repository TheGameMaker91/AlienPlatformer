/// @description Insert description here
// You can write your code in this editor
if (ready_to_boom)
{
	if (boom_timer > 0)
		boom_timer--;
	
	sprite_index = sprBombFlash;
}

if (boom_timer <= 0)
	boom = true;

if (boom)
{
	explode();
}
