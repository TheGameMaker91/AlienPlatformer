/// @description Insert description here
// You can write your code in this editor
draw_text_shadowed(
	0, 0,
	$"Score: { global.score }\n" +
	$"Lives: { global.lives }\n" +
	$"Health: { global.health }\n" +
	$"Coins: x{ global.coins }\n" +
	$"Gems: x{ global.gems }"
);

var _w, _h, _x, _y;
	_w = display_get_gui_width();
	_h = display_get_gui_height();
	_x = 0;
	_y = _h - 70;
if (global.keys[COLORS.BLUE] > 0)
{
	draw_sprite(sprKey, COLORS.BLUE, _x, _y);
	draw_text_shadowed(_x + 70, _y + 14, $": x{ global.keys[COLORS.BLUE] }");
	_x = _x + 144;
}
if (global.keys[COLORS.GREEN] > 0)
{
	draw_sprite(sprKey, COLORS.GREEN, _x, _y);
	draw_text_shadowed(_x + 72, _y + 14, $": x{ global.keys[COLORS.GREEN] }");
	_x = _x + 144;
}
if (global.keys[COLORS.RED] > 0)
{
	draw_sprite(sprKey, COLORS.RED, _x, _y);
	draw_text_shadowed(_x + 72, _y + 14, $": x{ global.keys[COLORS.RED] }");
	_x = _x + 144;
}
if (global.keys[COLORS.YELLOW] > 0)
{
	draw_sprite(sprKey, COLORS.YELLOW, _x, _y);
	draw_text_shadowed(_x + 72, _y + 14, $": x{ global.keys[COLORS.YELLOW] }");
	_x = 0;
}
