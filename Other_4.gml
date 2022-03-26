/// @description
if (instance_exists(obj_carrier)){
	targetEnter = obj_carrier.targetEnter;
	
	instance_destroy(obj_carrier);
	
	if(instance_exists(targetEnter)) {
		x = targetEnter.x;
		y = targetEnter.y;
	}
}