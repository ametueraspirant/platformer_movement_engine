if(abs(xSpeed) > 3 and (keyLeft or keyRight)){
	player_where_set(OnWhere.onGround, DoGround.isRun);
	return;
}

if(keyJump and jumpBuff > 0){
	ySpeed -= jumpPower;
	player_where_set(OnWhere.onAir, DoAir.isRise);
	return;
}

if(!place_meeting(x, y + 1, colliderParent)){
	weight = defaultWeight * 0.2
	if(coyoteTime > 0) coyoteTime--;
	if(coyoteTime == 0){
		player_where_set(OnWhere.onAir, DoAir.isFall);
		return;
	}
}

if(keyDuck){
	player_where_set(OnWhere.onGround, DoGround.isCrouch);
	return;
}

if(place_meeting(x + runDir, y, wallCollider) and keyJump and jumpBuff > 0){
	y -= jumpPower *  0.85;
	player_where_set(OnWhere.onWall, DoWall.isRise);
	return;
}
