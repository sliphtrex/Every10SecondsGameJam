//if we hit the play button...
if(global.isPlaying)
{
	//then we run until we're out of steps to take
	if(curStep<array_length(tilePath))
	{
		//on the first step...
		if(curStep==0)
		{
			// move the player from it's starting point to the first tile
			// we chose
			curFrame++;
			mc.x = lerp(startxy[0],tilePath[curStep].x,curFrame/60);
			mc.y = lerp(startxy[1],tilePath[curStep].y,curFrame/60);
			if(curFrame==60)
			{
				curFrame=0;
				curStep++;
			}
		}
		//otherwise just move from the previous tile to the next tile.
		else
		{
			curFrame++;
			mc.x = lerp(tilePath[curStep-1].x,tilePath[curStep].x,curFrame/60);
			mc.y = lerp(tilePath[curStep-1].y,tilePath[curStep].y,curFrame/60);
			if(curFrame==60)
			{
				curFrame=0;
				curStep++;
			}
		}
	}
	//if there are no more steps to take wait for more input
	else
	{
		mcTileGone = false;
		curFrame=0;
		curStep=0;
		unPlay();
	}
	//if we reach the goal move to the next level
	if(mc.x==goal.x&&mc.y==goal.y)
	{
		room = global.nextRoom;
		show_debug_message("success!");
	}
}
//if we're not running our path remove the tile the cat is standing on.
else if(!mcTileGone)
{
	for(var i=0;i<instance_number(SelectTiles_obj);i++)
	{
		var curTile = instance_find(SelectTiles_obj,i);
		if(curTile.x==mc.x&&curTile.y==mc.y)
		{
			curTile.image_alpha=0;
			mcTileGone = true;
		}
	}
}