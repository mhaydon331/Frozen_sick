
function rollDice(x,y){
	
	global.dice = irandom_range(1,20); //Sets Dice for obj_dice
	var dice = obj_dice;
	//var cam = view_camera[0];
	//var xPos = camera_get_view_x(cam);
	//var yPos = camera_get_view_y(cam);
	//Move Dice on and off camera if combat
	if(global.game_state == states.combat){
		dice.depth = -1000000000;
		dice.x = x + 20;
		dice.y = y + 100;		
	}
	else{
		dice.x = room_width+200;
	}

	return global.dice;
}