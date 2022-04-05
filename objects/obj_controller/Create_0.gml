/// @description Game variables and Enums

//Game Variables
//TODO: ADD Sound & volume control



//Game States
enum states {
	suspend, //This state will be used as a total suspend state
	playing,
	paused,
	gameover,
	combat,
}

global.playerTurn = false;

//Sequence States
enum seqState {
	notPlaying,
	waiting,
	playing,
	finished,
}

//Sequence Variables
sequenceState = seqState.notPlaying;
curSeqLayer = noone;
curSeq = noone;


//Setting Initial Game State
global.game_state = states.suspend;


//Pause Menu Options
pauseOption = ["Resume", "Quit", "Restart"];
pauseOptionSelected = 0;