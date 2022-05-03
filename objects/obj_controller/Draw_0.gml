/// @description Insert description here
// You can write your code in this editor

cam_x = camera_get_view_x(view_camera[0]);
cam_y = camera_get_view_y(view_camera[0]);

if (global.game_state == states.combat){
	if (player_selected) {
		draw_sprite(spr_grid,0,Player.x,Player.y);
		draw_sprite_ext(can_jump_spr,0,predict_X,predict_Y,1,1,0,c_white,1);
	}
	if (enemy_selection){
		draw_sprite_ext(can_jump_spr,0,predict_X,predict_Y,1,1,0,c_white,1);
	}
	if (hit) {
		//show_debug_message(combat_msg);
		draw_sprite_ext(scroll,0,cam_x,cam_y,1,1,0,c_white,1);
		draw_set_alpha(1);
		draw_set_color(c_black);
		draw_set_valign(fa_bottom);
		draw_set_halign(fa_center);
		draw_set_font(scroll_fnt);
		if (player_selected){
			draw_text(420 + cam_x,120 + cam_y, combat_msg + "\nPress Enter to skip turn");
		} else {
			draw_text(420 + cam_x,120 + cam_y, combat_msg + " Press Enter");
		}
	}
	if (display_choice) {
		//show_debug_message(combat_msg);
		draw_sprite_ext(scroll,0,cam_x,cam_y,1,1,0,c_white,1);
		draw_set_alpha(1);
		draw_set_color(c_black);
		draw_set_valign(fa_bottom);
		draw_set_halign(fa_center);
		draw_set_font(scroll_fnt);
		draw_text(420 + cam_x,160 + cam_y, "Press number for action choice then click on enemy\n 1) Spell    \n 2) Crossbow \n 3) Sword    ");
	}
}
if (room == CroakersCave || room == SalsVault) {
	draw_set_alpha(1);
	draw_set_font(health_fnt);
	draw_set_color(c_black);
	draw_sprite(scroll_health,0,cam_x + 770, cam_y);
	draw_text(805 + cam_x,20 + cam_y, "HEALTH");
	draw_text(805 + cam_x,32 + cam_y, "P: " + string(Player.HP) + "/50");
	draw_text(805 + cam_x,44 + cam_y, "NPC1: " + string(obj_NPC1.HP) + "/50");
	draw_text(805 + cam_x,56 + cam_y, "NPC2: " + string(obj_NPC2.HP) + "/50");
	draw_text(805 + cam_x,68 + cam_y, "NPC3: " + string(obj_NPC3.HP) + "/50");
}