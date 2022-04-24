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
	draw_text(cam_x + 420,cam_y + 800, "You should seek Syrinlya where I hear there is a wise Buyer\n who may have a cure to this accursed affliction.\nI suffer from a terrible disease that is coursing through my veins as well.\nI must be off in quick haste not to suffer the same fate as the accursed villagers of Palebank Village.\nThere is no time to waste!");
	if(alarm[0] == -1) alarm[0] = room_speed * 20;
}



