/// @description no really this time

var horiCells = ceil(room_width/gridWidth);
var vertiCells = ceil(room_height/gridHeight);
global.pathFindingGrid = ds_grid_create(horiCells, vertiCells);

for(var cheese = 0; cheese < horiCells; cheese++){
	for(var curds = 0; curds < vertiCells; curds++){
		if(place_meeting(cheese * gridWidth, curds * gridHeight, colliderParent)){
			ds_grid_add(global.pathFindingGrid, cheese, curds, -2);
		} else {
			ds_grid_add(global.pathFindingGrid, cheese, curds, -1);
		}
	}
}
