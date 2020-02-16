if(abs(xSpeed) >= 7){
	if(alarm[0] <= 0) alarm[0] = room_speed * 0.3;
} else {
	xSpeed = 0;
	if(alarm[0] <= 0) alarm[0] = room_speed * 0.8;
}
