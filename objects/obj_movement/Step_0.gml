/// @description 
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_up = keyboard_check(vk_up);
key_down = keyboard_check(vk_down);

if (key_left && can_move && !collision_point(Player.x-70,Player.y,obj_block,true,true)){
	Player.x -= 70;
	can_move = false;
	show_debug_message(string(can_move));
	alarm[0] = 30;
}
if (key_right && can_move && !collision_point(Player.x+70,Player.y,obj_block,true,true)){
	Player.x += 70;
	can_move = false;
	alarm[0] = 30;
}
if (key_up && can_move && !collision_point(Player.x,Player.y-70,obj_block,true,true)){
	Player.y -= 70;
	can_move = false;
	alarm[0] = 30;
}
if (key_down && can_move && !collision_point(Player.x,Player.y+70,obj_block,true,true)){
	Player.y += 70;
	can_move = false;
	alarm[0] = 30;
}

if (mouse_check_button(mb_left) && can_move){
	mouse_over_player = collision_point(mouse_x,mouse_y,Player,0,0);
	if (mouse_over_player > 0) {
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
		
		if (abs(predict_X-Player.x) <= jump_max && abs(predict_Y - Player.y) <= jump_max && !collision_point(predict_X,predict_Y,obj_block,true,true) ){
			can_jump_spr = spr_green;
			if (mouse_check_button_released(mb_right)){
				Player.x = predict_X;
				Player.y = predict_Y;
				can_jump_Timer = can_jump_Time;
			}
		}
		else {
			can_jump_spr = spr_red;
		}
	}	
}