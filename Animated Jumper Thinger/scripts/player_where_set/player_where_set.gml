lastOn = whereOn;
groundDo = DoGround.isNot;
airDo = DoAir.isNot;
wallDo = DoWall.isNot;
ledgeDo = DoLedge.isNot;
swimDo = DoSwim.isNot;

switch(argument0){
	#region //main switches
	case OnWhere.onGround:
	y -= 1;
	savedXSpeed = 7;
	savedYSpeed = -7;
	weight = defaultWeight;
	maxFallSpeed = defaultMaxFall;
	coyoteTime = defaultCoyote;
	fallTime = 0;
	whereOn = OnWhere.onGround;
	switch(argument1){
		#region //ground switch
		case DoGround.isIdle:
		sprite_index = PlayerIdle1;
		image_speed = 1;
		accel = groundAccel;
		frict = groundFrict;
		maxRunSpeed = defaultMaxRun;
		groundDo = DoGround.isIdle;
		break;
		
		case DoGround.isRun:
		sprite_index = PlayerRun;
		image_speed = (xSpeed + 1) / maxRunSpeed;
		accel = groundAccel;
		frict = groundFrict;
		maxRunSpeed = defaultMaxRun;
		groundDo = DoGround.isRun;
		break;
		
		case DoGround.isCrouch:
		sprite_index = PlayerIdleCrouch;
		image_speed = 1;
		frict = crouchFrict;
		accel = 0;
		maxRunSpeed = crouchMaxRun;
		groundDo = DoGround.isCrouch;
		break;
		
		case DoGround.isCrouchWalk:
		sprite_index = PlayerCrouchWalk;
		image_speed = (xSpeed + 1) / maxRunSpeed;
		frict = crouchFrict;
		accel = crouchAccel;
		maxRunSpeed = crouchMaxRun;
		groundDo = DoGround.isCrouchWalk;
		break;
		
		case DoGround.isRoll:
		sprite_index = PlayerRoll;
		image_index = 0;
		image_speed = 1;
		weight = defaultWeight;
		frict = 0;
		accel = 0;
		maxRunSpeed = defaultMaxRun;
		groundDo = DoGround.isRoll;
		break;
		
		case DoGround.isSlide:
		sprite_index = PlayerSlide;
		image_index = 0;
		image_speed = 1;
		frict = groundFrict * 0.2;
		accel = 0;
		maxRunSpeed = defaultMaxRun;
		groundDo = DoGround.isSlide;
		break;
		
		case DoGround.isDash:
		sprite_index = PlayerFall;
		image_index = 0;
		image_speed = 1;
		frict = 0;
		accel = 0;
		maxRunSpeed = defaultMaxRun;
		groundDo = DoGround.isDash;
		break;
		
		case DoGround.isLand:
		sprite_index = PlayerIdleCrouch;
		image_index = random(image_number);
		image_speed = 0;
		frict = 0;
		accel = 0;
		maxRunSpeed = defaultMaxRun;
		groundDo = DoGround.isLand;
		break;
		
		case DoGround.isHardLand:
		sprite_index = PlayerIdleCrouch;
		image_index = 0;
		image_speed = 1;
		frict = groundFrict;
		accel = 0;
		maxRunSpeed = defaultMaxRun;
		groundDo = DoGround.isHardLand;
		break;
		#endregion
	}
	break;
	
	case OnWhere.onAir:
	whereOn = OnWhere.onAir;
	switch(argument1){
		#region //air switch
		case DoAir.isRise:
		sprite_index = PlayerJump;
		image_index = 0;
		image_speed = 1;
		accel = airAccel;
		frict = airFrict;
		weight = defaultWeight;
		maxFallSpeed = defaultMaxFall;
		fallTime = 0;
		airDo = DoAir.isRise;
		break;
		
		case DoAir.isFall:
		sprite_index = PlayerFall;
		image_speed = 1;
		accel = airAccel;
		frict = airFrict;
		weight = fallWeight;
		maxFallSpeed = defaultMaxFall;
		airDo = DoAir.isFall;
		break;
		#endregion
	}
	break;
	
	case OnWhere.onWall:
	accel = 0;
	whereOn = OnWhere.onWall;
	switch(argument1){
		#region //wall switch
		case DoWall.isRise:
		sprite_index = PlayerWallRun;
		image_index = 0;
		image_speed = (ySpeed - 1)/-jumpPower;
		weight = wallWeight;
		maxFallSpeed = defaultMaxFall;
		wallDo = DoWall.isRise;
		break;
		
		case DoWall.isFall:
		sprite_index = PlayerWallSlide;
		image_index = 0;
		image_speed = (ySpeed + 3)/maxFallSpeed;
		if(ySpeed > wallMaxFall){
			weight = -defaultWeight;
		} else {
			weight = wallWeight;
		}
		maxFallSpeed = defaultMaxFall;
		ySpeed -= abs(savedXSpeed) * 0.3;
		wallDo = DoWall.isFall;
		break;
		
		case DoWall.isClimb:
		sprite_index = PlayerClimb;
		image_index = 0;
		image_speed = 0;
		ySpeed = 0;
		weight = 0;
		wallDo = DoWall.isClimb;
		break;
		#endregion
	}
	break;
	
	case OnWhere.onLedge:
	whereOn = OnWhere.onLedge;
	switch(argument1){
		#region //ledge switch
		case DoLedge.isHang:
		sprite_index = PlayerLedgeHang;
		image_index = 0;
		image_speed = 1;
		xSpeed = 0;
		ySpeed = 0;
		weight = 0;
		ledgeDo = DoLedge.isHang;
		break;
		
		case DoLedge.isPull:
		sprite_index = PlayerLedgeClimb;
		image_index = min((ledgeTouch.y - y) / 20, image_number);
		image_speed = min(max((abs(savedXSpeed*1.5) / maxRunSpeed) * 0.5 + ((-savedYSpeed / maxFallSpeed) + 1) * 0.5, 0.6), 1.6);
		jumpBuff = 0;
		xSpeed = 0;
		ySpeed = 0;
		weight = 0;
		ledgeDo = DoLedge.isPull;
		break;
		#endregion
	}
	break;
	
	case OnWhere.onSwim:
	
	break;
	#endregion
}