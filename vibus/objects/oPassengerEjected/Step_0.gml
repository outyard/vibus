x += xspd;
zspd-=0.5;
z += zspd;
if (z <= 0) {
	z = 0;
	zspd = 0;
	xspd = 0;
	rotspeed = 0;
	
	y+= oRoad.yspd;
	
}
image_angle += rotspeed;

if ( y < -100) {
	instance_destroy();	
}