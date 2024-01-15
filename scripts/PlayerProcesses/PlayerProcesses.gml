function StateFree(){
	//Adquirir valores Horizontal x Vertical
	hmovement = right - left;
	vmovement =	down - up;
	
	if hmovement != 0 hfacing = hmovement;
	
	if keyboard_check(vk_shift){
		wlkSpeed = 2.5;
		sprite_set_speed(walkSide, 12, spritespeed_framespersecond);
		sprite_set_speed(walkDown, 12, spritespeed_framespersecond);
		sprite_set_speed(walkUp, 12, spritespeed_framespersecond);
	} else{
		wlkSpeed = 1.5;
		sprite_set_speed(walkSide, 10, spritespeed_framespersecond);
		sprite_set_speed(walkDown, 10, spritespeed_framespersecond);
		sprite_set_speed(walkUp, 10, spritespeed_framespersecond);
	}
	//Mover personagem para direção dos valores 
		if hmovement != 0 or vmovement != 0{
			dir = point_direction(0, 0, hmovement, vmovement); 
		
			hmovement = lengthdir_x(wlkSpeed, dir);
			vmovement = lengthdir_y(wlkSpeed, dir);
		
			x += hmovement;
			y += vmovement;
		}

//Função de colisões (possível alteração)
function Collision(){
		var targetX = x;
		var targetY = y;
		
		x = xprevious;
		y = yprevious;
		
		var distanceX = abs(targetX - x);
		var distanceY = abs(targetY - y);
		
		repeat(distanceX){
			if !place_meeting(x + sign(targetX - x), y, all) x += sign(targetX - x);
		}
		
		repeat(distanceY){
			if !place_meeting(x, y + sign(targetY - y), all) y += sign(targetY - y);
	}
}
		//animção de movimentação
		if hmovement != 0 or vmovement != 0{
			if keyboard_check(ord("D")) or keyboard_check(ord("A")){
				sprite_index = walkSide;
			}
			
			else if keyboard_check(ord("W")){
				sprite_index = walkUp;
			}
			
			else if keyboard_check(ord("S")){
				sprite_index = walkDown;
			}
				
		}
		
		//animação de idle
		else{
			if dir = 270{
				sprite_index = idleDown;
			}
			
			else if dir = 45 or dir = 0 or dir = 135 or dir = 315 or dir = 180 or dir = 225{
				sprite_index = idleSide;
			}
			
			else if dir = 90{
				sprite_index = idleUp;
			}
		}
		
		if keyboard_check_pressed(vk_space) && dodgeEnergy >= 25 && (hmovement != 0 or vmovement != 0){
			dodgeEnergy -= 25;
			alarm[1] = 180;
			
			alarm[0] = 32;
			dodgeDir = point_direction(0, 0, hmovement, vmovement);
			state = StateDodge;
		}
		
		else if mouse_check_button_pressed(mb_left){
			alarm[2] = 20;
			attackDir = point_direction(x, y, mouse_x, mouse_y);
			state = StateCombat;
		}
}
	
function StateDodge(){
	hmovement = lengthdir_x(dodgeSpeed, dodgeDir);
	vmovement = lengthdir_y(dodgeSpeed, dodgeDir);
	
	if dir = 270{
		sprite_index = dodgeDown;
	}
			
	else if dir = 45 or dir = 0 or dir = 135 or dir = 315 or dir = 180 or dir = 225{
		sprite_index = dodgeSide;
	}
			
	else if dir = 90{
		sprite_index = dodgeUp;
	}
	
	x += hmovement;
	y += vmovement;
}
	
function StateCombat(){
	hmovement = lengthdir_x(0.7, attackDir);
	vmovement = lengthdir_y(0.7, attackDir);
	
	if attackDir >= 250 && attackDir <= 290{
		hfacing = 1;
		dir = 270;
		sprite_index = sprAttackDown;
	}
			
	else if attackDir >= 0 && attackDir <= 20 or attackDir >= 340 && attackDir <= 360{
		hfacing = 1;
		dir = 0;
		sprite_index = sprAttackSide;
	}
	
	else if attackDir >= 160 && attackDir <= 200{
		hfacing = -1;
		dir = 0;
		sprite_index = sprAttackSide;
	}
			
	else if attackDir >= 80 && attackDir <= 110{
		hfacing = 1;
		dir = 90;
		sprite_index = sprAttackUp;
	}
	
	else if attackDir > 20 && attackDir < 80{
		hfacing = 1;
		dir = 0;
		sprite_index = sprAttackDiagUp;
	}
	
	else if attackDir > 110 && attackDir < 160{
		hfacing = -1;
		dir = 0;
		sprite_index = sprAttackDiagUp;
	}
	
	else if attackDir > 290 && attackDir < 340{
		hfacing = 1;
		dir = 0;
		sprite_index = sprAttackDiagDown;
	}
	
	else if attackDir > 200 && attackDir < 250{
		hfacing = -1;
		dir = 0;
		sprite_index = sprAttackDiagDown;
	}
	
	x += hmovement;
	y += vmovement;
}