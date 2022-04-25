/// @description Insert description here
// You can write your code in this editor
//Camera position
cam_x = camera_get_view_x(view_camera[0]);
cam_y = camera_get_view_y(view_camera[0]);
show_debug_message(Player.has_cure);
draw_self();
if (talk){
	draw_sprite_ext(scroll,0,cam_x,cam_y+630,1,1,0,c_white,1);
	draw_sprite_ext(scroll,0,cam_x,cam_y,1,1,0,c_white,1);
	draw_set_alpha(1);
	draw_set_color(c_black);
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_center);
	draw_set_font(scroll_fnt);
	draw_text(cam_x + 420,cam_y + 170, "There is a story I heard from a traveler from beyond the distant lands. Orvo and Urgon found\nthe blue vials in Salsvault, an Aeorian ruin partially submerged in water in a region of Foren where\nthe glacial ice is thin. Orvo believed the ruin is so well preserved because the structure was reinforced\nwith magic, as were many of Aeor's buildings that housed hazardous materials or secret projects.");
	draw_text(cam_x + 420, cam_y + 810, "Salsvault is two hundred miles northwest of Syrinlya. Ice mephits are drawn to the magic\nof the location. Orvo and Urgon found the ruin after following one of the creatures to what appeared\nto have been an Aeorian lab. Orvo and Urgon explored only three of its chambers before being chased\naway by animated suits of armor. The dwarves didn't know what the vials contained. Orvo sold\nhis treasure to the Buyer. Urgon decided to hang onto his until he returned home to Palebank Village.");
	if(alarm[0] == -1) alarm[0] = room_speed * 30;
}

if (Player.has_cure){
	draw_sprite_ext(scroll,0,cam_x,cam_y+630,1,1,0,c_white,1);
	draw_set_alpha(1);
	draw_set_color(c_black);
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_center);
	draw_set_font(scroll_fnt);
	draw_text(cam_x + 420, cam_y + 800, "\"I see you have brought back something from the Vault. Is it the cure?\"\nYou confirm it is and hand over the vials you found in the Vault.\n \"Thank you very much Adventurer! I shall get these back to PaleBank right away.\"");
	if(alarm[1] == -1) alarm[1] = room_speed * 10;
}