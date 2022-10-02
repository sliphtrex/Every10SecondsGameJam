if(!global.isPlaying)
{
	var me = 0;
	for(var i=0;i<instance_number(SelectTiles_obj);i++)
	{
		var curme = instance_find(SelectTiles_obj,i);
		if(curme.x==x && curme.y==y){me = curme;}
	}
	instance_find(GameManager_obj,0).AddTile(me);
}