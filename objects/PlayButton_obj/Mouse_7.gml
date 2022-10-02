if(room==Main_Menu)
{
	room = global.nextRoom
}
else{instance_find(GameManager_obj,0).Play();}