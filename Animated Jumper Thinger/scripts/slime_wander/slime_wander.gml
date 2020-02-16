var decision = random(1);

switch(scoots){
	case 3:
	if(xSpeed < abs(1)){
		windupTimer--;
	}
	
	if(windupTimer = 0 and jumpFrames > 0){
		jumpFrames--;
		if(runDir = 1){
			inputRight = true;
		} else {
			inputLeft = true;
		}
	}
	if(jumpFrames = 0){
		inputLeft = false;
		inputRight = false;
		windupTimer = windupReset;
		jumpFrames = jumpReset;
		scoots--;
		if(decision <= 0.3){
			runDir = -runDir;
		}
	}
	break;
	
	case 2:
	if(xSpeed < abs(1)){
		windupTimer--;
	}
	
	if(windupTimer = 0 and jumpFrames > 0){
		jumpFrames--;
		if(runDir = 1){
			inputRight = true;
		} else {
			inputLeft = true;
		}
	}
	if(jumpFrames = 0){
		inputLeft = false;
		inputRight = false;
		windupTimer = windupReset;
		jumpFrames = jumpReset;
		scoots--;
		if(decision <= 0.3){
			runDir = -runDir;
		}
	}
	break;
	
	case 1:
	if(xSpeed < abs(1)){
		windupTimer--;
	}
	if(windupTimer = 0 and jumpFrames >=0){
		jumpFrames--;
		inputJump = true;
		if(runDir = 1){
			inputRight = true;
		} else {
			inputLeft = true;
		}
	}
	if(jumpFrames <= 0){
		inputLeft = false;
		inputRight = false;
		inputJump = false;
		windupTimer = windupReset;
		jumpFrames = jumpReset;
		scoots--;
		if(decision <= 0.3){
			runDir = -runDir;
		}
	}
	break;
	
	case 0:
	decisionTime--;
	if(decisionTime = 0){
		if(decision <= 0.7){
			decisionTime = irandom_range(room_speed * 1.5, room_speed * 2.5);
			scoots = irandom_range(1, baseScoots);
			if(decision <= 0.2){
				runDir = -runDir;
			}
		} else { 
			slime_where_set(MobIs.isStand);
			return;
		}
	}
	break;
	
}
