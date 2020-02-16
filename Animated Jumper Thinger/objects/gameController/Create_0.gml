/// @description Main Variables
global.moveUp = ord("W");
global.moveLeft = ord("A");
global.moveRight = ord("D");
global.moveDown = ord("S");
global.playerAttack = ord("J");
global.playerBlock = ord("k");
global.playerDash = vk_lshift;
global.playerHold = vk_space;
global.mainLayer = "Instances";
global.menuButton = vk_escape;
global.debugButton = vk_f3;

instance_create_layer(0,0,global.mainLayer,gameCamera);

randomise();

#region //player enum states
enum OnWhere {
	onGround,
	onAir,
	onWall,
	onLedge,
	onSwim
}

enum DoGround {
	isIdle,
	isRun,
	isCrouch,
	isCrouchWalk,
	isRoll,
	isSlide,
	isDash,
	isLand,
	isHardLand,
	isNot
}

enum DoAir {
	isRise,
	isFall,
	isNot
}

enum DoWall {
	isRise,
	isFall,
	isClimb,
	isNot
}

enum DoLedge {
	isHang,
	isPull,
	isNot
}

enum DoSwim {
	isNot
}

enum MobIs {
	isStand,
	isWander,
	isAlert,
	isPath,
	isChase,
	isSearch,
	isAttack,
	isFall
}

#endregion
