/// @description Insert description here
// You can write your code in this editor

cam_x = camera_get_view_x(view_camera[0]);
cam_y = camera_get_view_y(view_camera[0]);

if (global.game_state == states.combat){
	if (player_selected) {
		draw_sprite(spr_grid,0,Player.x,Player.y);
		draw_sprite_ext(can_jump_spr,0,predict_X,predict_Y,1,1,0,c_white,1);
	}
	if (hit) {
		show_debug_message(combat_msg);
		draw_sprite_ext(scroll,0,cam_x,cam_y,1,1,0,c_white,1);
		draw_set_alpha(1);
		draw_set_color(c_black);
		draw_set_valign(fa_bottom);
		draw_set_halign(fa_center);
		draw_set_font(scroll_fnt);
		draw_text(420 + cam_x,120 + cam_y, combat_msg + " Press Enter");
	}
}