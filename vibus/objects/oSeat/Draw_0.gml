var _x = x;
var _scale = image_xscale;

if (eject) {
	var _force = clamp(ejectTimer*ejectTimer*ejectTimer, 0, 30);
	
	if (ejectTimer > 35) {
		_force *= 1-(ejectTimer-35)/10
	}
	
	_x += ejectSide * _force;
	_scale = 1 + _force/200;
}

draw_sprite_ext(sprite_index, image_index, _x + oBus.xbrum, y + oBus.ybrum, _scale, _scale, 0, c_white, 1);