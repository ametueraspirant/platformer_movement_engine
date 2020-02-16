xSpeed = runDir * min(abs(xSpeed) * 0.97 + ySpeed * 0.97, maxRunSpeed);

if(!keyDuck or (abs(xSpeed) < 3)){
	if(sprite_index != PlayerSlideStand){
		sprite_index = PlayerSlideStand;
		image_index = 0;
		image_speed = 1;
	}
	if((image_index > image_number - 1)){
		if(!place_meeting(x, y - 29, colliderParent)){
			player_where_set(OnWhere.onGround, DoGround.isIdle);
			return;
		} else {
			player_where_set(OnWhere.onGround, DoGround.isCrouch);
			return;
		}
	}
}

if(!place_meeting(x, y + 1, colliderParent)){
	if(inst != noone and (keyRight - keyLeft) == -runDir){
		runDir = -runDir;
		lookDir = runDir;
		player_where_set(OnWhere.onLedge, DoLedge.isHang);
		return;
	} else {
		coyoteTime--;
		if(coyoteTime <= 0 and !place_meeting(x, y - 29, colliderParent)){
			player_where_set(OnWhere.onAir,  DoAir.isFall);
			return;
		}
	}
}
