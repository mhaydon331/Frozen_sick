
//Camera position
cam_x = camera_get_view_x(view_camera[0])
cam_y = camera_get_view_y(view_camera[0])

// Main town 

/*
enter new text here
*/

if (paleBankEnter){
	draw_sprite_ext(scroll,0,cam_x,cam_y+630,1,1,0,c_white,1);
	draw_set_alpha(1);
	draw_set_color(c_black);
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_center);
	draw_set_font(scroll_fnt);
	draw_text(cam_x + 420,cam_y + 810, "Snow gently falls from the sky and wind bites your cheeks as you enter Palebank Village,\na fishing outpost of Uthodurn that is home to several hundred dwarves and elves. The sun is low\nin the sky, sinking behind the walls of the town. You have arrived to attend a funeral for\nUrgon Wenth, an old dwarf who caught a curse or disease that turned him into an ice statue.\nThe folk of the village are gathering to pay their final respects to Urgon's frozen remains.");
}

if (elder_approches){
	draw_sprite_ext(scroll,0,cam_x,cam_y+630,1,1,0,c_white,1);
	draw_set_alpha(1);
	draw_set_color(c_black);
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_center);
	draw_set_font(scroll_fnt);
	draw_text(cam_x + 420,cam_y + 800, "A gruff voice speaks softly to the right of you. \"Thank you for coming to attend Urgon's\nservice.\" You turn and meet the gaze of Elro Aldataur, a weathered elf, retired ranger, and\ntheleader of the village. \"I'm sorry to speak of dark tidings under such circumstances,\nbut I believe that Palebank Village might be in danger, and I'm hoping you can help us.\"");
}
	
	
//ulgors cabin alerts player 
if (on_footsteps){
	draw_set_alpha(1);
	draw_set_color(c_yellow);
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_center);
	draw_text(x+35,bbox_top,"Inspect?\n (Enter)");
}

if (investigate_footsteps){
	draw_sprite_ext(scroll,0,0,630,1,1,0,c_white,1);
	draw_set_alpha(1);
	draw_set_color(c_black);
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_center);
		draw_set_font(scroll_fnt);
	draw_text(420,780,"There are some footprints on the ground here. \nThey lead out of the cabin and seem to be from the intruder.\nThey lead to another cabin on the way out of town.\n");
}

// Tulgis Cabin Commands
if (on_knock_T){
	draw_sprite_ext(scroll,0,0,630,1,1,0,c_white,1);
	draw_set_alpha(1);
	draw_set_color(c_black);
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_center);
	draw_set_font(scroll_fnt);
	draw_text(420,780,"This snow-covered cabin looks peaceful and quiet from the outside.\n Its windows are shuttered, and a steady stream of smoke\n piping out of the chimney indicates a roaring fire within.\n Would You like to knock? (Enter)");
}
if (on_enter_T){
	draw_sprite_ext(scroll,0,0,630,1,1,0,c_white,1);
	draw_set_alpha(1);
	draw_set_color(c_black);
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_center);
	draw_set_font(scroll_fnt);
	draw_text(420,810,"The heat in this small cabin hits like a hammer blow. A table set with neatly stacked dishes,\ntools, and utensils stands at the center of the room. The smell of a simmering soup comes from\na pot hanging inside a roaring fireplace. Another fire burns in an iron brazier at the opposite\nend of the room, filling the cabin with a smoky haze.Shivering at the end of a bed near the\nbrazier is a dwarf wrapped in blankets. Bulging blue veins streak her face, neck, and hands.");
}

// Pelc's Curiosities Draw Commands
if (on_peek_P){
	draw_sprite_ext(scroll,0,cam_x,cam_y,1,1,0,c_white,1);
	draw_set_alpha(1);
	draw_set_color(c_black);
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_center);
	draw_set_font(scroll_fnt);
	draw_text(cam_x + 420,cam_y + 170,"The dark cabin before you has a sign over its door which reads, \"Pelc's Curiosities,\" \nwith the image of a curving dragon used to make the letter P.\n Though the shop appears closed, the front door is slightly ajar.\n Would you like to look inside? (Enter)");
}

if (Pelcs_seen){
	draw_sprite_ext(scroll,0,cam_x,cam_y,1,1,0,c_white,1);
	draw_set_alpha(1);
	draw_set_color(c_black);
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_center);
	draw_set_font(scroll_fnt);
	draw_text(cam_x + 420,cam_y + 150, "Five cloaked elves appear to have ransacked the shop and are searching\nthrough the broken debris on the floor. The furniture, shelves, and front\ncounter have been smashed, and the shop's wares now litter the floor.");
}
if (verlas_quarters){
	draw_sprite_ext(scroll,0,cam_x,cam_y+630,1,1,0,c_white,1);
	draw_set_alpha(1);
	draw_set_color(c_black);
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_center);
	draw_set_font(scroll_fnt);
	draw_text(cam_x + 420,cam_y + 800, "What appears to be an ice statue of an elf is bundled beneath the blankets\n of a bed along the east wall of the room. A small table loaded with\n dirty teacups and a kettle stands next to the bed.");
}


//Buyer's Cabin Draw
	
