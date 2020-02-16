y = ledgeTouch.y;
if(runDir == 1){
	x = ledgeTouch.bbox_left - (bbox_right - x);
} else if(runDir == -1){
	x = ledgeTouch.bbox_right - (bbox_left - x);
}

if(image_index > image_number - image_speed){
	y = ledgeTouch.bbox_top - (bbox_bottom - y);
	if(runDir == 1){
		x = ledgeTouch.bbox_left;
	} else if(runDir == -1){
		x = ledgeTouch.bbox_right;
	}
	ledgeTouch = noone;
	player_where_set(OnWhere.onGround, DoGround.isRoll);
	return;
}
