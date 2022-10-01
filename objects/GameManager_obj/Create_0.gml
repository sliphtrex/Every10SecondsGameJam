//holds our selected tiles to test later.
spaces = [];
//2D array of [xpos,ypos] holds valid starting positions
global.startpos = [];

mc = instance_find(MainCharacter_obj,0);
goal = instance_find(Goal_obj,0);
obstacles = [];

//will need to set to 32 later
levelScale = 64;

isMoving = false;
curFrame = 0;
totalSteps = 0;
curStep = 0;

function AddSpace(obj)
{
	//if it's already been selected
	if(obj.selected)
	{
		for(var i=0;i<array_length(spaces);i++)
		{
			if(spaces[i].x==obj.x&&spaces[i].y==obj.y)
			{
				if(i<array_length(spaces)-1)
				{
					for(var j=array_length(spaces)-1;j>i;j--)
					{
						spaces[j].image_index = 0;
						spaces[j].selected = false;
						array_delete(spaces,j,1);
					}
				}
				spaces[i].image_index = 0;
				spaces[i].selected = false;
				array_delete(spaces,i,1);
			}
		}
	}
	
	//if it hasn't been selected
	else
	{
		//if it's not the first in the chain make sure it extends from the last place
		if(array_length(spaces)>0)
		{
			var lastSpot = spaces[array_length(spaces)-1];
			if((obj.x==lastSpot.x+levelScale&&obj.y==lastSpot.y)||
			(obj.x==lastSpot.x-levelScale&&obj.y==lastSpot.y)||
			(obj.x==lastSpot.x&&obj.y==lastSpot.y+levelScale)||
			(obj.x==lastSpot.x&&obj.y==lastSpot.y-levelScale))
			{
				array_push(spaces,obj);
				spaces[array_length(spaces)-1].image_index = 1;
				spaces[array_length(spaces)-1].selected = true;
			}
		}
		//if this is the first in the chain make sure it's a starting spot
		else
		{
			var onStart = false;
			for(var i=0;i<array_length(global.startpos);i++)
			{
				if(global.startpos[i][0] == obj.x&&global.startpos[i][1] == obj.y)
				{onStart=true;}
			}
			
			if(onStart)
			{
				array_push(spaces,obj);
				spaces[array_length(spaces)-1].image_index = 1;
				spaces[array_length(spaces)-1].selected = true;
			}
			else
			{
				show_debug_message("not a starting space!");
			}
		}
	}
}

function Play()
{
	for(var i=0; i<instance_number(MoveableSpace_obj);i++)
	{
		instance_find(MoveableSpace_obj,i).image_alpha=0;
	}
	array_insert(spaces,0,mc);
	totalSteps = array_length(spaces)-1;
	isMoving = true;
}