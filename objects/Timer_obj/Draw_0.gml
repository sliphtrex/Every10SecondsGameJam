draw_self();
//if in puzzle mode, show time as a currency
draw_set_font(game_font);
draw_set_color(c_white);
draw_set_halign(fa_left);
if(!global.isPlaying){draw_text(72,224,string(10-global.time));}
//otherwise show time in realtime
else{
	curFrames++;
	draw_text(64,224,string(10-(curFrames/60)));
	//if we reach 10 seconds
	if(curFrames==600)
	{
		//decrease lives by one
		global.lives--;
		//if lives = 0, game over
		if(global.lives==0){room = Main_Menu;}
		//else restart the level
		else{room_restart();}
	}
}