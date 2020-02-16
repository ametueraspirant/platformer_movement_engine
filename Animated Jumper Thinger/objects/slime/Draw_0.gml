/// @description Drawe de slime
draw_sprite_ext(sprite_index, image_index, x, y, runDir, image_yscale, image_angle, image_blend, image_alpha);

if(slimeDebug){
	draw_set_halign(fa_center);
	draw_text(x, y - 20, "xSpeed: " + string(xSpeed));
	draw_text(x, y - 40, "ySpeed: " + string(ySpeed));
	draw_text(x, y - 60, "windupTimer: " + string(windupTimer));
	draw_text(x, y - 80, "jumpFrames: " + string(jumpFrames));
	draw_text(x, y - 100, "decisionTime: " + string(decisionTime));
	draw_text(x, y - 120, "scoots: " + string(scoots));
	draw_text(x, y - 140, "patrolState: " + getMobStateString(patrolState));
	draw_text(x, y - 160, "target: " + string(target));
	draw_text(x, y - 180, "runDir: " + string(runDir));
}
