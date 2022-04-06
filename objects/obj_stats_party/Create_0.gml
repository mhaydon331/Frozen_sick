/// @description stats and actions for player and npcs in one place

//Player
HP_max = 50;
// all hit rolls and damage rolls can be done through irandom()
//spell = 1(d20)+4 to hit 1(d8) damage = irandom(20)+5 and irandom(8)+1
//crossbow = 1(d20)+2 to hit 1(d6) damage = irandom(20)+3 and irandom(6)+1
//sword = 1(d20)+3 to hit 1(d10) damage (has to be in next square) = = irandom(20)+4 and irandom(10)+1

//reset all hp to hp_max if in towns

global.stat_party = {
	player : {
		HP : 50,
		actions :["Spell", "CrossBow", "Sword", "Block"],
		armor : 18,
	}
	NPC1 : {
		HP : 50,
		actions :["Spell", "CrossBow", "Sword", "Block"],
		armor : 15,
	}
	NPC2 : {
		HP : 50,
		actions :["Spell", "CrossBow", "Sword", "Block"],
		armor : 15,
	}
	NPC3 : {
		HP : 50,
		actions :["Spell", "CrossBow", "Sword", "Block"],
		armor : 15,
	}
}