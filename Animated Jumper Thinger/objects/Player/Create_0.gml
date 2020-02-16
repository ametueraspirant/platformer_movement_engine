/// @description set up the variables

//global to local conversion
jumpKey = global.moveUp;
leftKey = global.moveLeft;
rightKey = global.moveRight;
ducky = global.moveDown;
tacky = global.playerAttack;
blockKey = global.playerBlock;
dashKey = global.playerDash;
holdKey = global.playerHold;
menuKey = global.menuButton;
debugKey = global.debugButton;

//base stats
maxRunSpeed = 10;
defaultMaxRun = 10;
crouchMaxRun = 4;
maxFallSpeed = 20;
defaultMaxFall = 20;
wallMaxFall = 5;
stamina = 200;
baseStamina = 200;

//speed and movement
xSpeed = 0;
ySpeed = 0;
speedState = 0;
savedXSpeed = 0;
savedYSpeed = 0;

//friction
frict = .6;
groundFrict = .6;
crouchFrict = .3;
airFrict = .4;

//acceleration
accel = 1;
groundAccel = 1;
crouchAccel = 0.8;
airAccel = .5;

//weight and jumping
weight = .5;
defaultWeight = .5;
fallWeight = .8;
wallWeight = .4;
jumpPower = 14;

//timers
fallTime = 0;
coyoteTime = 5;
defaultCoyote = 5;
jumpBuff = 0;
leftDashBuff = 0;
rightDashBuff = 0;
neuDashBuff = 0;
duckBuff = 0;
attackBuff = 0;
blockBuff = 0;

//state machines
whereOn = OnWhere.onAir;
lastOn = OnWhere.onAir;
groundDo = DoGround.isNot;
airDo = DoAir.isRise;
wallDo = DoWall.isNot;
ledgeDo = DoLedge.isNot;
swimDo = DoSwim.isNot;
//duno
ledgeTouch = noone;
moveTorial = false;
menuIs = false;
debugIs = false;
runDir = 1;
lookDir = 1;


//combat
//hitPoints = 25
//baseDamage = 5
//attackTimer =  0;
//lightAttackCD = 25;
//medAttackCD = 45;
//heavyAttackCD = 80;
//sLightAttackCD = 45;
//sHeavyAttackCD = 120;
//isSwordOut = false;
//swingsLeft = 6;
//baseSwingsLeft = 6;
//swordAddDamage = 25;