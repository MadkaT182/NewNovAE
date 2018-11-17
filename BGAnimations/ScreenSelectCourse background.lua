return Def.ActorFrame{
	LoadActor("_bg_black")..{
		Condition=GAMESTATE:GetPlayMode() == "PlayMode_Nonstop";
		OnCommand=cmd(zoomtowidth,SCREEN_WIDTH+5;Center);
	};
	LoadActor("_bg_red")..{
		Condition=GAMESTATE:GetPlayMode() == "PlayMode_Oni";
		OnCommand=cmd(zoomtowidth,SCREEN_WIDTH+5;Center);
	};
	Def.ActorFrame{
		OnCommand=cmd(fov,90);
		LoadActor("sphere_back")..{
			OnCommand=cmd(x,SCREEN_CENTER_X+(300-320);y,SCREEN_CENTER_Y+(540-240);rotationx,-20;rotationz,90;zoom,12;spin;effectmagnitude,3,2,0);
		};
		LoadActor("ring1_back")..{
			OnCommand=cmd(x,SCREEN_CENTER_X+(300-320);y,SCREEN_CENTER_Y+(540-240);rotationx,-20;rotationz,90;zoom,12;spin;effectmagnitude,30,22,45);
		};
		LoadActor("ring1_back")..{
			OnCommand=cmd(x,SCREEN_CENTER_X+(300-320);y,SCREEN_CENTER_Y+(540-240);rotationx,-20;zoom,12;spin;effectmagnitude,-30,22,-45);
		};
	};
}