/// @description Game Start - Game Variables

//Game Variables
//TODO: ADD Sound & volume control


enum states {
	pregame,
	playing,
	paused,
	gameover,
	
}
//Setting Initial Game State
global.game_state = states.pregame;


//Pause Menu Options
pauseOption = ["Resume", "Quit", "Restart"];
pauseOptionSelected = 0;