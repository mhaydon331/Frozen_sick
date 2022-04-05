/// @description


if (room == MainTown){
	if (Player.x == x && Player.y == y && first_enter){
		paleBankEnter = true;
		//change later
		alarm[0] = 1*room_speed;
		obj_movement.can_move = false;
		first_enter = false;
	}
	if (Player.x != x || Player.y != y){
		elder_approches = false;
		instance_deactivate_region(x+35,y+35,1,1,true,false);
	}
}

if (room == UlgorCabin){
	if (Player.x == x && Player.y == y){
		on_footsteps = true;
	}
	if (investigate_footsteps) {
		if (Player.x != x || Player.y != y){
			instance_deactivate_region(x+35,y+35,1,1,true,false);
		}
	}
		
}

if (room == TulgiCabin){
	if (Player.x == x && Player.y == y && trigger_number == 0){
		on_knock_T = true;
	}
	else {
		on_knock_T = false;
	}
	if (Player.x == x && Player.y == y && trigger_number == 1){
		on_enter_T = true;
	}
	if(on_enter_T){
		if(Player.x != x || Player.y != y){
			instance_destroy(trigger_Tulgi_1);
		}
	}
}
	
if (room == PelcsCuriosities){
	if (Player.x == x && Player.y == y){
		on_peek_P = true;
	} 
	if (Pelcs_seen){
		Pelcs_seen_enemies = true;
		if (Player.x != x || Player.y != y){
			instance_deactivate_region(x+35,y+35,1,1,true,false);
		}
	}
	if (Player.x >= x && Player.x <= x+280 && Player.y >= y && Player.y <= y+140 && trigger_number == 1){
		verlas_quarters = true;
		Pelcs_seenx = Player.x;
		Pelcs_seeny = Player.y;
		trigger_number = 0;
	}
	if(verlas_quarters){
		if(Player.x != Pelcs_seenx || Player.y !=  Pelcs_seeny){
			instance_destroy(trigger_pelcs_1);
		}
	}
}

if (room == BuyerHut){
	if (Player.x == x && Player.y == y && trigger_number == 0){
		on_knock_B = true;
	} 
	if (on_enter_B){
		if (Player.x != x || Player.y != y){
			instance_deactivate_object(obj_triggers);
		}
	}
}

if (room == CroakersCave){
	if (Player.x >= x && Player.x <= x+70*image_xscale && Player.y >= y && Player.y <= y+70*image_yscale && first_enter){
		if (trigger_number == 1){
			cave_1 = true;
			first_enter = false;
		} else if (trigger_number == 2){
			cave_2 = true;
			first_enter = false;
		} else if (trigger_number == 3){
			cave_3 = true;
			first_enter = false;
		} else if (trigger_number == 4){
			cave_4 = true;
			first_enter = false;
		} else if (trigger_number == 5){
			cave_5 = true;
			first_enter = false;
		} else if (trigger_number == 6){
			cave_6 = true;
			first_enter = false;
		} 
		cave_seen_x = Player.x;
		cave_seen_y = Player.y;
	}
	if (cave_1){
		if(Player.x != cave_seen_x || Player.y !=  cave_seen_y){
			instance_destroy(triggers_cc_1);
		}
	}
	if (cave_2){
		if(Player.x != cave_seen_x || Player.y !=  cave_seen_y){
			instance_destroy(triggers_cc_2);
		}
	}
	if (cave_3){
		if(Player.x != cave_seen_x || Player.y !=  cave_seen_y){
			instance_destroy(triggers_cc_3);
		}
	}
	if (cave_4){
		if(Player.x != cave_seen_x || Player.y !=  cave_seen_y){
			instance_destroy(triggers_cc_4);
			instance_destroy(cover_cave_5);
		}
	}
	if (cave_5){
		if(Player.x != cave_seen_x || Player.y !=  cave_seen_y){
			instance_destroy(triggers_cc_5);
			instance_destroy(cover_cave_6);
		}
	}
	if (cave_6){
		if(Player.x != cave_seen_x || Player.y !=  cave_seen_y){
			instance_destroy(triggers_cc_6);
		}
	}
	
}

