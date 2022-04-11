/// @description Main Control

//Logic To Start Game upon Enter Key presses on Title Screen
if(room == Title && keyboard_check_pressed(vk_enter)){
	if(global.game_state == states.suspend){
		global.game_state = states.playing;
		room_goto(MainTown);
	}
}

//Pause Menu Logic
if(keyboard_check_pressed(vk_escape) && global.game_state != states.suspend){
	if (global.game_state == states.playing) {
		global.game_state = states.paused;
		obj_movement.can_move = false;
		//audio_play_sound(snd_esc, 1, false);
	}
	else {
		global.game_state = states.playing;
		obj_movement.can_move = true;
	}
}

if (global.game_state == states.paused || global.game_state == states.gameover) {
	keyUp = keyboard_check_pressed(vk_up);
	keyDown = keyboard_check_pressed(vk_down);
		//if(keyUp || keyDown) audio_play_sound(snd_menu, 1, false);
	pauseOptionSelected += (keyDown - keyUp);
	//Makes The Wrap Around faster when the resume option is taken away on game over
	if(pauseOptionSelected >= array_length(pauseOption) && global.game_state == states.paused) pauseOptionSelected = 0;
	else if(pauseOptionSelected >= array_length(pauseOption) && global.game_state == states.gameover) pauseOptionSelected = 1;

	if (global.game_state == states.gameover) {
		//if(counter == 0) {
			//audio_play_sound(snd_gameover, 1, false);
		//	counter++;
		//}
		if(pauseOptionSelected <= 0) pauseOptionSelected = array_length(pauseOption) -1;
	}
	else {
		if(pauseOptionSelected < 0) pauseOptionSelected = array_length(pauseOption) - 1;
	}
	enterKey = keyboard_check_pressed(vk_enter);
	if (enterKey){
		switch(pauseOptionSelected){
			case 0:
				global.game_state = states.playing;
				break;
			case 1:
				game_end();
				break;
			case 2:
				with(all) instance_destroy();
				game_restart();
				break;
			}
	}
}
/*
//Deal With Sequences by state
//Control Sequences
switch (sequenceState) {
	case seqState.playing: {
		global.game_state = states.suspend;	
	}
	case seqState.finished: {
		if(layer_sequence_exists(curSeqLayer, curSez)){
			layer_sequence_destroy(curSeq);
		}
		global.game_state = states.playing;
		sequenceState = seqState.notPlaying;
		curSeq = noone;
		break;
	}
}


//Combat Logic 
//TODO: Switch game state to combat
//TODO: Tturn on playerTurn when combat is supposed to commence and off when they have jumped
if(global.game_state == states.combat && instance_exists(Player) && global.playerTurn){
	//Once NPCs are added make a randomized list and hand turn over to the selected object
	//Suspend Player Movement except for one jump
	obj_movement.can_move = false;
	obj_movement.selected = true;
	//need a jump counter maybe? 
	//since can move is also linked in the jump movement rn? 
	//so that jump allowed is one otherwise jump allowed would be 99999999999?
	//Or we just control movement in the combat logic and ignore the obj_movement
	
}

*/
if (global.game_state == states.combat && initial_combat == true){
	turn_list = ds_list_create();
	ds_list_add(turn_list,Player,obj_NPC1,obj_NPC2,obj_NPC3);
	switch (global.combat_zone){
		case combat_group.ccave_2:
			ds_list_add(turn_list,ccave_2_elf_1,ccave_2_elf_2,ccave_2_elf_3,ccave_2_frog_1,ccave_2_frog_2);
			break;
		case combat_group.ccave_5:
			ds_list_add(turn_list,Croaker);
			break;
		case combat_group.svault_3:
			ds_list_add(turn_list,svault_armor_1,svault_armor_2);
			break;
		case combat_group.svault_6:
			ds_list_add(turn_list,svault_6_zombie_1,svault_6_zombie_2,svault_6_zombie_3);
			break;
		case combat_group.svault_9:
			ds_list_add(turn_list,svault_9_zombie_1,svault_9_zombie_2);
			break;
		case combat_group.svault_12:
			ds_list_add(turn_list,svault_12_zombie_1,svault_12_zombie_2);
			break;
		case combat_group.svault_14:
			ds_list_add(turn_list,svault_14_zombie_1,svault_14_zombie_2,svault_14_zombie_3);
			break;
		case combat_group.svault_16:
			ds_list_add(turn_list,svault_16_golum);
			break;
		default:
			global.game_state = states.playing;
			break;
	};
	ds_list_shuffle(turn_list);
	//show_debug_message(string(ds_list_size(turn_list)));
	initial_combat = false;
}


