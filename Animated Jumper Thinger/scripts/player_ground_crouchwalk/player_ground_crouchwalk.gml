image_speed = (xSpeed + 1) / maxRunSpeed;

if(!keyLeft and !keyRight){
	player_where_set(OnWhere.onGround, DoGround.isCrouch);
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

if(!keyDuck and !place_meeting(x, y - 29, colliderParent)){
	player_where_set(OnWhere.onGround, DoGround.isRun);
	return;
}
