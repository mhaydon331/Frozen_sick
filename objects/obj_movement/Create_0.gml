/// @description movement variables 

can_move = true;
selected = false;
can_jump_Time = 30;
can_jump_Timer = can_jump_Time;

//30-foot prediction calculations
// also used for combat movement
predict_X = 0;
old_X = 0;
predict_Y = 0;
old_Y = 0;

//grid movemnet
can_jump_spr = spr_red;
jump_max = 70*6;

//combat controlls

