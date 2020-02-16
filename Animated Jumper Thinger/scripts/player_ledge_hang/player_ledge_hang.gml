if(animation_end() and image_speed > 0.5){
	image_speed -= 0.1;
}

y = ledgeTouch.y
if(runDir == 1){
	x = ledgeTouch.bbox_left - (bbox_right - x) - 1;
} else if(runDir == -1){
	x = ledgeTouch.bbox_right - (bbox_left - x) + 1;
}

if(place_meeting(x, y + 1, colliderParent)){
	if(keyRight - keyLeft == runDir){
		player_where_set(OnWhere.onLedge, DoLedge.isPull);
		return;
	} else {
		x -= runDir * 3;
		player_where_set(OnWhere.onAir, DoAir.isFall);
		return;
	}
}

if(keyJump and jumpBuff > 0){
	player_where_set(OnWhere.onLedge, DoLedge.isPull);
	return;
}

if(keyDuckTap){
	ySpeed += jumpPower * 0.2;
	xSpeed += runDir * -jumpPower * 0.4;
	ledgeTouch = noone;
	player_where_set(OnWhere.onAir, DoAir.isFall);
	return;
}
