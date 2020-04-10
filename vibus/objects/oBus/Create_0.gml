randomize();
timeTillNextStop = 10;
pitStopTimer = 0;
onStop = false;
passengersToCreate = 0;
passengerSpawnTimer = 0;
departExtraTime = 0;
timer = 0;

xbrum = 0;
ybrum = 0;
busSound = audio_play_sound(sndBus, 0, true);
audio_sound_gain(busSound, 0.2, 0);

points = 0;
pointsAwardTimer = 0;
timeLeft = 3 * 60 * 60;

gameOver = false;

carryingDiseasePoints = 0;