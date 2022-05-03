/// @description 

//Ulgors

if(on_footsteps){
	//show_debug_message(string(investigate_footsteps));
	// can add check later for investigation check
	if (keyboard_check_pressed(vk_enter)) {
		investigate_footsteps = true;
		can_move_text = false;
		alarm[0] = 1*room_speed;
		obj_movement.can_move = false;
	}
}

//Tulgis
if (on_knock_T){
	if (keyboard_check_pressed(vk_enter)){
		instance_deactivate_object(obj_block_inner_Tulgi);
		instance_activate_object(obj_town_person_t);
		//instance_deactivate_region(x+35,y+35,1,1,true,false);
		instance_destroy(trigger_Tulgi_0);
	}
}

//Pelcs
if (on_peek_P){
	if (keyboard_check_pressed(vk_enter)){
		instance_deactivate_object(obj_block_inner_Pelcs);
		Pelcs_seen = true;
		Pelcs_seenx = x;
		Pelcs_seeny = y;
		on_peek_P = false;
	}
}


if (on_knock_B){
	if (keyboard_check_pressed(vk_enter)){
		instance_deactivate_object(obj_block_inner_Buyer);
		on_enter_B = true;
		trigger_number = 1;
		Buyer_seenx = x;
		Buyer_seeny = y;
		alarm[0] = 1*60;
		can_move_text = false;
	}
}
if (vault_knock){
	if (keyboard_check_pressed(vk_enter)){
		if(openvault_1){
			instance_destroy(triggers_svdoor_1);
			instance_destroy(cover_sv_1);
			instance_destroy(cover_sv_2);
		}  else if(openvault_3){
			instance_destroy(triggers_svdoor_3);
			instance_destroy(cover_sv_3);
		}  else if(openvault_4){
			instance_destroy(triggers_svdoor_4);
			instance_destroy(cover_sv_4);
		}  else if(openvault_5){
			instance_destroy(triggers_svdoor_5);
			instance_destroy(cover_sv_5);
		}  else if(openvault_6){
			instance_destroy(triggers_svdoor_6);
			instance_destroy(cover_sv_6_1);
			instance_destroy(cover_sv_6_2);
		}  else if(openvault_7){
			instance_destroy(triggers_svdoor_7);
			instance_destroy(cover_sv_7);
		}  else if(openvault_8){
			instance_destroy(triggers_svdoor_8);
			instance_destroy(cover_sv_8);
		}  else if(openvault_9){
			instance_destroy(triggers_svdoor_9);
			instance_destroy(cover_sv_9);
		}  else if(openvault_10){
			instance_destroy(triggers_svdoor_10);
			instance_destroy(cover_sv_10);
		}  else if(openvault_11){
			instance_destroy(triggers_svdoor_11);
			instance_destroy(cover_sv_11);
		}  else if(openvault_12){
			instance_destroy(triggers_svdoor_12_1);
			instance_destroy(triggers_svdoor_12_2);
			instance_destroy(cover_sv_12);
		}  else if(openvault_13){
			instance_destroy(triggers_svdoor_13);
			instance_destroy(cover_sv_13);
		}  else if(openvault_14){
			instance_destroy(triggers_svdoor_14);
			instance_destroy(cover_sv_14);
		}  else if(openvault_15){
			instance_destroy(triggers_svdoor_15);
			instance_destroy(cover_sv_15);
		}  else if(openvault_16){
			instance_destroy(triggers_svdoor_16);
			instance_destroy(cover_sv_16);
		}  else if(openvault_17){
			instance_destroy(triggers_svdoor_17);
			instance_destroy(cover_sv_17);
		}  else if(openvault_18){
			instance_destroy(triggers_svdoor_18);
			instance_destroy(cover_sv_18);
		} 
	}
}