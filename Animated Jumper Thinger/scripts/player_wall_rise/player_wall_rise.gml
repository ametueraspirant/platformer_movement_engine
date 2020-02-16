image_speed = (ySpeed - 1)/(-jumpPower*0.4);

if(ySpeed > 0){
	player_where_set(OnWhere.onWall, DoWall.isFall);
	return;
}

if(!place_meeting(x + runDir, y, colliderParent)){
	player_where_set(OnWhere.onAir, DoAir.isRise);
	return;
}

if(keyJumpTap and stamina > 0){
	ySpeed -= jumpPower * 0.8;
	stamina -= 50;
}

if(place_meeting(x + runDir, y, ledgeCollider) and inst != noone and keyRight - keyLeft == runDir){
	ledgeTouch = inst;
	if(y < ledgeTouch.bbox_top){
		player_where_set(OnWhere.onLedge, DoLedge.isPull);
		return;
	}else if(bbox_top < ledgeTouch.bbox_top and keyRight - keyLeft == runDir){
		player_where_set(OnWhere.onLedge, DoLedge.isHang);
		return;
	}
}

if(place_meeting(x + 1, y, colliderParent)){
	if(keyLeft and leftDashBuff >  0){
		ySpeed += -ySpeed * 0.3 - abs(savedXSpeed) * 0.4 - jumpPower * 0.6;
		xSpeed += ySpeed * 0.2 - savedXSpeed * 0.4 - jumpPower * 0.5;
		player_where_set(OnWhere.onAir, DoAir.isRise);
		return;
	}
} else if(place_meeting(x - 1, y, colliderParent)){
	if(keyRight and rightDashBuff > 0){
		ySpeed += -ySpeed * 0.3 - abs(savedXSpeed) * 0.4 - jumpPower * 0.6;
		xSpeed += -ySpeed * 0.2  - savedXSpeed * 0.4 + jumpPower * 0.5;
		player_where_set(OnWhere.onAir, DoAir.isRise);
		return;
	}
}
