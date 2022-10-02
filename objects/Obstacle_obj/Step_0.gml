if(global.isPlaying&&!wasPlaying && isEnabled)
{
    wasPlaying=true;
    path_start(myPath,.625,pathAction,true);
}
if(global.isPlaying)
{
    path_speed=.625;
}
else
{
    show_debug_message(string(wasPlaying)+","+string(path_speed));
    if(wasPlaying){path_speed=0;}
}