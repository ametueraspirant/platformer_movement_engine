stamina--;
if(stamina = 0 ){
	player_where_set(OnWhere.onWall,  DoWall.isFall);
	return;
}

if(keyJump and !keyDuck){
	y -= jumpPower / 3;
}

if(keyDuck and !keyJump){
	y += jumpPower / 3;
}

if(place_meeting(x + 1, y, colliderParent)){
	if(keyLeft and leftDashBuff > 0){
		ySpeed += -ySpeed * 0.7 - jumpPower * 0.3;
		xSpeed += ySpeed * 0.7 - jumpPower * 0.3;
		player_where_set(OnWhere.onAir, DoAir.isRise);
		return;
	}
} else if(place_meeting(x - 1, y, colliderParent)){
	if(keyRight and rightDashBuff > 0){
		ySpeed += -ySpeed * 0.7 - jumpPower * 0.3;
		xSpeed += -ySpeed * 0.7 + jumpPower * 0.3;
		player_where_set(OnWhere.onAir, DoAir.isRise);
		return;
	}
}

if(keyHoldTap){
	player_where_set(OnWhere.onWall, DoWall.isFall);
	return;
}
