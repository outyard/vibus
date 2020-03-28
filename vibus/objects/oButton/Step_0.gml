pressTime--;

if (disabled) {
	return;	
}

if (point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom)) {
	image_blend = c_gray;
	if (mouse_check_button_pressed(mb_left)) {
		if (targetSeat.eject == false) {
			audio_play_sound(sndFjong, 0, false);
			pressTime = 30;
			var _seat = targetSeat;
			_seat.eject = true;
			var _occupant = _seat.occupant;
			if (instance_exists(_occupant) && _occupant.state == PassengerState.Sitting) {
				if (_occupant.sick) {
					oBus.points += 100;
					script_create_score_message("+100 : Ejected sick passenger", ColorGoodMessage);
				} else {
					var _diff = oBus.points - max(oBus.points - 100, 0)
					oBus.points -= _diff;
					script_create_score_message("-" + string(_diff) + " : Ejected healthy passenger", ColorBadMessage);
				}
				
				
				_seat.occupant = noone;
				var _inst = instance_create_depth(_occupant.x, _occupant.y, -100, oPassengerEjected);
				_inst.hat = _occupant.hat;
				_inst.image_xscale = _occupant.image_xscale;
				_inst.image_yscale = _occupant.image_yscale;
				_inst.xspd = _seat.ejectSide*10;
				_inst.zspd = 10;
				instance_destroy(_occupant);	
			}
		}
	} 
} else {
	image_blend = c_white;	
}

if (pressTime > 0) {
	sprite_index = sButtonMarked;	
} else {
	sprite_index = sButton;
}