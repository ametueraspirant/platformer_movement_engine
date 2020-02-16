var beginX = argument0;
var beginY = argument1;
var goalX = argument2;
var goalY = argument3;

var frontier = ds_queue_create();
//var frontier = ds_priority_create();
var start = ds_grid_get(global.pathFindingGrid, floor(argument0/gridMaker.gridWidth), floor(argument1/gridMaker.gridHeight));
var goal = ds_grid_get(global.pathFindingGrid, floor(argument2/gridMaker.gridWidth), floor(argument3/gridMaker.gridHeight));
var neighbours = [ 1, 0,   0, -1,   -1, 0,   0, 1 ];
var nbSize = array_length_1d(neighbours);

ds_queue_enqueue(frontier, start);
//ds_priority_add(frontier, start, 0);
cameFrom[start] = noone;
var cfSize = array_length_1d(cameFrom);
//costSoFar[start] = 0;

while(frontier != noone){
	var current = ds_queue_dequeue(frontier);
	//var current = ds_priority_delete_min(frontier);
	
	if(current == goal) break;
	
	for(var i = 0; i < nbSize; i += 2){
		var next = ds_grid_get(global.pathFindingGrid, current.x + i, current.y + (i + 1));
		var check = false;
		for(var i = 0; i < cfSize; i++){
			if(cameFrom[i] == next)check = true;
		}
		if(!check and next == -1){
			ds_queue_enqueue(frontier, next);
			//ds_priority_add(frontier, next, current);
			cameFrom[next] = current;
		}
	}
}