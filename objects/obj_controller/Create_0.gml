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

// combat group for getting enemies
enum combat_group { 
	ccave_2,
	ccave_5,
	svault_3,
	svault_6,
	svault_9,
	svault_12,
	svault_14,
	svault_16,
	combat_none,
}

global.combat_zone = combat_group.combat_none;
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