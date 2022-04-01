/// @description Insert description here
// You can write your code in this editor
if(selected == true) {
	draw_sprite(spr_grid,0,Player.x,Player.y);
	draw_sprite_ext(can_jump_spr,0,predict_X,predict_Y,1,1,0,c_white,1);
}