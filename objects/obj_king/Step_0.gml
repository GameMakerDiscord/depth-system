
//---------GET PLAYER INPUT
input_left		= keyboard_check(vk_left);
input_right		= keyboard_check(vk_right);
input_up		= keyboard_check(vk_up);
input_down		= keyboard_check(vk_down);	

//---------RESET MOVEMENT VARIABLES
moveX = 0; 
moveY = 0;

//---------GET INTENDED MOVEMENT
var spd		= 2;
moveX = (input_right - input_left) * spd;
moveY = (input_down - input_up) * spd;

//---------COLLISIONS
if(place_meeting(x+moveX, y, obj_collision)){ moveX = 0; }
if(place_meeting(x, y+moveY, obj_collision)){ moveY = 0; }

//---------APPLY MOVEMENT
x += moveX;
y += moveY;

//---------HANDLE SPRITE
if(moveX != 0){
	image_xscale = sign(moveX);
	sprite_index = spr_player;
} else if(moveY != 0){
	sprite_index = spr_player;
} else {
	sprite_index = spr_player_idle;
}

//---------CAMERA
camera_set_view_pos(view_camera[0], x - (camera_get_view_width(view_camera[0])*0.5), y - (camera_get_view_height(view_camera[0])*0.5));