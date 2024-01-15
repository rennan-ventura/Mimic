//Variaveis de movimentação e animação
wlkSpeed = 1.5;
hfacing = 1;
dir = 0;

//Variaveis de esquiva
dodgeDir = -1;
dodgeSpeed = 3;

maxDodgeEnergy = 100;
dodgeEnergy = maxDodgeEnergy;

//Variaveis de combate
attackDir = 0;
lastSprite = sprite_index;
currentCombo = 0;
comboCount = 2;


//Variaveis de vida 
global.maxLife = 4;
global.currentLife = global.maxLife;
global.nextLife = global.currentLife;

//Variaveis Rage (habilidades)
global.maxRage = 100;
global.currentRage = global.maxRage;
global.nextRage = global.currentRage;

state = StateFree;

function CameraFollow(){
	
	//Pegando valores de largura e altura da câmera
	var cam_w = camera_get_view_width(view_camera[0]);
	var cam_h = camera_get_view_height(view_camera[0]);

	//Pegando valores do mouse e fazendo calculo de limite onde a câmera pode atuar
	var cam_x = clamp(lerp(x, mouse_x, 0.3) - cam_w/2, 0, room_width - cam_w);
	var cam_y = clamp(lerp(y, mouse_y, 0.3) - cam_h/2, 0, room_height - cam_h);

	//Alocando posição da camera
	camera_set_view_pos(view_camera[0], cam_x, cam_y);
}
