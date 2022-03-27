/// @description 

if(on_knock_T){
	if (keyboard_check_pressed(vk_enter)) {
		instance_deactivate_object(obj_block_inner);
		instance_deactivate_object(Obj_knock);
	}
}

