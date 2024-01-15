CameraFollow();

up = keyboard_check(ord("W"));
down = keyboard_check(ord("S"));
left = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));

script_execute(state);

depth = -bbox_bottom;

if alarm[1] <= 0{
	dodgeEnergy  += 1;
}

dodgeEnergy = clamp(dodgeEnergy, 0, 100);