/// @description create stats for player

image_index = armor_black;
can_move = true;
selected = false;
can_jump_Time = 30;
can_jump_Timer = can_jump_Time;

//30-foot prediction calculations
// also used for combat movement
predict_X = 0;
predict_Y = 0;

can_jump = false;
can_jump_spr = spr_red;
jump_max = 70*6;
jump_amount = 0;
jumpX = 0;
jumpY = 0;

on_door = false;

targetEnter = noone;