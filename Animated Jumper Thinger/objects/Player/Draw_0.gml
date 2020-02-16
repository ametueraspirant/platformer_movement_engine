/// @description draw debuggin stuff
draw_sprite_ext(sprite_index, image_index, x, y, lookDir, image_yscale, image_angle, image_blend, image_alpha);

draw_set_halign(fa_center);
if(!moveTorial){
	draw_text(x, y - 64, "and make sure to tap sideways before falling to avoid hard landings");
	draw_text(x, y - 80, "duck while moving to slide, tap up while running up walls to dash, ");
	draw_text(x, y - 96, "Use WSAD to move, when on a wall hold up and tap away to jump, ");
}
