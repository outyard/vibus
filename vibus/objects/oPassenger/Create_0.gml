sick = irandom(3) == 0;
sickness = 0;

if (sick) {
	sickness = random_range(0.5, 1);	
}

enum PassengerState {
	Boarding,
	ChoosingSeat,
	Sitting,
	Leaving,
}

state = PassengerState.Boarding;
chosenSeat = noone;
spd = random_range(1.2, 2);
timer = random(pi*2);

coughing = false;
coughTimer = 0;
hat = -1;
image_xscale = random_range(0.9, 1.1);
image_yscale = random_range(0.9, 1.1);

leavingStep = 0;
closestExit = noone;

if (random(1) < 0.33) {
	hat = irandom(sprite_get_number(sHats)-1);	
}