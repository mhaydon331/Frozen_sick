/// @description Insert description here
// You can write your code in this editor
talk = false;
if (!Player.healed_once) {
	Player.HP = 50;
	obj_NPC1.HP = 50;
	obj_NPC2.HP = 50;
	obj_NPC3.HP = 50;
	Player.healed_once = true;
}
obj_movement.can_move = true;
//instance_destroy();

