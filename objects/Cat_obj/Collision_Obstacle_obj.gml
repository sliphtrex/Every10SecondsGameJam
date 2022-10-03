if(other.myChild==Dog_obj){audio_play_sound(DogBark_sfx,1,false);}

//decrease lives by one
global.lives--;
//if lives = 0, game over
if(global.lives<=0)
{
	audio_stop_all();
	audio_play_sound(CatGameOver_sfx,1,false);
	room = Main_Menu;
}
//else restart the level
else
{
	audio_play_sound(CatGetsHit_sfx,1,false);
	room_restart();
}