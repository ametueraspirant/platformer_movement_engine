/// @description steps
#region //movementsss
if(xSpeed > 0)runDir = 1;
else if(xSpeed < 0)runDir = -1;

debugInput = keyboard_check_pressed(inputDebug);

//horizontal movement and collision
if(inputRight and !place_meeting(x + 1, y, colliderParent)){
	if(xSpeed <= maxRunSpeed){
		xSpeed += accel;
	}
}
if(inputLeft and !place_meeting(x - 1, y, colliderParent)){
	if(xSpeed >= -maxRunSpeed){
		xSpeed -= accel;
	}
}
if(xSpeed != 0){
	if(abs(xSpeed) < 0.7 and ((!inputLeft and !inputRight) or (inputLeft and inputRight))){
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

#region //state machine
switch(patrolState){
	case MobIs.isStand:
	#region //standing
	slime_stand();
	#endregion
	break;
	
	case MobIs.isWander:
	#region //wandering
	slime_wander();
	#endregion
	break;
	
	case MobIs.isAlert:
	#region //alerting
	slime_alert();
	#endregion
	break;
	
	case MobIs.isPath:
	#region //pathing
	slime_path();
	#endregion
	break;
	
	case MobIs.isChase:
	#region //chasing
	slime_chase();
	#endregion
	break;
	
	case MobIs.isSearch:
	#region //searching
	slime_search();
	#endregion
	break;
	
	case MobIs.isAttack:
	#region //attacking
	slime_attack();
	#endregion
	break;
	
	case MobIs.isFall:
	#region //falling
	slime_fall();
	#endregion
	break;
}

#endregion

if(debugInput) slimeDebug = !slimeDebug;