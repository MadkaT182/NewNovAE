local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(Center);
	LoadActor("SelectMode picture5")..{
		OnCommand=cmd(x,-44;y,-90);
		OffCommand=cmd(sleep,0.4;bouncebegin,0.3;zoomy,0);
		GainFocusCommand=cmd(stoptweening;diffusealpha,0;linear,.2;diffusealpha,1);
		LoseFocusCommand=cmd(stoptweening;diffusealpha,0);
	};
	LoadActor("SelectMode icon5")..{
		OnCommand=cmd(x,SCREEN_RIGHT-88-SCREEN_WIDTH/2;y,130);
		OffCommand=cmd(linear,.5;diffusealpha,0);
		GainFocusCommand=cmd(diffusealpha,1);
		LoseFocusCommand=cmd(diffusealpha,0);
	};
	LoadActor("SelectMode info5")..{
		OnCommand=cmd(x,-126;y,130);
		OffCommand=cmd(sleep,0.9;accelerate,0.4;addx,-SCREEN_WIDTH/2);
		GainFocusCommand=cmd(diffusealpha,1);
		LoseFocusCommand=cmd(diffusealpha,0);
	};
	LoadActor("SelectMode hint2")..{
		OnCommand=cmd(x,-240;y,173);
		OffCommand=cmd(sleep,0.9;accelerate,0.4;addx,-SCREEN_WIDTH/2);
		GainFocusCommand=cmd(diffusealpha,1);
		LoseFocusCommand=cmd(diffusealpha,0);
	};
};

return t;