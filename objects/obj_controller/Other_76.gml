/// @description Deal with Sequences
//switch (event_data[? "message"]){
//	case "seqStart":{
//		sequenceState = seqState.playing;
//		if(layer_get_element_type(event_data[? "element_id"]) == layerelementtype_sequence){
//			curSeq = event_data[? "element_id"];
//			show_debug_message("obj_control has heard that seq " + string(curSeq)+" is playing");
//		}	
//		break;
//	}
//	case "seqEnd" :{
//		sequenceState = seqState.finished;
//		show_debug_message("obj_control has heard that seq " + string(curSeq)+" has ended");
//		break;
//			}
//}