
if(!hit)
{
	global.Lives-=1;hit=true;
	if(!audio_is_playing(CatGetsHit_sfx)){audio_play_sound(CatGetsHit_sfx,1,false);}
	if(other.myChild==Dog_obj)
	{
		if(!audio_is_playing(DogBark_sfx)){audio_play_sound(DogBark_sfx,1,false);}
	}
}
show_debug_message("You failed the game!!!");