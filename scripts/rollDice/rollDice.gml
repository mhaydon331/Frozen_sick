
function rollDice(){
	
	global.dice = irandom_range(1,20); //Sets Dice for obj_dice
	var dice = obj_dice;
	//var cam = view_camera[0];
	//var xPos = camera_get_view_x(cam);
	//var yPos = camera_get_view_y(cam);
	//Move Dice on and off camera if combat
	if(global.game_state == states.combat){
		dice.depth = -10000;
		dice.x = Player.x-300;
		dice.y = Player.y+50;		
	}
	else{
		dice.x = room_width+200;
	}

	return global.dice;
}