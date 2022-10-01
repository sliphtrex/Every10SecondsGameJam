//create a variable to store ourselves and pass to GameManager_obj
var inst = instance_find(GameManager_obj,0); 

var me = 0;
for(var i=0;i<instance_number(MoveableSpace_obj);i++)
{
	var curme = instance_find(MoveableSpace_obj,i);
	if(curme.x==x&&curme.y==y){me = curme;}
}
inst.AddSpace(me);
alarm_set(0,2);