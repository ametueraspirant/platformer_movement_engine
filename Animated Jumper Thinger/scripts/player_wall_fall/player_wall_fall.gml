if(ySpeed < wallMaxFall){
	maxFallSpeed = wallMaxFall;
	weight = wallWeight;
}

image_speed = (ySpeed + 3)/wallMaxFall;

if(!place_meeting(x + runDir, y, colliderParent)){
	player_where_set(OnWhere.onAir, DoAir.isFall);
	return;
}

if(keyHold){
	player_where_set(OnWhere.onWall, DoWall.isClimb);
	return;
}

if(place_meeting(x, y + 1, colliderParent)){
	x -= runDir * 3;
	runDir = -runDir;
	player_where_set(OnWhere.onGround, DoGround.isIdle);
	return;
}

if(place_meeting(x + runDir, y, ledgeCollider) and inst != noone and keyRight - keyLeft == runDir){
	if(bbox_top < ledgeTouch.bbox_top){
		player_where_set(OnWhere.onLedge, DoLedge.isPull);
		return;
	}else if(y < ledgeTouch.bbox_bottom and keyRight - keyLeft == runDir){
		player_where_set(OnWhere.onLedge, DoLedge.isHang);
		return;
	}
}

if(place_meeting(x + 1, y, colliderParent)){
	if(keyRight){
		maxFallSpeed = wallMaxFall * 0.3;
	} else {
		maxFallSpeed = wallMaxFall;
	}
	if(keyJump){
		if(keyLeft and leftDashBuff >  0){
			ySpeed += -ySpeed * 0.3 - abs(savedXSpeed) * 0.4 - jumpPower * 0.6;
			xSpeed += ySpeed * 0.2 - savedXSpeed * 0.4 - jumpPower * 0.5;
			player_where_set(OnWhere.onAir, DoAir.isRise);
			return;
		}
	} else {
		if(keyLeft and leftDashBuff > 0){
			ySpeed += ySpeed * 0.7 - jumpPower * 0.3;
			xSpeed += ySpeed * 0.7 - jumpPower * 0.3;
			player_where_set(OnWhere.onAir, DoAir.isRise);
			return;
		}
	}
} else if(place_meeting(x - 1, y, colliderParent)){
	if(keyLeft){
		maxFallSpeed = wallMaxFall * 0.3;
	} else {
		maxFallSpeed = wallMaxFall;
	}
	if(keyJump){
		if(keyRight and rightDashBuff > 0){
			ySpeed += -ySpeed * 0.3 - abs(savedXSpeed) * 0.4 - jumpPower * 0.6;
			xSpeed += -ySpeed * 0.2  - savedXSpeed * 0.4 + jumpPower * 0.5;
			player_where_set(OnWhere.onAir, DoAir.isRise);
			return;
		}
	} else {
		if(keyRight and rightDashBuff > 0){
			ySpeed += ySpeed * 0.7 - jumpPower * 0.3;
			xSpeed += -ySpeed * 0.7 + jumpPower * 0.3;
			player_where_set(OnWhere.onAir, DoAir.isRise);
			return;
		}
	}
}
