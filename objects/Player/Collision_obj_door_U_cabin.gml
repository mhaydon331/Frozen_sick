/// @description Insert description here
// You can write your code in this editor

if (on_door) {
	if (keyboard_check_pressed(vk_enter)) {
		//x = other.targetEnter.pos_x;
		//y = other.targetEnter.pos_y;
		targetEnter = other.targetEnter;
		room_goto(other.targetRoom);
	}
}