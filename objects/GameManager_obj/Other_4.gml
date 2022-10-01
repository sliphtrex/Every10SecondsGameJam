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