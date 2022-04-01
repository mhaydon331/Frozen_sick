/// @description Insert description here
// You can write your code in this editor

// move between rooms - Cabins

on_door = collision_point(x,y,obj_door_U_cabin,true,true);

//ulgors cabin interactions
on_footsteps = collision_point(x,y,Obj_footsteps,true,true);
if(!on_footsteps){
	investigate_footsteps = false;
}

//Tulgi's CAbin interactions
on_knock_T = collision_point(x,y,Obj_knock_Tulgi,true,true);

// Pelcs Interactions
on_peek_P = collision_point(x,y,Obj_Peek_Pelcs,true,true);
if (Pelcs_seen){
	Pelcs_seen_enemies = true;
	if (x != Pelcs_seenx || y != Pelcs_seeny){
		Pelcs_seen = false;
	}
}

//Buyers Interactions
on_knock_B = collision_point(x,y,Obj_knock_Buyer,true,true);
if (on_enter_B){
	if (x != Buyer_seenx || y != Buyer_seeny){
		on_enter_B = false;
	}
}