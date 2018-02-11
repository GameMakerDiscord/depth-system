//Resize Grid
var dgrid = ds_depthgrid;
var inst_num = instance_number(par_depthobject);
ds_grid_resize(dgrid, 2, inst_num);

//Add Instances to the Grid
var yy = 0; with(par_depthobject){
	dgrid[# 0, yy] = id;
	dgrid[# 1, yy] = y;
	yy += 1;
}

//Sort the grid in ascending order
ds_grid_sort(dgrid, 1, true);

//Loop through the grid and draw all the instances
yy = 0; var inst;
repeat(inst_num) {
	//pull out an ID
	inst = dgrid[# 0, yy];
	//get instance to draw itself
	with(inst){ event_perform(ev_draw, 0); }
	
	yy += 1;
}