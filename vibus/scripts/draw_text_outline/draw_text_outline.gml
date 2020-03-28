///@param x
///@param y
///@param text
///@param color
///@param alpha

var _x = argument0;
var _y = argument1;
var _text = argument2;
var _color = argument3;
var _alpha = argument4;

draw_set_color(c_black);
draw_text_color(_x -1, _y -1, _text, c_black, c_black, c_black, c_black, _alpha*_alpha);
draw_text_color(_x -1, _y +1, _text, c_black, c_black, c_black, c_black, _alpha*_alpha);
draw_text_color(_x +1, _y -1, _text, c_black, c_black, c_black, c_black, _alpha*_alpha);
draw_text_color(_x +1, _y +1, _text, c_black, c_black, c_black, c_black, _alpha*_alpha);

draw_text_color(_x, _y, _text, _color, _color, _color, _color, _alpha);