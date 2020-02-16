/// @description tribbleshooting
if(debugIs){
	draw_set_halign(fa_left);
	draw_text(20, 20, "airState: " + getAirStateString(whereOn));
	draw_text(20, 40, "previousAirState " + getAirStateString(lastOn));
	draw_text(15, 60, "sprite index: " + string(sprite_index));
	draw_text(20, 80, "saved xSpeed: " + string(savedXSpeed));
	draw_text(20, 100, "saved ySpeed: " + string(savedYSpeed));
	draw_text(20, 120, "speedState: " + string(speedState));
	draw_text(20, 140, "accel: " + string(accel));
	draw_text(20, 160, "frict: " + string(frict));
	draw_text(20, 180, "runDir: " + string(runDir));
	draw_text(20, 200, "lookDir: " + string(lookDir));
}