if(image_index > image_number - 1){
	image_speed = 0;
}
if(ySpeed >= 0){
	player_where_set(OnWhere.onAir, DoAir.isFall);
	return;
} else if(!keyJump and ySpeed <= -1){
	ySpeed = -jumpPower * 0.2 + ySpeed * 0.1;
	player_where_set(OnWhere.onAir, DoAir.isFall);
	return;
}
if(place_meeting(x + 2 * xSpeed, y, colliderParent)){
	savedXSpeed = xSpeed;
	savedYSpeed = ySpeed;
}
if(place_meeting(x + runDir, y, colliderParent)){
	player_where_set(OnWhere.onWall, DoWall.isRise);
	return;
}
