/// @description Insert description here
// You can write your code in this editor

// move between rooms - Cabins

on_door = collision_point(x,y,obj_door_U_cabin,true,true);
//show_debug_message("Num_controllers: " + string(instance_number(obj_controller)));
//show_debug_message(boat_Ride);
if (boat_Ride == true){
	obj_movement.can_move = false;
	boat_Ride = false;
	alarm[1] = 1;
	depth = 1;
	obj_NPC1.depth = 1;
	obj_NPC2.depth = 1;
	obj_NPC3.depth = 1;
	show_debug_message("WEEEEE!");
}
