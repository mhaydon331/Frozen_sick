/// @description reset can move
obj_movement.can_move = true;
if(layer_exists("CutScenes")) layer_destroy(obj_controller.curSeqLayer);
depth = -9999;
obj_NPC1.depth = -9999;
obj_NPC2.depth = -9999;
obj_NPC3.depth = -9999;
no_display = false;