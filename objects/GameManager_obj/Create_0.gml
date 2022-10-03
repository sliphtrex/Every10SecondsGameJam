//The chain of tiles that we've clicked on from start to finish
tilePath = [];
//a list of valid start points
startPos = [];
//the x,y position of our character at the start of the level
startxy = [];
//has the mc's tile been removed
mcTileGone = false;
//a reference to our main character and the goals
mc = instance_find(Cat_obj,0);
goal = instance_find(Goal_obj,0);
//if we have an objective, find it
if(instance_number(Objective_obj)>0){objToFind = instance_find(Objective_obj,0);}
//where are we going if we complete this level
global.nextRoom = 0;


//how much time do we have racked up
global.time = 0;
//did we click on a coffee tile
hasCoffee=false;
//has mc reached the coffee
global.hadCoffee=false;
//if mc reached the coffee start the clock
hadCoffeeCount=0;
//a list of all coffee_obj in the level
global.CoffeeSpots = [];
//how many spaces get effected by the coffee?
coffeeLeft = 0;


//did we hit play?
global.isPlaying = false;
//when we play, what point are we at in the route?
curStep=0;
//how far are we into the current step?
curFrame = 0;



// handles adding to tilePath upon a call
// from left mouse press in SelectTiles_obj
function AddTile(obj)
{
	//if it's already been added remove it and any
	//links that come after it in the chain
	if(obj.selected)
	{
		for(var i=0;i<array_length(tilePath);i++)
		{
			if(obj.x==tilePath[i].x&&obj.y==tilePath[i].y)
			{
				if(i<array_length(tilePath)-1)
				{
					for(var j=array_length(tilePath)-1;j>i;j--)
					{
						//deselect
						tilePath[j].selected = false;
						tilePath[j].image_index=0;
						//remove time
						global.time -= (tilePath[j].myCoffee) ? tilePath[j].myTime/2 : tilePath[j].myTime;
						//if mycoffee add time back
						if(tilePath[j].myCoffee){coffeeLeft++;}
						//remove from array
						array_delete(tilePath,j,1);
					}
				}
				//deselect
				tilePath[i].selected = false;
				tilePath[i].image_index=0;
				//remove time
				global.time -= (tilePath[i].myCoffee) ? tilePath[i].myTime/2 : tilePath[i].myTime;
				//if mycoffee add time back
				if(tilePath[i].myCoffee){coffeeLeft++;}
				//remove from array
				array_delete(tilePath,i,1);
			}
		}
	}
	//if it hasn't been added yet...
	else
	{
		if(global.time<10)
		{
			//if our chain isn't empty, then we need to check if the
			//chosen tile borders the previous tile.
			if(array_length(tilePath)>0)
			{
				var lastSpot = tilePath[array_length(tilePath)-1];
				if((obj.x+32==lastSpot.x&&obj.y==lastSpot.y)||
				(obj.x-32==lastSpot.x&&obj.y==lastSpot.y)||
				(obj.x==lastSpot.x&&obj.y+32==lastSpot.y)||
				(obj.x==lastSpot.x&&obj.y-32==lastSpot.y))
				{
					//if so, add to tilePath
					array_push(tilePath,obj);
					//if we click on a tile with coffee say it's a coffee step
					//and set hasCoffee to true until we don't
					for(var i=0;i<array_length(global.CoffeeSpots);i++)
					{
						if(obj.x==global.CoffeeSpots[i].x&&obj.y==global.CoffeeSpots[i].y)
						{
							coffeeLeft = 6;
							hasCoffee = true;
							array_delete(global.CoffeeSpots,i,1);
						}
					}
					//if we have coffee apply it
					//when it's gone get rid of it
					if(coffeeLeft>0)
					{
						obj.myCoffee=true;
						coffeeLeft--;
					}else{hasCoffee=false;}
					//add myTime to timer
					global.time += (obj.myCoffee) ? obj.myTime/2 : obj.myTime;
					//player feedback
					obj.image_index= (obj.myCoffee) ? 3 : 1;
					obj.selected = true;
				}
				//otherwise we need to tell the player that
				else{show_debug_message("not a part of the chain");}
			}
		
			//if our chain is empty...
			else if(array_length(tilePath)==0)
			{
				//check if it's a valid starting point
				var onStart = false;
				for(var i=0;i<array_length(startPos);i++)
				{
					if(obj.x==startPos[i][0]&&obj.y==startPos[i][1])
					{onStart=true;}
				}
			
				//if it is, only then do we add it
				if(onStart)
				{
					//if so, add to tilePath
					array_push(tilePath,obj);
					//if we click on a tile with coffee say it's a coffee step
					//and set hasCoffee to true until we don't
					for(var i=0;i<array_length(global.CoffeeSpots);i++)
					{
						if(obj.x==global.CoffeeSpots[i].x&&obj.y==global.CoffeeSpots[i].y)
						{
							coffeeLeft = 6;
							hasCoffee = true;
							array_delete(global.CoffeeSpots,i,1);
						}
					}
					//if we have coffee apply it
					//when it's gone get rid of it
					if(coffeeLeft>0)
					{
						obj.myCoffee=true;
						coffeeLeft--;
					}else{hasCoffee=false;}
					//add myTime to timer
					global.time += (obj.myCoffee) ? obj.myTime/2 : obj.myTime;
					//player feedback
					obj.image_index= (obj.myCoffee) ? 3 : 1;
					obj.selected = true;
				}
				//otherwise we need to tell the player that.
				else{show_debug_message("not a starting tile");}
			}
		}
		else{show_debug_message("Too much time taken");}
	}
}

//called when we press the play button. This function sets
//our tiles invisible and starts the main character along it's path.
function Play()
{
	for(var i=0;i<instance_number(SelectTiles_obj);i++)
	{
		instance_find(SelectTiles_obj,i).image_alpha = 0;
	}
	global.isPlaying=true;
	if(audio_is_playing(PuzzleSolvingMusic_msc)){audio_stop_sound(PuzzleSolvingMusic_msc);}
	if(audio_is_paused(TimeForWork2_msc)){audio_resume_sound(TimeForWork2_msc);}
	if(audio_is_paused(Roomba_sfx)){audio_resume_sound(Roomba_sfx);}
	if(!audio_is_playing(TimeForWork2_msc)){audio_play_sound(TimeForWork2_msc,.5,false);}
	
}

//called when we finish running our path. This function sets
//our tiles visible again so we can continue giving input.
function unPlay()
{
	//tell everything we're not playing anymore
	global.isPlaying=false;
	//reset our tile path
	tilePath = [];
	//recalculate the valid start points based on our location
	startPos = [[mc.x+32,mc.y],[mc.x-32,mc.y],[mc.x,mc.y+32],[mc.x,mc.y-32]];
	//reset startxy
	startxy=[mc.x,mc.y];
	//make the tiles visible
	for(var i=0;i<instance_number(SelectTiles_obj);i++)
	{
		instance_find(SelectTiles_obj,i).selected = false;
		instance_find(SelectTiles_obj,i).image_index = 0;
		instance_find(SelectTiles_obj,i).image_alpha = 1;
	}
	//change the music
	if(audio_is_playing(TimeForWork2_msc)){audio_pause_sound(TimeForWork2_msc);}
	if(audio_is_playing(Roomba_sfx)){audio_pause_sound(Roomba_sfx);}
	if(audio_is_playing(Roomba_sfx)){audio_pause_sound(Roomba_sfx);}
	audio_play_sound(PuzzleSolvingMusic_msc,.5,true);
}