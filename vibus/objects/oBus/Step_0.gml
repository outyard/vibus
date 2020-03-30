timer++;

pointsAwardTimer++;

timeLeft--;

if (timeLeft <= 0 && gameOver = false) {
	var _inst = instance_create_depth(0, 0, -1006, oEndScreen);
	gameOver = true;
	timeLeft = 0;
}

if (gameOver) {
	timeLeft = 0;	
	pointsAwardTimer = 0;
	with oButton {
		disabled = true;	
	}
}

show_debug_message(mouse_x);
show_debug_message(mouse_y)

if (pointsAwardTimer >= 120) {
	pointsAwardTimer = 0;
	
	var _addition = 0;
	var _subtraction = 0;
	
	with oPassenger {
		_addition += 10;
		if (sick) {
			_subtraction += sickness*20;	
		}
	}
	
	var _mod = random_range(0.66, 1.5);
	_addition = round(_addition * _mod);
	carryingDeceasePoints = round(_subtraction * _mod);
	
	carryingDeceasePoints = min(carryingDeceasePoints, _addition);
	
	points += _addition;
	script_create_score_message("+" + string(_addition) + " : bus driving", _addition > 0 ? ColorGoodMessage : c_white)
}
if ((pointsAwardTimer) == 30) {
	if (carryingDeceasePoints > 0) {
		points -= carryingDeceasePoints;
		script_create_score_message("-" + string(carryingDeceasePoints) + " : carrying decease", ColorBadMessage)
	}
}

if (!onStop) {
	timeTillNextStop--;
	if (timeTillNextStop <= 0) {
		onStop = true;
		pitStopTimer = 0;
		audio_play_sound(sndPsh, 0, 0);
		audio_sound_gain(busSound, 0, 1000);
		alarm[0] = 70;
		passengersToCreate = irandom_range(3, 5 + clamp(floor(timer/12000), 0, 8));
		show_debug_message(passengersToCreate);
		passengerSpawnTimer = 0;
		
		with oPassenger {
			if (state != PassengerState.Sitting) {
				continue;	
			}
			if (random(1) < 0.15) {
				state = PassengerState.Leaving;	
			}
		}
	}
}


if (gameOver) {
	exit;	
}
if (onStop) {
	passengerSpawnTimer++;
	
	if (passengerSpawnTimer > 30) {
		if (passengersToCreate > 0) {
			passengerSpawnTimer = irandom(5 + passengersToCreate);
			passengersToCreate--;
			departExtraTime = 60;
			instance_create_depth(70 + random_range(-8, 8), choose(400, 180) + random_range(-8, 8), -1, oPassenger);
		} else {
			var _canGo = true;
			with oPassenger {
				if (state == PassengerState.Leaving) {
					_canGo = false;	
				}
			}
			
			pitStopTimer++;
			if (pitStopTimer < 90) {
				_canGo = false;	
			}
			
			if (_canGo) {	
				onStop = false;	
				busSound = audio_play_sound(sndBus, 0, true);
				audio_sound_gain(busSound, 0, 0);
				audio_sound_gain(busSound, 0.2, 1000);
				timeTillNextStop = irandom_range(20, 25) * 60;
				
				// Clamp it to victory screen so we always get victory right on a stop
				timeTillNextStop = min(timeLeft, timeTillNextStop);
			}
		}
	}
} else {
	xbrum = random_range(-1, 1);
	ybrum = random_range(-1, 1);
}