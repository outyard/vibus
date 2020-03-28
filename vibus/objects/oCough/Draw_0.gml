var _alpha = 1;
if (timer > 20) {
	_alpha -= (timer-20)/20;
}

var _xscale = 1;
if (timer < 5) {
	_xscale *= timer/5;
}

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, _alpha);