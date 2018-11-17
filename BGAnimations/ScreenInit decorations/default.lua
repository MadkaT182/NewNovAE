return Def.ActorFrame {
	LoadActor("bgm")..{
		OnCommand=cmd(play);
		OffCommand=cmd(stop);
	};
	Def.Quad{
		InitCommand=cmd(FullScreen;diffuse,color("#FFFFFF"));
	};
	LoadActor("is06")..{
		InitCommand=cmd(Center;sleep,2.37;decelerate,0.3;diffusealpha,0);
	};
}