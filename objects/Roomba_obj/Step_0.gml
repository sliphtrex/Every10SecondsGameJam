if(global.isPlaying&&!wasPlaying)
{
	wasPlaying=true;
	path_start(RoombaL2_path,.625,path_action_continue,false);
}
else if(global.isPlaying)
{
	if(path_position==(.25||.5||.75||1))
	{
		path_speed=0;
		if(isTurning==false){isTurning=true;}
		image_angle+=1;
		curAngle++;
	}
	else if(curAngle<90)
	{
		image_angle+=1;
		curAngle++;
	}
	else
	{
		path_speed = .625;
		curAngle = 0;
		image_angle = direction;
	}
	show_debug_message(string(path_position));
}