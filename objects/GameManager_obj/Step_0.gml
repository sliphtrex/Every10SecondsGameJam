if(!isMoving)
{
	if(array_length(spaces)>0)
	{
		global.time = 0;
		for(var i=0;i<array_length(spaces);i++)
		{
			global.time += spaces[i].myTime;
		}
		if(global.time>10){show_debug_message("too many moves");}
	}
}
else
{
	if(curStep!=totalSteps)
	{
		curFrame++;
		mc.x = lerp(spaces[curStep].x,spaces[curStep+1].x,curFrame/60);
		mc.y = lerp(spaces[curStep].y,spaces[curStep+1].y,curFrame/60);
		
		if(curFrame==60)
		{
			curFrame=0;
			curStep++;
		}
	}
	else
	{
		if(mc.x==goal.x&&mc.y == goal.y)
		{
			show_debug_message("success!");
			room = nextRoom;
		}
		else{room_restart();}
	}
}
