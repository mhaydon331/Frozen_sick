// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function item_add(_item){
	//can use later to limit inv if add inv max or max weight? if we want 
	//else if returned false don't pick up item
	var _added = false;
	
	array_push(obj_inventory_manager.inv,_item);
	_added = true;
	return _added;
}