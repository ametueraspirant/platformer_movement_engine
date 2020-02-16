/// @description Move it Move it
//if(sign(Player.xSpeed) > 7) {
//	something something camera moves to a point
//} else {
//	something something camera resets to resting after a bit
//}
x=lerp(x,Player.x + Player.lookDir * 100 + Player.xSpeed * 20, 0.05);
y=lerp(y,Player.y + Player.ySpeed * 12, 0.05);