switch(room)
{
	case Main_Menu:
		global.nextRoom = Bedroom;
		break;
	case Bedroom:
		//the list of x,y coordinates that are valid start tiles
		startPos = [[48,112],[80,112]];
		//grab the starting x,y of the player for when we hit play later
		startxy=[mc.x,mc.y];
		//set where to next;
		global.nextRoom = Kitchen;
		//when all checkpoints are fullfilled this is set to true;
		global.objective = false;
		break;
	case Kitchen:
		//the list of x,y coordinates that are valid start tiles
		startPos = [[80,176]];
		//grab the starting x,y of the player for when we hit play later
		startxy=[mc.x,mc.y];
		//set where to next;
		global.nextRoom = Livingroom;
		//when all checkpoints are fullfilled this is set to true;
		global.objective = false;
		break;
	case Livingroom:
		//the list of x,y coordinates that are valid start tiles
		startPos = [[208,80]];
		//grab the starting x,y of the player for when we hit play later
		startxy=[mc.x,mc.y];
		//set where to next;
		global.nextRoom = Livingroom;
		//when all checkpoints are fullfilled this is set to true;
		global.objective = true;
		break;
}
global.isPlaying = false;
if(!audio_is_playing(PuzzleSolvingMusic_msc))
{audio_play_sound(PuzzleSolvingMusic_msc,.5,true);}
if(audio_is_playing(TimeForWork2_msc))
{audio_stop_sound(TimeForWork2_msc);}
