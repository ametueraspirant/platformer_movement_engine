image_speed = (xSpeed + 1) / maxRunSpeed;

if(abs(xSpeed) < 3 or (!keyLeft and !keyRight)){
	player_where_set(OnWhere.onGround, DoGround.isIdle);
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
	if(abs(xSpeed) < 5){
		player_where_set(OnWhere.onGround, DoGround.isCrouchWalk);
		return;
	} else {
		player_where_set(OnWhere.onGround, DoGround.isSlide);
		return;
	}
}
