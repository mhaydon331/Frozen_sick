/// @description Insert description here
// You can write your code in this editor

//show_debug_message(string(x)+ "," + string(y));
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_up = keyboard_check(vk_up);
key_down = keyboard_check(vk_down);

if (key_left && can_move && !collision_point(x-70,y,obj_block,true,true)){
	x -= 70;
	can_move = false;
	alarm[0] = 30;
}
if (key_right && can_move && !collision_point(x+70,y,obj_block,true,true)){
	x += 70;
	can_move = false;
	alarm[0] = 30;
}
if (key_up && can_move && !collision_point(x,y-70,obj_block,true,true)){
	y -= 70;
	can_move = false;
	alarm[0] = 30;
}
if (key_down && can_move && !collision_point(x,y+70,obj_block,true,true)){
	y += 70;
	can_move = false;
	alarm[0] = 30;
}

if (mouse_check_button(mb_left)){
	mouse_over_player = collision_point(mouse_x,mouse_y,Player,0,0);
	if (mouse_over_player != noone) {
		selected = true;
	} else {
		selected = false;
	}
}
if (selected){
	can_jump_Timer--;
	if (can_jump_Timer <= 0){
		predict_X = mouse_x - mouse_x%70;
		predict_Y = mouse_y - mouse_y%70;
		
		if (abs(predict_X-x) <= jump_max && abs(predict_Y - y) <= jump_max && !collision_point(predict_X,predict_Y,obj_block,true,true) ){
			can_jump_spr = spr_green;
			if (mouse_check_button_released(mb_right)){
				x = predict_X;
				y = predict_Y;
				can_jump_Timer = can_jump_Time;
			}
		}
		else {
			can_jump_spr = spr_red;
		}
	}	
}

// move between rooms - Cabins

on_door = collision_point(x,y,obj_door_U_cabin,true,true);

//ulgors cabin interactions
on_footsteps = collision_point(x,y,Obj_footsteps,true,true);
if(!on_footsteps){
	investigate_footsteps = false;
}

//Tulgi's CAbin interactions
on_knock_T = collision_point(x,y,Obj_knock_Tulgi,true,true);

// Pelcs Interactions
on_peek_P = collision_point(x,y,Obj_Peek_Pelcs,true,true);
if (Pelcs_seen){
	Pelcs_seen_enemies = true;
	if (x != Pelcs_seenx || y != Pelcs_seeny){
		Pelcs_seen = false;
	}
}

//Buyers Interactions
on_knock_B = collision_point(x,y,Obj_knock_Buyer,true,true);
if (on_enter_B){
	if (x != Buyer_seenx || y != Buyer_seeny){
		on_enter_B = false;
	}
}