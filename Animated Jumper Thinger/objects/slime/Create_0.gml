/// @description create slime stats

//input logic
inputLeft = false;
inputRight = false;
inputJump = false;
inputAttack = false;
inputDebug = global.debugButton;

//base stats
maxRunSpeed = 15;
maxFallSpeed = 20;

//speed and movement
xSpeed = 0;
ySpeed = 0;

//friction
frict = .6;
groundFrict = .6;
airFrict = .4;

//acceleration
accel = 5;

//weight and jumping
weight = .5;

jumpPower = 5;

//timers
windupTimer = 120;
windupReset = 120;
jumpFrames = 2;
jumpReset = 2;
decisionTime = 0;
scoots = 3;
baseScoots = 3;


//state machines
patrolState = MobIs.isStand;

//duno
slimeDebug = false;
target = self;
runDir = 1;
targetX = x;
targetY = y;
lastX = 0;
lastY = 0;

//combat
//hitPoints = 8;
//baseDamage = 1;
//attackTimer = 0;
//attackCD = 240;