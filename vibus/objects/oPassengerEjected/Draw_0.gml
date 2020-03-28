var _y = y-z;
draw_sprite_ext(sprite_index, image_index, x, _y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (hat != -1) {
	draw_sprite_ext(sHats, hat, x, _y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}