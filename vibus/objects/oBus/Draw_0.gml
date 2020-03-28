draw_sprite(sprite_index, image_index, x+xbrum, y+ybrum);



draw_set_font(fntScore);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text_outline(34, 720, string(points) + " points", c_white, 1);
var _sec = floor(timeLeft/60);
var _min = floor(_sec / 60);

_sec -= _min*60;

var _secStr = _sec <= 9 ? "0" + string(_sec) : string(_sec);

draw_text_outline(34, 760, string(_min) + ":" + _secStr, c_white, 1)
draw_text_outline(109, 760, "left", c_white, 1)