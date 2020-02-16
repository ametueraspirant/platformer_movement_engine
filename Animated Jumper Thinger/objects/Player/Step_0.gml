/// @description move the dude every frame

#region //movement inputs
//checks for if a button is held and tapped for input buffering
keyJump = keyboard_check(jumpKey);
keyJumpTap = keyboard_check_pressed(jumpKey);
keyLeft = keyboard_check(leftKey);
keyLeftTap = keyboard_check_pressed(leftKey);
keyRight = keyboard_check(rightKey);
keyRightTap = keyboard_check_pressed(rightKey);
keyDuck = keyboard_check(ducky);
keyDuckTap = keyboard_check_pressed(ducky);
keyTack = keyboard_check(tacky);
keyTackTap = keyboard_check_pressed(tacky);
keyBlock = keyboard_check(blockKey);
keyBlockTap = keyboard_check_pressed(blockKey);
keyDash = keyboard_check(dashKey);
keyDashTap = keyboard_check_pressed(dashKey);
keyHold = keyboard_check(holdKey);
keyHoldTap = keyboard_check_pressed(holdKey);
keyMenu = keyboard_check_pressed(menuKey);
keyDebug = keyboard_check_pressed(debugKey);
#endregion

#region //movement and collision
//stuff I can't think where else to put like the buffer code
if(xSpeed > 0)runDir = 1;
else if(xSpeed < 0)runDir = -1;
if(accel != 0){
	if(keyLeft and !keyRight)lookDir = -1;
	if(keyRight and !keyLeft)lookDir = 1;
}

if(jumpBuff >= 0)jumpBuff--;
if(leftDashBuff >= 0)leftDashBuff--;
if(rightDashBuff >= 0)rightDashBuff--;
if(duckBuff >= 0)duckBuff--;
if(attackBuff >= 0)attackBuff--;
if(blockBuff >= 0)blockBuff--;
if(neuDashBuff >=0)neuDashBuff--;

if(keyJumpTap and jumpBuff < 10){
	jumpBuff = 10;
}
if(keyLeftTap and leftDashBuff < 10){
	leftDashBuff = 10;
}
if(keyRightTap and rightDashBuff < 10){
	rightDashBuff = 10;
}
if(keyDashTap and neuDashBuff < 10){
	neuDashBuff = 10;
}
if(keyDuckTap and duckBuff < 10){
	duckBuff = 10;
}
if(keyTackTap and attackBuff < 10){
	attackBuff = 10;
}
if(keyBlockTap and blockBuff < 10){
	blockBuff = 10;
}

if(wallDo != DoWall.isClimb and stamina < baseStamina)stamina += 2;

//get the ID of the nearest ledge
inst = instance_place(x + runDir, y, ledgeCollider);
if(inst == noone)inst = instance_place(x + runDir, y + 1, ledgeCollider);
if(place_meeting(x + runDir, y + 1, ledgeCollider) and inst != noone){
	ledgeTouch = inst;
}
//horizontal movement and collision
if(keyRight and !place_meeting(x + 1, y, colliderParent)){
	if(xSpeed <= maxRunSpeed){
		xSpeed += accel;
	}
}
if(keyLeft and !place_meeting(x - 1, y, colliderParent)){
	if(xSpeed >= -maxRunSpeed){
		xSpeed -= accel;
	}
}
if(xSpeed != 0){
	if(abs(xSpeed) < 0.7 and ((!keyLeft and !keyRight) or (keyLeft and keyRight) or keyDuck)){
		xSpeed = 0;
	}
	xSpeed -= sign(xSpeed) * frict;
}
//falling and vertical collision
if(!place_meeting(x, y + ySpeed, colliderParent)){
	y += ySpeed;
	if(ySpeed <= maxFallSpeed){
		ySpeed += weight;
	}
} else {
	while(!place_meeting(x, y + sign(ySpeed), colliderParent)){
	y += sign(ySpeed);
	}
	ySpeed = 0
}
if(!place_meeting( x + xSpeed, y, colliderParent)){
	x += xSpeed;
} else {
	while(!place_meeting(x + sign(xSpeed), y, colliderParent)){
		x += sign(xSpeed);
	}
	xSpeed = 0;
}
#endregion

#region //movement machine
switch(whereOn){
	case OnWhere.onGround:
	#region //on the ground code
	switch(groundDo){
		case DoGround.isIdle:
		player_ground_idle();
		break;
		case DoGround.isRun:
		player_ground_run();
		break;
		case DoGround.isCrouch:
		player_ground_crouch();
		break;
		case DoGround.isCrouchWalk:
		player_ground_crouchwalk();
		break;
		case DoGround.isRoll:
		player_ground_roll();
		break;
		case DoGround.isSlide:
		player_ground_slide();
		break;
		case DoGround.isDash:
		player_ground_dash();
		break;
		case DoGround.isLand:
		player_ground_land();
		break;
		case DoGround.isHardLand:
		player_ground_hardland();
		break;
	}
	#endregion
	break;
	
	case OnWhere.onAir:
	#region //on the air code
	switch(airDo){
		case DoAir.isRise:
		player_air_rise();
		break;
		case DoAir.isFall:
		player_air_fall();
		break;
	}
	#endregion
	break;
	
	case OnWhere.onWall:
	#region //on the wall code
	switch(wallDo){
		case DoWall.isRise:
		player_wall_rise();
		break;
		case DoWall.isFall:
		player_wall_fall();
		break;
		case DoWall.isClimb:
		player_wall_climb();
		break;
	}
	#endregion
	break;
	
	case OnWhere.onLedge:
	#region //on the ledge code
	switch(ledgeDo){
		case DoLedge.isHang:
		player_ledge_hang();
		break;
		case DoLedge.isPull:
		player_ledge_pull();
		break;
	}
	#endregion
	break;
	
	case OnWhere.onSwim:
	#region //on the swim code
	
	#endregion
	break;
}
#endregion

//extrae extrae stuff all about it
if(keyboard_check(vk_anykey)) moveTorial = true;
if(keyDebug) debugIs = !debugIs;
