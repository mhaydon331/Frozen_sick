/// @description 
depth = -9999;

//item constructor
function create_item(_name, _desc, _hidden_desc, _price, _sprite, _icon, _uses, _number) constructor 
{
	name = _name;
	desc = _desc;
	hidden_desc = _hidden_desc;
	price = _price; //used for shop or to seel items
	sprite = _sprite;
	icon = _icon;
	uses = _uses;
	amount = _number;
}

// create items
global.inv_list = {
	//Urgon's Cabin Inv
	reciept :  new create_item(
		"Reciept", 
		"Reciept found in Urgon's Cabin",
		"",
		0,
		noone,
		noone,
		-1,
		1),
	
	//Tulgi's Cabin
	dagger : new create_item(
		"Ornate Dagger",
		"Dagger Found in Tulgi's Possesion\nWas from Ulgon's cabin",
		"relic of the fallen flying city of Aeor",
		100,
		noone,
		noone,
		-1,
		1
	),
	//others
	
}

// create the inventory
inv = array_create(0);

// 
