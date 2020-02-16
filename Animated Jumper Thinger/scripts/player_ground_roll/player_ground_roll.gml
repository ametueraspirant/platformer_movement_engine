xSpeed = runDir * maxRunSpeed * 0.8;

if(animation_end()){
	if(keyDuck or place_meeting(x, y - 29, colliderParent)){
		player_where_set(OnWhere.onGround, DoGround.isCrouch);
		return;
	} else {
		player_where_set(OnWhere.onGround, DoGround.isIdle);
		return;
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
			player_where_set(OnWhere.onAir, DoAir.isFall);
			return;
		}
	}
}
