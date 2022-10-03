if(x==mc.x&&y==mc.y)
{
	global.hadCoffee=true;
	instance_destroy();
	audio_play_sound(CatSipCoffee_sfx,1,false);
}