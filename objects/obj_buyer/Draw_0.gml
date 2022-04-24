/// @description Insert description here
// You can write your code in this editor
//Camera position
cam_x = camera_get_view_x(view_camera[0]);
cam_y = camera_get_view_y(view_camera[0]);
draw_self();
if (talk){
	draw_sprite_ext(scroll,0,cam_x,cam_y+630,1,1,0,c_white,1);
	draw_set_alpha(1);
	draw_set_color(c_black);
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_center);
	draw_set_font(scroll_fnt);
	draw_text(cam_x + 420,cam_y + 500, "There is a story I heard from a traveler from beyond the distant lands.\nOrvo and Urgon found the blue vials in Salsvault, an Aeorian ruin partially submerged in water in a region of Foren where the glacial ice is thin\n.Explorers call this region Thin Sheets. Orvo believes the ruin is as well preserved as it is because the structure was reinforced with magic,\nas were many of Aeor’s buildings that housed hazardous materials or secret projects.");
	draw_text(cam_x + 420, cam_y + 800, "Salsvault is two hundred miles northwest of Syrinlya. Ice mephits are drawn to the magic of something at that location.\nOrvo and Urgon found the ruin after following one of the creatures.\nSalsvault appears to have been an Aeorian lab. Orvo and Urgon explored only three of its chambers before being chased away by animated suits of armor.\nThe dwarves didn’t know what the vials contained.\nOrvo sold his share of the treasure from Salsvault to the Buyer. Urgon decided to hang onto his share until he returned home to Palebank Village.");
	if(alarm[0] == -1) alarm[0] = room_speed * 20;
}



