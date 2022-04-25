/// @description Insert description here
// You can write your code in this editor
//Camera position
cam_x = camera_get_view_x(view_camera[0]);
cam_y = camera_get_view_y(view_camera[0]);
draw_self();
if (talk){
	draw_sprite_ext(scroll,0,cam_x,cam_y+630,1,1,0,c_white,1);
	//draw_sprite_ext(scroll,0,cam_x,cam_y,1,1,0,c_white,1);
	draw_set_alpha(1);
	draw_set_color(c_black);
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_center);
	draw_set_font(scroll_fnt);
	//draw_text(cam_x + 420,cam_y + 170, "There is a story I heard from a traveler from beyond the distant lands. Orvo and Urgon found\nthe blue vials in Salsvault, an Aeorian ruin partially submerged in water in a region of Foren where\nthe glacial ice is thin. Orvo believed the ruin is so well preserved because the structure was reinforced with\nmagic, as were many of Aeor’s buildings that housed hazardous materials or secret projects.");
	draw_text(cam_x + 420, cam_y + 800, "\"Oh my!\" You here a ghost exclaim. \"It has been a long while since I have seen anyone\naround here. I see you are looking for a cure since you carry a vial of my life's work with you.\nThe cure you seek is in a chest in the room across the hall. Beware not to go in the room\nmarked with a red X mind you. I must be off\" And with that you see him disapear before your eyes.");
	if(alarm[0] == -1) alarm[0] = room_speed * 20;
}



