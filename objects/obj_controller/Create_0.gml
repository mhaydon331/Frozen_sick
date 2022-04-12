/// @description Game variables and Enums

//Game Variables
//TODO: ADD Sound & volume control

//Let's get Random
randomise();

depth = -9999999;
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
	combat_none,// no combat
	ccave_2,
	ccave_5,
	svault_3,
	svault_6,
	svault_9,
	svault_12,
	svault_14,
	svault_16,
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
initial_combat = false;
combat_turn = 0;


//Pause Menu Options
pauseOption = ["Resume", "Quit", "Restart"];
pauseOptionSelected = 0;

//Game Dice
global.dice = noone;

//combat movement 
player_selected = false;
//30-foot prediction calculations
// also used for combat movement
predict_X = 0;
old_X = 0;
predict_Y = 0;
old_Y = 0;

//grid movemnet
can_jump_spr = spr_red;
jump_max = 70*6;

//NPC1 movement
turn_start = false;
action = "";
hit = false;
damage = 0;

combat_msg = "";
person = "";
enemy_msg = "";

enemy_count = 0;


