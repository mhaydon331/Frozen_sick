/// @description 

if (on_peek_P){
	if (keyboard_check_pressed(vk_enter)){
		instance_deactivate_object(obj_block_inner_Pelcs);
		instance_deactivate_object(Obj_Peek_Pelcs);
		Pelcs_seen = true;
		Pelcs_seenx = x;
		Pelcs_seeny = y;
	}
}