if (room == Syrinlya){
	if (first_enter){
		Syrinlya_seen_x = Player.x;
		Syrinlya_seen_y = Player.y;
		Syrinlya_enter = true;
		first_enter = false;
	}
	if(Player.x != Syrinlya_seen_x || Player.y !=  Syrinlya_seen_y){
		Syrinlya_enter = false;
	}
	if (Player.x == x && Player.y == y) {
		trigger_number = 0;
		on_tent = true;
	}
	if ((Player.x != x || Player.y != y) && trigger_number == 0){
		instance_destroy(triggers_syrinlya_1);
	}
}

if (room == SalsVault){
	if (Player.x >= x && Player.x <= x+70*(image_xscale-1) && Player.y >= y && Player.y <= y+70*(image_yscale-1) && first_enter){
		if (trigger_number == 1){
			vault_1 = true;
			first_enter = false;
		} else if (trigger_number == 2){
			vault_2 = true;
			first_enter = false;
		} else if (trigger_number == 3){
			vault_3 = true;
			first_enter = false;
		} else if (trigger_number == 4){
			vault_4 = true;
			first_enter = false;
		} else if (trigger_number == 5){
			vault_5 = true;
			first_enter = false;
		} else if (trigger_number == 6){
			vault_6 = true;
			first_enter = false;
		} else if (trigger_number == 7){
			vault_7 = true;
			first_enter = false;
		} else if (trigger_number == 8){
			vault_8 = true;
			first_enter = false;
		} else if (trigger_number == 9){
			vault_9 = true;
			first_enter = false;
		} else if (trigger_number == 10){
			vault_10 = true;
			first_enter = false;
		} else if (trigger_number == 11){
			vault_11 = true;
			first_enter = false;
		} else if (trigger_number == 12){
			vault_12 = true;
			first_enter = false;
		} else if (trigger_number == 13){
			vault_13 = true;
			first_enter = false;
		} else if (trigger_number == 14){
			vault_14 = true;
			first_enter = false;
		} else if (trigger_number == 15){
			vault_15 = true;
			first_enter = false;
		} else if (trigger_number == 16){
			vault_16 = true;
			first_enter = false;
		} else if (trigger_number == 17){
			vault_17 = true;
			first_enter = false;
		} else if (trigger_number == 18){
			vault_18 = true;
			first_enter = false;
		} else if (trigger_number == 0){
			vault_entrance = true;
			first_enter = false;
		} else if (trigger_number == 101){
			openvault_1 = true;
			vault_knock = true;
		} else if (trigger_number == 103){
			openvault_3 = true;
			vault_knock = true;
		} else if (trigger_number == 104){
			openvault_4 = true;
			vault_knock = true;
		} else if (trigger_number == 105){
			openvault_5 = true;
			vault_knock = true;
		} else if (trigger_number == 106){
			openvault_6 = true;
			vault_knock = true;
		} else if (trigger_number == 107){
			openvault_7 = true;
			vault_knock = true;
		} else if (trigger_number == 108){
			openvault_8 = true;
			vault_knock = true;
		} else if (trigger_number == 109){
			openvault_9 = true;
			vault_knock = true;
		} else if (trigger_number == 110){
			openvault_10 = true;
			vault_knock = true;
		} else if (trigger_number == 111){
			openvault_11 = true;
			vault_knock = true;
		} else if (trigger_number == 112){
			openvault_12 = true;
			vault_knock = true;
		} else if (trigger_number == 113){
			openvault_13 = true;
			vault_knock = true;
		} else if (trigger_number == 114){
			openvault_14 = true;
			vault_knock = true;
		} else if (trigger_number == 115){
			openvault_15 = true;
			vault_knock = true;
		} else if (trigger_number == 116){
			openvault_16 = true;
			vault_knock = true;
		} else if (trigger_number == 117){
			openvault_17 = true;
			vault_knock = true;
		} else if (trigger_number == 118){
			openvault_18 = true;
			vault_knock = true;
		}
		vault_seen_x = Player.x;
		vault_seen_y = Player.y;
	}
	if (vault_knock){
		if(Player.x != vault_seen_x || Player.y != vault_seen_y){
			if (trigger_number == 101){
				openvault_1 = false;
			} else if (trigger_number == 103){
				openvault_3 = false;
			} else if (trigger_number == 104){
				openvault_4 = false;
			} else if (trigger_number == 105){
				openvault_5 = false;
			} else if (trigger_number == 106){
				openvault_6 = false;
			} else if (trigger_number == 107){
				openvault_7 = false;
			} else if (trigger_number == 108){
				openvault_8 = false;
			} else if (trigger_number == 109){
				openvault_9 = false;
			} else if (trigger_number == 110){
				openvault_10 = false;
			} else if (trigger_number == 111){
				openvault_11 = false;
			} else if (trigger_number == 112){
				openvault_12 = false;
			} else if (trigger_number == 113){
				openvault_13 = false;
			} else if (trigger_number == 114){
				openvault_14 = false;
			} else if (trigger_number == 115){
				openvault_15 = false;
			} else if (trigger_number == 116){
				openvault_16 = false;
			} else if (trigger_number == 117){
				openvault_17 = false;
			} else if (trigger_number == 118){
				openvault_18 = false;
			}
			vault_knock = false;
		}
	}
			
	if (vault_entrance){
		if(Player.x != vault_seen_x || Player.y != vault_seen_y){
			instance_destroy(triggers_sv_0);
		}
	}
	if (vault_1){
		if(Player.x != vault_seen_x || Player.y != vault_seen_y){
			instance_destroy(triggers_sv_1);
		}
	}
	if (vault_2){
		if(Player.x != vault_seen_x || Player.y != vault_seen_y){
			instance_destroy(triggers_sv_2);
		}
	}
	if (vault_3){
		if(Player.x != vault_seen_x || Player.y != vault_seen_y){
			instance_destroy(triggers_sv_3);
		}
	}
	if (vault_4){
		if(Player.x != vault_seen_x || Player.y != vault_seen_y){
			instance_destroy(triggers_sv_4);
		}
	}
	if (vault_5){
		if(Player.x != vault_seen_x || Player.y != vault_seen_y){
			instance_destroy(triggers_sv_5);
		}
	}
	if (vault_6){
		if(Player.x != vault_seen_x || Player.y != vault_seen_y){
			instance_destroy(triggers_sv_6_1);
			instance_destroy(triggers_sv_6_2);
		}
	}
	if (vault_7){
		if(Player.x != vault_seen_x || Player.y != vault_seen_y){
			instance_destroy(triggers_sv_7);
		}
	}
	if (vault_8){
		if(Player.x != vault_seen_x || Player.y != vault_seen_y){
			instance_destroy(triggers_sv_8);
		}
	}
	if (vault_9){
		if(Player.x != vault_seen_x || Player.y != vault_seen_y){
			instance_destroy(triggers_sv_9);
		}
	}
	if (vault_10){
		if(Player.x != vault_seen_x || Player.y != vault_seen_y){
			instance_destroy(triggers_sv_10);
		}
	}
	if (vault_11){
		if(Player.x != vault_seen_x || Player.y != vault_seen_y){
			instance_destroy(triggers_sv_11);
		}
	}
	if (vault_12){
		if(Player.x != vault_seen_x || Player.y != vault_seen_y){
			instance_destroy(triggers_sv_12);
		}
	}
	if (vault_13){
		if(Player.x != vault_seen_x || Player.y != vault_seen_y){
			instance_destroy(triggers_sv_13);
		}
	}
	if (vault_14){
		if(Player.x != vault_seen_x || Player.y != vault_seen_y){
			instance_destroy(triggers_sv_14);
		}
	}if (vault_15){
		if(Player.x != vault_seen_x || Player.y != vault_seen_y){
			instance_destroy(triggers_sv_15);
		}
	}
	if (vault_16){
		if(Player.x != vault_seen_x || Player.y != vault_seen_y){
			instance_destroy(triggers_sv_16);
		}
	}
	if (vault_17){
		if(Player.x != vault_seen_x || Player.y != vault_seen_y){
			instance_destroy(triggers_sv_17);
		}
	}
	if (vault_18){
		if(Player.x != vault_seen_x || Player.y != vault_seen_y){
			instance_destroy(triggers_sv_18);
		}
	}
}