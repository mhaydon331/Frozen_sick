/// @description Control Dice logic
//Be controlled by a function call/script rollDice()


if (global.dice != noone  && global.game_state != states.suspend){
	image_index = global.dice - 1;
}

if(global.game_state != states.combat) x = room_width + 200;
