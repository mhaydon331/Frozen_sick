/// @description 

if (place_meeting(x,y,Player)){
	//player picks up item/
	//need to add prompt for this and dif effects
	if (keyboard_check_pressed(vk_enter)){
		//check item added
		if (item_add(item)){
			instance_destroy();
		}
	}
}