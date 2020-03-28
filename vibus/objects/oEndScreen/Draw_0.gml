draw_set_halign(fa_center);
draw_set_font(fntWin)

draw_text_outline(600, 300, "Your route has ended!", c_white, 1);
draw_text_outline(600, 370, "You got " + string(oBus.points) + " points!", c_white, 1);

if (timer > 90) {
	draw_text_outline(600, 440, "Press anywhere to play again", c_white, 1);
}