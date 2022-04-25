/// @description 

//create
if (!instance_exists(obj_carrier)) {
	instance_create_depth(0,0,0,obj_carrier);
}

obj_carrier.targetEnter = targetEnter;
obj_carrier.boat_Ride = boat_Ride;
obj_carrier.has_cure = has_cure;

