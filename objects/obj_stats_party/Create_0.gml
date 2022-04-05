/// @description stats and actions for player and npcs in one place

//Player
HP_max = 50;
playerHP = 50;
player_actions = ["Spell", "CrossBow", "Sword", "Block"];
player_armor = 18;
// all hit rolls and damage rolls can be done through irandom()
//spell = 1(d20)+4 to hit 1(d8) damage = irandom(20)+5 and irandom(8)+1
//crossbow = 1(d20)+2 to hit 1(d6) damage = irandom(20)+3 and irandom(6)+1
//sword = 1(d20)+3 to hit 1(d10) damage (has to be in next square) = = irandom(20)+4 and irandom(10)+1

//NPC1
NPC1HP = 50;
NPC1_actions = ["Spell", "CrossBow", "Sword", "Block"];
NPC1_armor = 15;

//NPC2
NPC2HP = 50;
NPC2_actions = ["Spell", "CrossBow", "Sword", "Block"];
NPC2_armor = 15;

//NPC3
NPC3HP = 50;
NPC3_actions = ["Spell", "CrossBow", "Sword", "Block"];
NPC3_armor = 15;

//reset all hp to hp_max if in towns
