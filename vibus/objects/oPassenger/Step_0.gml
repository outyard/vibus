timer++;

if (state == PassengerState.Boarding) {
	// Go into the bus
	if (abs(x - oBusMiddle.x) < random(5)) {
		state = PassengerState.ChoosingSeat;
	} else {
		x += spd;
	}
}
if (state == PassengerState.ChoosingSeat) {
	// Choose a seat
	if (chosenSeat == noone) {
		// Choose a random seat
		var _seatCount = instance_number(oSeat);
		repeat(100) {
			var _inst = instance_find(oSeat, irandom(_seatCount-1));
			if (_inst.occupant == noone) {
				chosenSeat = _inst;
				_inst.occupant = id;
				break;
			}
		}	
	}
	// Go to the left
	else if abs((y - chosenSeat.y)) > 5  {
		y = shift_towards_value(y, spd, chosenSeat.y);
	}
	else {
		var _dist = point_distance(x, y, chosenSeat.x, chosenSeat.y);
		var _moveX = (chosenSeat.x - x) / _dist;
		var _moveY = (chosenSeat.y - y) / _dist;
		x += _moveX * spd;
		y += _moveY * spd;
		
		if (point_distance(x, y, chosenSeat.x, chosenSeat.y) < 2) {
			state = PassengerState.Sitting;	
		}
	}
}
if (state == PassengerState.Leaving) {
	if (instance_exists(chosenSeat)) {
		chosenSeat.occupant = noone;
		chosenSeat = noone;
	}
	
	if (leavingStep == 0) {
		x = shift_towards_value(x, spd, oBusMiddle.x);
		if (abs(x-oBusMiddle.x) < random(5)) {
			leavingStep = 1;
			closestExit = instance_nearest(x, y, oBusExit)
		}
	} else if (leavingStep == 1) {
		y = shift_towards_value(y, spd, closestExit.y);
		
		if (abs(y-closestExit.y) < random(5)) {
			leavingStep = 2;
		}
	} else {
		x -= spd;
		if (x < 40) {
			instance_destroy();	
		}
	}
}

if (sick) {
	if (random(550) < sickness && coughing == false) {
		coughing = true;
		coughTimer = 0;
	}
}

if (coughing) {
	coughTimer++;
	
	if (coughTimer == 20) {
		instance_create_depth(x, y, depth-1, oCough);
		
		with (oPassenger) {
			if (id == other.id) {
				continue;	
			}
			var _dist = (5+point_distance(x, y, other.x, other.y))/100;
			
			if (random(1) > _dist) {
				sick = true;
				sickness = clamp(sickness+0.1, 0, 2)
			}
		}
	}
	
	if (coughTimer > 40) {
		coughing = false;	
	}
}

depth = -y/3;