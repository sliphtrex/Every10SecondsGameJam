//decrease lives by one
global.lives--;
//if lives = 0, game over
if(global.lives<=0){room = Main_Menu;}
//else restart the level
else{room_restart();}