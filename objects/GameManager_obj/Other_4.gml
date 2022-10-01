switch(room)
{
case Bedroom_room:
	global.startpos = [[160,352],[160,288],[96,224]];
	nextRoom = Kitchen_room;
	break;
default:
	show_debug_message("no level found!");
	break;
}

obstacles = [];
for(var i=0;i<instance_number(Obstacle_obj);i++)
{
	array_push(obstacles,instance_find(Obstacle_obj,i));
}

if(audio_is_playing(TimeForWork2_msc)){audio_stop_sound(TimeForWork2_msc);}
if(!audio_is_playing(PuzzleSolvingMusic_msc)){audio_play_sound(PuzzleSolvingMusic_msc,.5,true);}