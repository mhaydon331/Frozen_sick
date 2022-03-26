/// @description 

//create
if (!instance_exists(obj_carrier)) {
	instance_create_depth(0,0,0,obj_carrier);
}

obj_carrier.targetEnter = targetEnter;

