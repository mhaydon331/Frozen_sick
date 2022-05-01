/// @description Insert description here
// You can write your code in this editor
draw_self();
//Camera position
cam_x = camera_get_view_x(view_camera[0])
cam_y = camera_get_view_y(view_camera[0])


//move between rooms player alert
if (on_door && !no_display){
	draw_set_alpha(1);
	draw_set_color(c_yellow);
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_center);
	draw_text(x+35 + x_messageOffset,bbox_top + y_messageOffset,msg+"\n (Enter)");
}