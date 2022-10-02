if(global.isPlaying&&!wasPlaying && isEnabled)
{
    wasPlaying=true;
    path_start(myPath,32/60,pathAction,true);
}
if(global.isPlaying)
{
    path_speed=32/60;
}
else
{
    if(wasPlaying){path_speed=0;}
}