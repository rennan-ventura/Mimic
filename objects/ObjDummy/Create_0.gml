color = c_white;
alpha = 0;

depth = -y;

function StatePatrol(){
	ObjDummy.image_index = 0;
	
	if(place_meeting(x, y, ObjPlayer)){
		alarm[0] = 30;
		alpha = 1;
		state = StateTookDamage;
	}
}

function StateTookDamage(){
	
}

state = StatePatrol;
