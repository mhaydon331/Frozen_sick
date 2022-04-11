/// @description Control Dice logic
//Be controlled by a function call/script rollDice()


if (global.dice != noone  && global.game_state != states.suspend){
instance_create_layer(room_width/2, room_height/2, "Dice", obj_dice); 
	switch(global.dice){
		case 1:	
			sprite_index = spr_dice[0];
		case 2:	
			sprite_index = spr_dice[1];	
		case 3:	
			sprite_index = spr_dice[2];			
		case 4:	
			sprite_index = spr_dice[3];		
		case 5:	
			sprite_index = spr_dice[4];			
		case 6:	
			sprite_index = spr_dice[5];			
		case 7:	
			sprite_index = spr_dice[6];			
		case 8:	
			sprite_index = spr_dice[7];			
		case 9:	
			sprite_index = spr_dice[8];			
		case 10:	
			sprite_index = spr_dice[9];			
		case 11:	
			sprite_index = spr_dice[10];			
				
		case 12:	
			sprite_index = spr_dice[11];			
		case 13:	
			sprite_index = spr_dice[12];			
		case 14:	
			sprite_index = spr_dice[13];			
		case 15:	
			sprite_index = spr_dice[14];			
		case 16:	
			sprite_index = spr_dice[15];			
		case 17:	
			sprite_index = spr_dice[16];			
		case 18:	
			sprite_index = spr_dice[17];			
		case 19:	
			sprite_index = spr_dice[18];			
		case 20:	
			sprite_index = spr_dice[19];			
	}
	
	
	
}

