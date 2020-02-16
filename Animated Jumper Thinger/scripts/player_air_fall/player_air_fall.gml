if(ySpeed > 0)fallTime++;

if(place_meeting(x, y + 1, colliderParent)){
	if(fallTime < room_speed * 0.65){
		player_where_set(OnWhere.onGround, DoGround.isLand);
		return;
	} else if(fallTime <= room_speed * 1.3){
		if((keyLeft or keyRight) and abs(xSpeed) >= 7){
			xSpeed += runDir * min(abs(xSpeed) * 0.1 + ySpeed * 0.2, maxRunSpeed);
			player_where_set(OnWhere.onGround, DoGround.isRoll);
			return;
		} else {
			player_where_set(OnWhere.onGround, DoGround.isHardLand);
			return;
		}
	} else {
		if(keyLeft and leftDashBuff and xSpeed < -7){
			player_where_set(OnWhere.onGround, DoGround.isRoll);
			return;
		} else if(keyRight and rightDashBuff and xSpeed > 7){
			player_where_set(OnWhere.onGround, DoGround.isRoll);
			return;
		} else {
			player_where_set(OnWhere.onGround, DoGround.isHardLand);
			return;
		}
	}
}

if(place_meeting(x + 2 * xSpeed, y, colliderParent)){
	savedXSpeed = xSpeed;
	savedYSpeed = ySpeed;
}
if(place_meeting(x + runDir, y, colliderParent)){
	player_where_set(OnWhere.onWall, DoWall.isFall);
	return;
}
