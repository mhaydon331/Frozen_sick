// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function playSequence(seq){
	if(seq != noone){
		
		var camX = camera_get_view_x(view_camera[0]) + floor(camera_get_view_width(view_camera[0])*.5);	
		var camY = camera_get_view_y(view_camera[0]) + floor(camera_get_view_height(view_camera[0])*.5);	
		
		if(instance_exists(obj_controller) && !layer_sequence_exists(obj_controller.curSeqLayer, seq)){
			if(layer_exists(obj_controller.curSeqLayer)){
				layer_sequence_create(obj_controller.curSeqLayer, camX, camY, seq);
				layer_depth(obj_controller.curSeqLayer, -10000);
			}
		}
	}
}