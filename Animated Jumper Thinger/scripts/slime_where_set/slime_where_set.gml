switch(argument0){
	case MobIs.isStand:
	
	patrolState = MobIs.isStand;
	break;
	
	case MobIs.isWander:
	
	scoots = irandom_range(1, baseScoots);
	patrolState = MobIs.isWander;
	break;
	
	case MobIs.isAlert:
	
	patrolState = MobIs.isAlert;
	break;
	
	case MobIs.isPath:
	
	patrolState = MobIs.isPath;
	break;
	
	case MobIs.isChase:
	
	patrolState = MobIs.isChase;
	break;
	
	case MobIs.isSearch:
	
	patrolState = MobIs.isSearch;
	break;
	
	case MobIs.isAttack:
	
	patrolState = MobIs.isAttack;
	break;
	
	case MobIs.isFall:
	
	patrolState = MobIs.isFall;
	break;
}
