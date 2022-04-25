/// @description
if (instance_exists(obj_carrier)){
	targetEnter = obj_carrier.targetEnter;
	boat_Ride = obj_carrier.boat_Ride;
	has_cure = obj_carrier.has_cure;
	instance_destroy(obj_carrier);
	
	if(instance_exists(targetEnter)) {
		x = targetEnter.x;
		y = targetEnter.y;
	}
}