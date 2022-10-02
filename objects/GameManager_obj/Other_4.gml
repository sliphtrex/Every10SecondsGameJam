switch(room)
{
	case Main_Menu:
		global.nextRoom = Room1;
		break;
	case Room1:
		//the list of x,y coordinates that are valid start tiles
		startPos = [[48,144],[80,144],[80,176]];
		//grab the starting x,y of the player for when we hit play later
		startxy=[mc.x,mc.y];
		//set where to next;
		nextRoom = Room;
		break;
	case Room:
		//the list of x,y coordinates that are valid start tiles
		startPos = [[48,80],[80,112],[48,144]];
		//grab the starting x,y of the player for when we hit play later
		startxy=[mc.x,mc.y];
		//set where to next;
		nextRoom = Room;
		break;
		
		case Living_room:
		//the list of x,y coordinates that are valid start tiles
		startPos = [[208,80]];
		//grab the starting x,y of the player for when we hit play later
		startxy=[mc.x,mc.y];
		//set where to next;
		nextRoom = Room;
		break;
		
		case Kitchen:
		//the list of x,y coordinates that are valid start tiles
		startPos = [[80,176]];
		//grab the starting x,y of the player for when we hit play later
		startxy=[mc.x,mc.y];
		//set where to next;
		nextRoom = Room;
		break;
}
global.isPlaying = false;
if(!audio_is_playing(PuzzleSolvingMusic_msc))
{audio_play_sound(PuzzleSolvingMusic_msc,.5,true);}
if(audio_is_playing(TimeForWork2_msc))
{audio_stop_sound(TimeForWork2_msc);}
