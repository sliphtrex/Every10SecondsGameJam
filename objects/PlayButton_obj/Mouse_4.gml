with(GameManager_obj){Play();}
for(var i=0;i<instance_number(Obstacle_obj);i++)
{
	instance_find(Obstacle_obj,i).isMoving = true;
}