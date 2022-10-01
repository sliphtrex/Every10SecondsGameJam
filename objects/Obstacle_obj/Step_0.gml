if(isMoving)
{
	if(!wasMoving)
	{
		path_start(myPaths[curStep],1,path_action_stop,true);
		wasMoving=true;
	}
	curFrame++;
	myPaths[curStep].path_position=curFrame/60;
	if(curFrame==60)
	{
		wasMoving = false;
		curFrame=0;
		curStep++;
		if(curStep==array_length(myPaths)){curStep=0;}
	}
}