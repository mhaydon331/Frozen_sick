/// @description Insert description here
// You can write your code in this editor
draw_self();
//Camera position
cam_x = camera_get_view_x(view_camera[0])
cam_y = camera_get_view_y(view_camera[0])

if(selected == true) {
	draw_sprite(spr_grid,0,x,y);
	draw_sprite_ext(can_jump_spr,0,predict_X,predict_Y,1,1,0,c_white,1);
}

//move between rooms player alert
if (on_door){
	draw_set_alpha(1);
	draw_set_color(c_yellow);
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_center);
	draw_text(x+35,bbox_top,msg+"\n (Enter)");
}

//ulgors cabin alerts player 
if (on_footsteps){
	draw_set_alpha(1);
	draw_set_color(c_yellow);
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_center);
	draw_text(x+35,bbox_top,"Inspect?\n (Enter)");
}

if (investigate_footsteps){
	draw_sprite_ext(scroll,0,0,630,1,1,0,c_white,1);
	draw_set_alpha(1);
	draw_set_color(c_black);
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_center);
		draw_set_font(scroll_fnt);
	draw_text(420,780,"There are some footprints on the ground here. \nThey lead out of the cabin and seem to be from the intruder.\nThey lead to another cabin on the way out of town.\n");
}
	

// Tulgis Cabin Commands
if (on_knock_T){
	draw_sprite_ext(scroll,0,0,630,1,1,0,c_white,1);
	draw_set_alpha(1);
	draw_set_color(c_black);
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_center);
	draw_set_font(scroll_fnt);
	draw_text(420,780,"This snow-covered cabin looks peaceful and quiet from the outside.\n Its windows are shuttered, and a steady stream of smoke\n piping out of the chimney indicates a roaring fire within.\n Would You like to knock? (Enter)");
}

// Pelc's Curiosities Draw Commands
if (on_peek_P){
	draw_sprite_ext(scroll,0,cam_x,cam_y,1,1,0,c_white,1);
	draw_set_alpha(1);
	draw_set_color(c_black);
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_center);
	draw_set_font(scroll_fnt);
	draw_text(cam_x + 420,cam_y + 170,"The dark cabin before you has a sign over its door which reads,\n Pelc's Curiosities, with the image of a curving dragon used to make the letter P.\n Though the shop appears closed, the front door is slightly ajar.\nWould You like to look inside? (Enter)");
}

if (Pelcs_seen){
	draw_sprite_ext(scroll,0,cam_x,cam_y,1,1,0,c_white,1);
	draw_set_alpha(1);
	draw_set_color(c_black);
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_center);
	draw_set_font(scroll_fnt);
	draw_text(cam_x + 420,cam_y + 150, "Five cloaked elves appear to have ransacked the shop and are searching\nthrough the broken debris on the floor. The furniture, shelves, and front\ncounter have been smashed, and the shop's wares now litter the floor.");
}
	