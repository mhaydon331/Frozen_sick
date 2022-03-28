/// @description 

//testing inv array
// can display inventory

draw_set_font(scroll_fnt);
draw_set_color(c_yellow);
for (i = 0; i< array_length(inv);i++){
	_xx = camera_get_view_x(view_camera[0]) + 70;
	_yy = camera_get_view_y(view_camera[0]) + 70;
	draw_text(_xx, _yy + 18*i, inv[i].name);
}