if (on_knock_B){
	// knock on door
	draw_sprite_ext(scroll,0,0,630,1,1,0,c_white,1);
	draw_set_alpha(1);
	draw_set_color(c_black);
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_center);
	draw_set_font(scroll_fnt);
	draw_text(420,720,"Would You like to knock? (Enter)");
}
if (on_enter_B){
	draw_sprite_ext(scroll,0,cam_x,cam_y+630,1,1,0,c_white,1);
	draw_set_alpha(1);
	draw_set_color(c_black);
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_center);
	draw_set_font(scroll_fnt);
	draw_text(cam_x + 420,cam_y + 800, "The pungent scent of incense fills this yurt, whose walls are painted with glowing arcane\nrunes. A brass brazier burns brightly at the center of the floor, around which are set a\nfew plush chairs, a bed, and a large stone chest. On one of those chairs sits \nan elf reading a book. A small dragon with green butterfly wings is curled in the elf's lap.");
}

//Croakers Cave
if (cave_1){
	draw_sprite_ext(scroll,0,cam_x,cam_y+630,1,1,0,c_white,1);
	draw_set_alpha(1);
	draw_set_color(c_black);
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_center);
	draw_set_font(scroll_fnt);
	draw_text(cam_x + 420,cam_y + 770, "The slow dripping of water sounds out where it falls from stalactites down into\na murky pool that fills the rough tunnel ahead.\nEvery few moments, a loud croaking sounds out from somewhere in the darkness beyond.");
}
if (cave_2){
	draw_sprite_ext(scroll,0,cam_x,cam_y+630,1,1,0,c_white,1);
	draw_set_alpha(1);
	draw_set_color(c_black);
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_center);
	draw_set_font(scroll_fnt);
	draw_text(cam_x + 420,cam_y + 810, "The slow dripping of water from the ceiling flows to a pool in the southwest corner of this\ncavern. A large wooden bucket with a lid sits near the edge of the pool.\nA dwarf and two elves bundled in layers of winter clothing are\nthrowing dead bats into the air. Two giant blue-skinned frogs leap\nup to snatch the bats in midair, seemingly as part of some sort of training session.");
}
if (cave_3){
	draw_sprite_ext(scroll,0,cam_x,cam_y+630,1,1,0,c_white,1);
	draw_set_alpha(1);
	draw_set_color(c_black);
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_center);
	draw_set_font(scroll_fnt);
	draw_text(cam_x + 420,cam_y + 750, "This cavern reeks, and its floor is covered in bat guano.");
}

if (cave_4){
	draw_sprite_ext(scroll,0,cam_x,cam_y+630,1,1,0,c_white,1);
	draw_set_alpha(1);
	draw_set_color(c_black);
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_center);
	draw_set_font(scroll_fnt);
	draw_text(cam_x + 420,cam_y + 770, "Ten empty bedrolls are arranged in a circle around a cold fire pit at the center of this\ncavern. Chicken bones, empty wine and spirits bottles, and other food waste litters the floor.");
}

if (cave_5){
	draw_sprite_ext(scroll,0,cam_x,cam_y+630,1,1,0,c_white,1);
	draw_set_alpha(1);
	draw_set_color(c_black);
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_center);
	draw_set_font(scroll_fnt);
	draw_text(cam_x + 420,cam_y + 750, "Water dripping down from stalactites in the ceiling\nfills a dark pool that completely covers the floor of this cavern.");
}

if (cave_6){
	draw_sprite_ext(scroll,0,cam_x,cam_y+630,1,1,0,c_white,1);
	draw_set_alpha(1);
	draw_set_color(c_black);
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_center);
	draw_set_font(scroll_fnt);
	draw_text(cam_x + 420,cam_y + 800, "A warm rush of heat comes from a massive fire burning in the center of this cavern.\n The flames illuminate a bedroll near the back wall of the cavern.\nNear the crackling blaze, a dwarf bundled in a heavy cloak sits on a stone chest beside an\nelf whose face is covered in dragon tattoos. The dwarf's face is streaked with pulsing blue veins.");
}

//Syrinlya
if (Syrinlya_enter){
	draw_sprite_ext(scroll,0,cam_x,cam_y,1,1,0,c_white,1);
	draw_set_alpha(1);
	draw_set_color(c_black);
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_center);
	draw_set_font(scroll_fnt);
	draw_text(cam_x + 420,cam_y + 170,"Upon reaching the village of Syrinlya you are told about some town features by a fellow\npassenger from the boat. Morgo Delwur, a female dwarf, tells you of a large yurt in town,\n owned by someone known as the \"Buyer\" where you can transport items back to Palebank.\nAs you enter you see a tent to your left separated from other huts in the town.");
}

if (on_tent){
	draw_sprite_ext(scroll,0,cam_x,cam_y,1,1,0,c_white,1);
	draw_set_alpha(1);
	draw_set_color(c_black);
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_center);
	draw_set_font(scroll_fnt);
	draw_text(cam_x + 420,cam_y + 140,"A campfire burns in front of this small tent, whose flaps are open. Inside\nthe tent sits a young dwarf whose face is scarred as though scratched by a large claw.\nA shortsword is casually laid across his lap as he warms his outstretched hands.");
}

// Salsvault
if (vault_knock) {
	draw_set_alpha(1);
	draw_set_color(c_yellow);
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_center);
	draw_text(x+35,bbox_top,"Open Door?\n (Enter)");
}