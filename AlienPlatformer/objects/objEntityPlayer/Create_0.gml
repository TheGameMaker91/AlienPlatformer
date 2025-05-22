/// @description Insert description here
// You can write your code in this editor
controls_setup();

move_dir = 0;
move_spd = 2;
xspeed = 0;
yspeed = 0;

grav = 0.275;
term_vel = 4;
jump_max = 2;
jump_count = 0;
jump_hold_timer = 0;
jump_hold_frames[0] = 18;
jspeed[0] = -5.5;
jump_hold_frames[1] = 10;
jspeed[1] = -3.5;
on_ground = true;
