/// @description 

if (on_knock_B){
	if (keyboard_check_pressed(vk_enter)){
		instance_deactivate_object(obj_block_inner_Buyer);
		instance_deactivate_object(Obj_knock_Buyer);
		on_enter_B = true;
		Buyer_seenx = x;
		Buyer_seeny = y;
	}
}