xspd = 0;
yspd = 0;
z = 0;
zspd = 0;
rotspeed = random_range(-3, 3);
var _aud = audio_play_sound(choose(sndWee, sndAaa), 0, false);
audio_sound_pitch(_aud, random_range(0.8, 1.1));