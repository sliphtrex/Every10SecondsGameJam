var fonth1 = font_get_size(game_font);

draw_set_halign(fa_middle);
draw_set_valign(fa_top);
draw_set_font(credits_font);
draw_set_color(c_yellow);
draw_text_ext(160,0,"Credits",1,320);

draw_set_halign(fa_right);
draw_set_font(game_font);
draw_set_color(c_aqua);
draw_text_ext(156,48,"Gameplay\nProgramming:",fonth1,156);
draw_text_ext(156,48+(fonth1*3),"Level\nProgramming:",fonth1,156);
draw_text_ext(156,48+(fonth1*6),"Level Design:",fonth1,156);
draw_text_ext(156,48+(fonth1*9),"Art:",fonth1,156);
draw_text_ext(156,48+(fonth1*13),"Music:",fonth1,156);

draw_set_halign(fa_left);
draw_set_color(c_white);
draw_text(164,48,"Dakota Wright");
draw_text(164,48+fonth1,"Edrick Hong");
draw_text(164,48+(fonth1*3),"Edrick Hong");
draw_text(164,48+(fonth1*6),"Allyson Chan");
draw_text(164,48+(fonth1*7),"Ivan Jing");
draw_text(164,48+(fonth1*9),"Allyson Chan");
draw_text(164,48+(fonth1*10),"Dakota Wright");
draw_text(164,48+(fonth1*11),"Ivan Jing");
draw_text(164,48+(fonth1*13),"Dakota Wright");

draw_set_halign(fa_middle);
draw_set_valign(fa_top);
draw_set_color(c_yellow);
draw_text_ext(160,48+(fonth1*15),"Sound effects obtained from\nhttps://www.zapsplat.com",fonth1,320);