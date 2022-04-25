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
	obj_movement.can_move = false;
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
				obj_movement.can_move = true;
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
	party_list = ds_list_create();
	enemy_list = ds_list_create();
	ds_list_add(turn_list,Player,obj_NPC1,obj_NPC2,obj_NPC3);
	ds_list_add(party_list,Player,obj_NPC1,obj_NPC2,obj_NPC3);
	switch (global.combat_zone){
		case combat_group.ccave_2:
			ds_list_add(turn_list,ccave_2_elf_1,ccave_2_elf_2,ccave_2_elf_3,ccave_2_frog_1,ccave_2_frog_2);
			ds_list_add(enemy_list,ccave_2_elf_1,ccave_2_elf_2,ccave_2_elf_3,ccave_2_frog_1,ccave_2_frog_2);
			break;
		case combat_group.ccave_5:
			ds_list_add(turn_list,Croaker);
			ds_list_add(enemy_list,Croaker);
			break;
		case combat_group.svault_3:
			ds_list_add(turn_list,svault_armor_1,svault_armor_2);
			ds_list_add(enemy_list,svault_armor_1,svault_armor_2);
			break;
		case combat_group.svault_6:
			ds_list_add(turn_list,svault_6_zombie_1,svault_6_zombie_2,svault_6_zombie_3);
			ds_list_add(enemy_list,svault_6_zombie_1,svault_6_zombie_2,svault_6_zombie_3);
			break;
		case combat_group.svault_9:
			ds_list_add(turn_list,svault_9_zombie_1,svault_9_zombie_2);
			ds_list_add(enemy_list,svault_9_zombie_1,svault_9_zombie_2);
			break;
		case combat_group.svault_12:
			ds_list_add(turn_list,svault_12_zombie_1,svault_12_zombie_2);
			ds_list_add(enemy_list,svault_12_zombie_1,svault_12_zombie_2);
			break;
		case combat_group.svault_14:
			ds_list_add(turn_list,svault_14_zombie_1,svault_14_zombie_2,svault_14_zombie_3);
			ds_list_add(enemy_list,svault_14_zombie_1,svault_14_zombie_2,svault_14_zombie_3);
			break;
		case combat_group.svault_16:
			ds_list_add(turn_list,svault_16_golum);
			ds_list_add(enemy_list,svault_16_golum);
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
	if (turn_start){
		if (ds_list_find_value(turn_list,combat_turn) == Player) {
			//player can jump once
			//show_debug_message(turn_start);
			person = "Player";
			player_selected = true;
			predict_X = mouse_x - mouse_x%70;
			predict_Y = mouse_y - mouse_y%70;
			can_move_there = true;
			show_debug_message(predict_X);
			show_debug_message(predict_Y);
			show_debug_message("Player x: " +string(Player.x));
			show_debug_message("Player y: " +string(Player.y));
			for (var i = 0; i < ds_list_size(turn_list); i++){ 
				if(predict_X == turn_list[|i].x && predict_Y == turn_list[|i].y && turn_list[|i] != Player){
					can_move_there = false;
					can_jump_spr = spr_red;
				} else if (can_move_there && abs(predict_X-Player.x) <= jump_max && abs(predict_Y - Player.y) <= jump_max && !collision_point(predict_X,predict_Y,obj_block,true,true) ){
					can_jump_spr = spr_green;
					if (mouse_check_button_released(mb_right)){
						Player.x = predict_X;
						Player.y = predict_Y;
						player_selected = false;
						turn_start = false;
						player_choice = true;
					}
					if (mouse_check_button_released(mb_left)){
						player_selected = false;
						turn_start = false;
						player_choice = true;
					}
				} else {
					can_jump_spr = spr_red;
				}
			}
		} else if (ds_list_find_value(turn_list,combat_turn) == obj_NPC1) {
			person = "NPC1";
			if (turn_start){
				for (var i = 0; i < ds_list_size(enemy_list); i++){
					if (sqrt(sqr(enemy_list[|i].x - obj_NPC3.x)+sqr(enemy_list[|i].y - obj_NPC3.y)) < enemy_nearest_dist){
						//show_debug_message("Lower found");
						enemy_nearest_dist = sqrt(sqr(enemy_list[|i].x - obj_NPC3.x)+sqr(enemy_list[|i].y - obj_NPC3.y));
						enemy_nearest = enemy_list[|i]
					}
				}
				//enemy_nearest = instance_nearest(obj_NPC1.x, obj_NPC1.y, obj_enemy);
				//show_debug_message("Nearest_enemy x: "+string(enemy_nearest.x));
				//show_debug_message("Nearest_enemy y: "+string(enemy_nearest.y));
				obj_NPC1.x = enemy_nearest.x+70;
				obj_NPC1.y = enemy_nearest.y;
				enemy_msg = enemy_nearest.enemy_type;
				action = choose("Spell", "CrossBow", "Sword");
				//show_debug_message(enemy_nearest.enemy_type);
				//show_debug_message(action);
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
					index_to_delete = ds_list_find_index(turn_list,enemy_nearest);
					ds_list_delete(turn_list,index_to_delete);
					index_to_delete = ds_list_find_index(enemy_list,enemy_nearest);
					ds_list_delete(enemy_list,index_to_delete);
					instance_destroy(enemy_nearest);
					enemy_count -= 1;
				}
			}
		} else if (ds_list_find_value(turn_list,combat_turn) == obj_NPC2) {
			person = "NPC2";
			if (turn_start){
				for (var i = 0; i < ds_list_size(enemy_list); i++){
					if (sqrt(sqr(enemy_list[|i].x - obj_NPC3.x)+sqr(enemy_list[|i].y - obj_NPC3.y)) < enemy_nearest_dist){
						//show_debug_message("Lower found");
						enemy_nearest_dist = sqrt(sqr(enemy_list[|i].x - obj_NPC3.x)+sqr(enemy_list[|i].y - obj_NPC3.y));
						enemy_nearest = enemy_list[|i]
					}
				}
				//enemy_nearest = instance_nearest(obj_NPC2.x, obj_NPC2.y, obj_enemy);
				//show_debug_message("Nearest_enemy x: "+string(enemy_nearest.x));
				//show_debug_message("Nearest_enemy y: "+string(enemy_nearest.y));
				obj_NPC2.x = enemy_nearest.x;
				obj_NPC2.y = enemy_nearest.y+70;
				enemy_msg = enemy_nearest.enemy_type;
				action = choose("Spell", "CrossBow", "Sword");
				//show_debug_message(enemy_nearest.enemy_type);
				//show_debug_message(action);
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
				index_to_delete = ds_list_find_index(turn_list,enemy_nearest);
				ds_list_delete(turn_list,index_to_delete);
				index_to_delete = ds_list_find_index(enemy_list,enemy_nearest);
				ds_list_delete(enemy_list,index_to_delete);
				instance_destroy(enemy_nearest);
				enemy_count -= 1;
			}
		
		} else if (ds_list_find_value(turn_list,combat_turn) == obj_NPC3) {
			person = "NPC3";
			for (var i = 0; i < ds_list_size(enemy_list); i++){
				if (sqrt(sqr(enemy_list[|i].x - obj_NPC3.x)+sqr(enemy_list[|i].y - obj_NPC3.y)) < enemy_nearest_dist){
					//show_debug_message("Lower found");
					enemy_nearest_dist = sqrt(sqr(enemy_list[|i].x - obj_NPC3.x)+sqr(enemy_list[|i].y - obj_NPC3.y));
					enemy_nearest = enemy_list[|i]
				}
			}
			//show_debug_message("I am the closest enemy:" + string(enemy_nearest));
			//enemy_nearest = instance_nearest(obj_NPC3.x, obj_NPC3.y, obj_enemy);
			//show_debug_message("Nearest_enemy x: "+string(enemy_nearest.x));
			//show_debug_message("Nearest_enemy y: "+string(enemy_nearest.y));
			obj_NPC3.x = enemy_nearest.x;
			obj_NPC3.y = enemy_nearest.y-70;
			enemy_msg = enemy_nearest.enemy_type;
			action = choose("Spell", "CrossBow", "Sword");
			//show_debug_message(enemy_nearest.enemy_type);
			//show_debug_message(action);
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
					//show_debug_message(string(damage));
					hit = true;
					enemy_nearest.enemy_HP -= damage;
				}
				else{
					hit = false;
					damage = 0;
				}
			}
			if (enemy_nearest.enemy_HP <= 0){
				index_to_delete = ds_list_find_index(turn_list,enemy_nearest);
				ds_list_delete(turn_list,index_to_delete);
				index_to_delete = ds_list_find_index(enemy_list,enemy_nearest);
				ds_list_delete(enemy_list,index_to_delete);
				instance_destroy(enemy_nearest);
				enemy_count -= 1;
			}
		} else {
			turn_start = false;
			player_selected = false;
			person = ds_list_find_value(turn_list,combat_turn);
			for (var i = 0; i < ds_list_size(party_list); i++){
				show_debug_message(party_list[|i]);
				if (sqrt(sqr(party_list[|i].x - person.x)+sqr(party_list[|i].y - person.y)) < enemy_nearest_dist){
					//show_debug_message("Lower found");
					enemy_nearest_dist = sqrt(sqr(party_list[|i].x - person.x)+sqr(party_list[|i].y - person.y));
					enemy_nearest = party_list[|i]
				}
			}
			//Left
			place_to_move_x = person.x;
			place_to_move_y = person.y;
			for (var i = 0; i < ds_list_size(turn_list); i++){
				if (turn_list[|i] == person){
					continue;
				}
				show_debug_message(string(turn_list[|i])+ "x: "+ string(turn_list[|i].x)+"  y: " + string(turn_list[|i].y));
				if (turn_list[|i].x == enemy_nearest.x-70 && turn_list[|i].y = enemy_nearest.y){
					show_debug_message("Left conflict");
					can_left = false;
				} if (turn_list[|i].x == enemy_nearest.x+70 && turn_list[|i].y = enemy_nearest.y){
					show_debug_message("Right conflict");
					can_right = false;
				} if (turn_list[|i].x == enemy_nearest.x && turn_list[|i].y = enemy_nearest.y-70){
					show_debug_message("Above conflict");
					can_above = false;
				} if (turn_list[|i].x == enemy_nearest.x && turn_list[|i].y = enemy_nearest.y+70){
					show_debug_message("Below conflict");
					can_below = false;
				}
			}
			if (can_left && person.enemy_type != "Croaker"){
				place_to_move_x = enemy_nearest.x-70;
				place_to_move_y = enemy_nearest.y;
			} else if (can_right && person.enemy_type != "Croaker"){
				place_to_move_x = enemy_nearest.x+70;
				place_to_move_y = enemy_nearest.y;
			} else if (can_above && person.enemy_type != "Croaker"){
				place_to_move_x = enemy_nearest.x;
				place_to_move_y = enemy_nearest.y-70;
			} else if (can_below && person.enemy_type != "Croaker"){
				place_to_move_x = enemy_nearest.x;
				place_to_move_y = enemy_nearest.y+70;
			} else {
				//need to fix this
				if (person.enemy_type != "Croaker"){
					place_to_move_x = enemy_nearest.x;
					place_to_move_y = enemy_nearest.y+140;
				}
			}
			person.x = place_to_move_x;
			person.y = place_to_move_y;
			action = person.actions[irandom(array_length(person.actions))%array_length(person.actions)];
			/*
			if (!place_meeting(enemy_nearest.x-70, enemy_nearest.y,obj_enemy)){
				show_debug_message("Can Move left");
				person.x = enemy_nearest.x-70;
				person.y = enemy_nearest.y;
			} else if (!place_meeting(enemy_nearest.x-70, enemy_nearest.y,obj_enemy)){
				show_debug_message("Can Move right");
				person.x = enemy_nearest.x+70;
				person.y = enemy_nearest.y;
			} else if (!place_meeting(enemy_nearest.x, enemy_nearest.y-70,obj_enemy)){
				show_debug_message("Can Move above");
				person.x = enemy_nearest.x;
				person.y = enemy_nearest.y-70;
			} else if (!place_meeting(enemy_nearest.x, enemy_nearest.y+70,obj_enemy)){
				show_debug_message("Can Move below");
				person.x = enemy_nearest.x;
				person.y = enemy_nearest.y+70;
			}
			*/
			
			if (action == "Sword"){
				roll_to_hit = rollDice(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]));
				if (roll_to_hit + 3 >= enemy_nearest.armor){
					damage = irandom(10) + 1;
					hit = true;
					enemy_nearest.HP -= damage;
				}
				else{
					hit = false;
					damage = 0;
				}
			}
			if (action == "Crossbow" || action == "Bite"){
				roll_to_hit = rollDice(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]));
				if (roll_to_hit+2 >= enemy_nearest.armor){
					damage = irandom(6) + 1;
					//show_debug_message(string(damage));
					hit = true;
					enemy_nearest.HP -= damage;
				}
				else{
					hit = false;
					damage = 0;
				}
			}
			if (action == "Hit"){
				roll_to_hit = rollDice(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]));
				if (roll_to_hit+1 >= enemy_nearest.armor){
					damage = irandom(8) + 1;
					//show_debug_message(string(damage));
					hit = true;
					enemy_nearest.HP -= damage;
				}
				else{
					hit = false;
					damage = 0;
				}
			}
			if (action == "Slam" && person.enemy_type == "Golum"){
				roll_to_hit = rollDice(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]));
				damage = irandom(12) + irandom(12);
				for (i = 0; i < ds_list_size(party_list); i++){
					if (roll_to_hit+8 >= party_list[|i].armor){
						//show_debug_message(string(damage));
						hit = true;
						party_list[|i].HP -= damage;
					}
				}
			} else if (action == "Slam"){
				roll_to_hit = rollDice(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]));
				if (roll_to_hit+1 >= enemy_nearest.armor){
					damage = irandom(10) + 1;
					//show_debug_message(string(damage));
					hit = true;
					enemy_nearest.HP -= damage;
				}
				else{
					hit = false;
					damage = 0;
				}
			}
			person = person.enemy_type;
		}
	}
	//player action choice
	if (ds_list_find_value(turn_list,combat_turn) == Player && enemy_selection == false && turn_start == false && player_choice == true) {
		display_choice = true;
		// 1 = spell 2 = crossbow 3 = sword
		can_jump_spr = spr_red;
		var _key = keyboard_lastchar;
		if (ord(_key) == ord("1")){
			show_debug_message("I pressed Spell");
			action = "Spell";
			roll_to_hit = rollDice(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0])) + 4;
			damage = irandom(8) + 1;
			ranged = true;
			enemy_selection = true;
			player_choice = false;
		}
		if (ord(_key) == ord("2")){
			action = "Crossbow";
			roll_to_hit = rollDice(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0])) + 2;
			damage = irandom(6) + 1;
			ranged = true;
			enemy_selection = true;
			player_choice = false;
		}
		if (ord(_key) == ord("3")){
			action = "Sword";
			roll_to_hit = rollDice(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0])) + 3;
			damage = irandom(10) + 1;
			ranged = false;
			enemy_selection = true;
			player_choice = false;
		}
		
		//action = 
	}
	if (ds_list_find_value(turn_list,combat_turn) == Player && turn_start == false && enemy_selection == true){
		predict_X = mouse_x - mouse_x%70;
		predict_Y = mouse_y - mouse_y%70;
		can_jump_spr = spr_red;
		enemy_nearest = noone;
		for (var i = 0; i < ds_list_size(enemy_list); i++){
			if (predict_X == enemy_list[|i].x && predict_Y == enemy_list[|i].y){
				if (abs(predict_X - Player.x) <= 70 && abs(predict_Y - Player.y) <= 70 && !ranged){
					can_jump_spr = spr_green;
					enemy_nearest = enemy_list[|i];
				} else if (!ranged) {
					can_jump_spr = spr_red;
					enemy_nearest = noone;
				} else {
					can_jump_spr = spr_green;
					enemy_nearest = enemy_list[|i];
				}
			} 
		}
		if (mouse_check_button_pressed(mb_left) && enemy_nearest != noone){
			show_debug_message("Hit me!");
			if (roll_to_hit >= enemy_nearest.armor){
				enemy_nearest.enemy_HP -= damage;
				display_choice = false;
				enemy_msg = enemy_nearest.enemy_type;
				enemy_selection = false;
				hit = true;
			} else {
				display_choice = false;
				enemy_selection = false;
				damage = 0;
				enemy_msg = enemy_nearest.enemy_type;
				hit = false;
			}
			if (enemy_nearest.enemy_HP <= 0){
				index_to_delete = ds_list_find_index(turn_list,enemy_nearest);
				ds_list_delete(turn_list,index_to_delete);
				index_to_delete = ds_list_find_index(enemy_list,enemy_nearest);
				ds_list_delete(enemy_list,index_to_delete);
				instance_destroy(enemy_nearest);
				enemy_count -= 1;
			}
		}
	}
	if (Player.HP <= 0){
		global.game_state = states.gameover;
	}
			
	//hit = true;
	combat_msg = person + " hit " + enemy_msg + " with a " + action + " for " + string(damage);
	if (player_selected){
		combat_msg = "Please select a place to move or click on the screen to skip movement";
	}
	if (display_choice){
		combat_msg = "";
	}
	hit = true;
	if (enemy_count <= 0){
		global.game_state = states.playing;
        obj_movement.can_move = true;
        global.combat_zone = combat_group.combat_none;
        player_selected = false;
        enemy_nearest_dist = 100000;
        display_choice = false;
        combat_msg = "";
        hit = false;
        damage = 0;
        person = ""
        enemy_nearest = noone;
        enemy_msg = "";
        turn_start = true;
        combat_turn = (combat_turn + 1)%ds_list_size(turn_list);
        can_left = true;
        can_right = true;
        can_above = true;
        can_below = true;
		/*
		show_debug_message("Player HP: "+string(Player.HP));
		show_debug_message("NPC1   HP: "+string(obj_NPC1.HP));
		show_debug_message("NPC2   HP: "+string(obj_NPC2.HP));
		show_debug_message("NPC3   HP: "+string(obj_NPC3.HP));
		*/
	}
	if (keyboard_check_pressed(vk_enter)){
		enemy_nearest_dist = 100000;
		display_choice = false;
		combat_msg = "";
		hit = false;
		damage = 0;
		person = ""
		enemy_nearest = noone;
		enemy_msg = "";
		turn_start = true;
		combat_turn = (combat_turn + 1)%ds_list_size(turn_list);
		can_left = true;
		can_right = true;
		can_above = true;
		can_below = true;

	}
		
}


//Dice Roller for Combat




