/// @description Main Control

//Logic To Start Game upon Enter Key presses on Title Screen
if(room == Title && keyboard_check(vk_enter)){
	if(global.gameStart == false){
		audio_stop_all();
		global.gameStart = true;
		room_goto(MainTown);
	}
}
