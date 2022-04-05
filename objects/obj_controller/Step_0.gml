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
//Switch game state to combat
//Will need to turn on playerTurn when combat is supposed to commence and off when they have jumped
if(global.game_state == states.combat && instance_exists(Player) && global.playerTurn){
	//Once NPCs are added make a randomized list and hand turn over to the selected object
	//Deactivate Triggers (will need to be reactivated)
	instance_deactivate_object(obj_triggers);
	//Suspend Player Movement except for one jump
	obj_movement.can_move = false;
	obj_movement.selected = true;
	
	
}

if(global.game_state == states.playing){
	//Reactivate Triggers (will need to be reactivated)
	instance_activate_object(obj_triggers);
	//Reset obj_movement
	obj_movement.can_move = true;
	obj_movement.selected = false;	
}
	