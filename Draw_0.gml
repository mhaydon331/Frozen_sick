/// @description Insert description here
// You can write your code in this editor
draw_self();
if(selected == true) {
	draw_sprite(spr_grid,0,x,y);
	draw_sprite_ext(can_jump_spr,0,predict_X,predict_Y,1,1,0,c_white,1);
}

if (on_door){
	draw_set_alpha(1);
	draw_set_color(c_yellow);
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_center);
	draw_text(x+35,bbox_top,"Enter Cabin?\n (Enter)");
}
