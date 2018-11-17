local children = {
	LoadFont("", "ScreenTitleMenu choices") ..{
		Text=THEME:GetString( 'ScreenTitleMenu', Var("GameCommand"):GetText() );
		InitCommand=cmd(shadowlength,2;zoom,.8;y,1);
		GainFocusCommand=cmd(zoom,1;diffuse,color("#FFFFFF"));
		LoseFocusCommand=cmd(zoom,.8;diffuse,color("#AAAAAA"));
		DisabledCommand=cmd(diffuse,0.5,0.5,0.5,1);
	};
};

return Def.ActorFrame { children = children };