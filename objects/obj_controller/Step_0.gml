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
	enemy_count = ds_list_size(turn_list) - 4;
	initial_combat = false;
	turn_start = true;
	obj_movement.can_move = false;
}
//show_debug_message(string(obj_movement.can_move));
if (global.game_state == states.combat && initial_combat == false){
	//show_debug_message(string(object_get_name(ds_list_find_value(turn_list,combat_turn))));
	if (ds_list_find_value(turn_list,combat_turn) == Player) {
		person = "Player";
		player_selected = true;
		predict_X = mouse_x - mouse_x%70;
		predict_Y = mouse_y - mouse_y%70;
		if (abs(predict_X-Player.x) <= jump_max && abs(predict_Y - Player.y) <= jump_max && !collision_point(predict_X,predict_Y,obj_block,true,true) ){
			can_jump_spr = spr_green;
			if (mouse_check_button_released(mb_right)){
				Player.x = predict_X;
				Player.y = predict_Y;
				player_selected = false;
			}
		}
		else {
			can_jump_spr = spr_red;
		}
	} else {
		player_selected = false;
	}
	if (turn_start){
		if (ds_list_find_value(turn_list,combat_turn) == obj_NPC1) {
			person = "NPC1";
			if (turn_start){
				enemy_nearest = instance_nearest(obj_NPC1.x, obj_NPC1.y, obj_enemy);
				show_debug_message("Nearest_enemy x: "+string(enemy_nearest.x));
				show_debug_message("Nearest_enemy y: "+string(enemy_nearest.y));
				obj_NPC1.x = enemy_nearest.x+70;
				obj_NPC1.y = enemy_nearest.y;
				enemy_msg = enemy_nearest.enemy_type;
				action = choose("Spell", "CrossBow", "Sword");
				show_debug_message(enemy_nearest.enemy_type);
				show_debug_message(action);
				turn_start = false;
				if (action == "Spell"){
					roll_to_hit = rollDice(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]));
					if (roll_to_hit + 4 >= enemy_nearest.armor){
						damage = irandom(8) + 1;
						hit = true;
						enemy_nearest.enemy_HP -= damage;
					}
					else{
						hit = false;
						damage = 0;
					}
				}
				if (action == "Sword"){
					roll_to_hit = rollDice(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]));
					if (roll_to_hit + 3 >= enemy_nearest.armor){
						damage = irandom(10) + 1;
						enemy_nearest.enemy_HP -= damage;
						hit = true;
					}
					else{
						hit = false;
						damage = 0;
					}
				}
				if (action == "Crossbow"){
					roll_to_hit = rollDice(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]));
					if (roll_to_hit + 2 >= enemy_nearest.armor){
						damage = irandom(6) + 1;
						enemy_nearest.enemy_HP -= damage;
						hit = true;
					}
					else{
						hit = false;
						damage = 0;
					}
				}
				if (enemy_nearest.enemy_HP <= 0){
					instance_destroy(enemy_nearest);
					enemy_count -= 1;
				}
			}
		} else if (ds_list_find_value(turn_list,combat_turn) == obj_NPC2) {
			person = "NPC2";
			if (turn_start){
				enemy_nearest = instance_nearest(obj_NPC2.x, obj_NPC2.y, obj_enemy);
				show_debug_message("Nearest_enemy x: "+string(enemy_nearest.x));
				show_debug_message("Nearest_enemy y: "+string(enemy_nearest.y));
				obj_NPC2.x = enemy_nearest.x;
				obj_NPC2.y = enemy_nearest.y+70;
				enemy_msg = enemy_nearest.enemy_type;
				action = choose("Spell", "CrossBow", "Sword");
				show_debug_message(enemy_nearest.enemy_type);
				show_debug_message(action);
				turn_start = false;
				if (action == "Spell"){
					roll_to_hit = rollDice(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]));
					if (roll_to_hit + 4 >= enemy_nearest.armor){
						damage = irandom(8) + 1;
						hit = true;
						enemy_nearest.enemy_HP -= damage;
					}
					else{
						hit = false;
						damage = 0;
					}
				}
				if (action == "Sword"){
					roll_to_hit = rollDice(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]));
					if (roll_to_hit + 3 >= enemy_nearest.armor){
						damage = irandom(10) + 1;
						enemy_nearest.enemy_HP -= damage;
						hit = true;
					}
					else{
						hit = false;
						damage = 0;
					}
				}
				if (action == "Crossbow"){
					roll_to_hit = rollDice(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]));
					if (roll_to_hit + 2 >= enemy_nearest.armor){
						damage = irandom(6) + 1;
						hit = true;
						enemy_nearest.enemy_HP -= damage;
					}
					else{
						hit = false;
						damage = 0;
					}
				}
			}
			if (enemy_nearest.enemy_HP <= 0){
				instance_destroy(enemy_nearest);
				enemy_count -= 1;
			}
		
		} else if (ds_list_find_value(turn_list,combat_turn) == obj_NPC3) {
			person = "NPC3";
			enemy_nearest = instance_nearest(obj_NPC3.x, obj_NPC3.y, obj_enemy);
			show_debug_message("Nearest_enemy x: "+string(enemy_nearest.x));
			show_debug_message("Nearest_enemy y: "+string(enemy_nearest.y));
			obj_NPC3.x = enemy_nearest.x;
			obj_NPC3.y = enemy_nearest.y-70;
			enemy_msg = enemy_nearest.enemy_type;
			action = choose("Spell", "CrossBow", "Sword");
			show_debug_message(enemy_nearest.enemy_type);
			show_debug_message(action);
			turn_start = false;
			if (action == "Spell"){
				roll_to_hit = rollDice(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]));
				if (roll_to_hit + 4 >= enemy_nearest.armor){
					damage = irandom(8) + 1;
					hit = true;
					enemy_nearest.enemy_HP -= damage;
				}
				else{
					hit = false;
					damage = 0;
				}
			}
			if (action == "Sword"){
				roll_to_hit = rollDice(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]));
				if (roll_to_hit + 3 >= enemy_nearest.armor){
					damage = irandom(10) + 1;
					hit = true;
					enemy_nearest.enemy_HP -= damage;
				}
				else{
					hit = false;
					damage = 0;
				}
			}
			if (action == "Crossbow"){
				roll_to_hit = rollDice(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]));
				if (roll_to_hit + 2 >= enemy_nearest.armor){
					damage = irandom(6) + 1;
					show_debug_message(string(damage));
					hit = true;
					enemy_nearest.enemy_HP -= damage;
				}
				else{
					hit = false;
					damage = 0;
				}
			}
			if (enemy_nearest.enemy_HP <= 0){
				instance_destroy(enemy_nearest);
				enemy_count -= 1;
			}
		} else {
			person = string(ds_list_find_value(turn_list,combat_turn));
			turn_start = false;
		}
	}
	//hit = true;
	combat_msg = person + " hit " + enemy_msg + " with a " + action + " for " + string(damage);
	hit = true;
	if (enemy_count <= 0){
		global.game_state = states.playing;
		obj_movement.can_move = true;
		global.combat_zone = combat_group.combat_none;
		hit = false;
		player_selected = false;
	}
	if (keyboard_check_pressed(vk_enter)){
		combat_msg = "";
		hit = false;
		damage = 0;
		person = ""
		enemy_nearest = noone;
		enemy_msg = "";
		turn_start = true;
		combat_turn = (combat_turn + 1)%ds_list_size(turn_list);
	}
		
}


//Dice Roller for Combat



