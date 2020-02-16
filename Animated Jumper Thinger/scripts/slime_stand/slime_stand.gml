if(decisionTime > 0)decisionTime--;
var decision = random(1);

//moseying around
if(decisionTime = 0){
	if(decision <= 0.35){
		decisionTime = irandom_range(room_speed * 1.5, room_speed * 3);
		slime_where_set(MobIs.isWander);
		return;
	} else {
		decisionTime = irandom_range(room_speed * 1.5, room_speed * 3);
		if(decision <= 0.5){
			runDir = -runDir;
		}
	}
}

//see player
/*if(point_distance(x, y, Player.x, Player.y) < 500){
	slime_where_set(MobIs.isChase);
	return;
}*/

//see slime commotion *future project*
