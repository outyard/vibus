var _bob = sin(timer*0.1);

var _spr = coughing == false ? sprite_index : sPassengerEjected;
var _coughOff = 0;
if (coughing) {
	if (coughTimer < 15) {
		_coughOff = ease_quadInOut(0, -10, coughTimer, 15);
	} else {
		_coughOff = ease_backOut(-10, 0, coughTimer-15, 25, 5)
	}
}

var _x = x+oBus.xbrum;
var _y = y+_bob+_coughOff+oBus.ybrum;


draw_sprite_ext(_spr, image_index, _x, _y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

if (hat != -1) {
	draw_sprite_ext(sHats, hat, _x+oBus.xbrum, _y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}