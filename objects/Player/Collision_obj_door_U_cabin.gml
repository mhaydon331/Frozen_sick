/// @description Insert description here
// You can write your code in this editor

if (on_door) {
	msg = other.enter_or_leave + " " + other.place+ "?"
	show_debug_message(msg);
	switch(other.place){
	  	case "Syrinlya": {x_messageOffset = 45; y_messageOffset = 0; break;}
		case "Croaker's Cave":{ x_messageOffset = -55; y_messageOffset = 0; break;}//Annoying Does not respond
		case "SalsVault": {x_messageoffset = 0; y_messageOffset = 100; break;}
		case "BuyersHut": {x_messageOffset = -45; y_messageOffset = 0; break;}
		default: {x_messageOffset = 0; y_messageOffset = 0; break;}
			
	}
	if (keyboard_check_pressed(vk_enter)) {
		//x = other.targetEnter.pos_x;
		//y = other.targetEnter.pos_y;
		targetEnter = other.targetEnter;
		if (other.targetRoom == Syrinlya && room == MainTown){
			boat_Ride = true;
			show_debug_message("did i go?");
			show_debug_message("Boat Ride:" )
		}
		room_goto(other.targetRoom);
	}
}