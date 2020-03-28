if (eject) {
	ejectTimer++;	
	
	if (ejectTimer > 45) {
		ejectTimer = 0;
		eject = false;
	}
	depth = startDepth-1;
}
else {
	depth = startDepth;	
}