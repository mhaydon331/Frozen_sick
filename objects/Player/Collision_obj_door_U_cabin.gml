/// @description Insert description here
// You can write your code in this editor

if (on_door) {
	msg = other.enter_or_leave + " " + other.place+ "?"
	if (keyboard_check_pressed(vk_enter)) {
		//x = other.targetEnter.pos_x;
		//y = other.targetEnter.pos_y;
		targetEnter = other.targetEnter;
		room_goto(other.targetRoom);
	}
}