return Def.ActorFrame{
	LoadActor("1")..{
		OnCommand=cmd(FullScreen);
	};
	LoadActor("sphere")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+(238-240));
	};
	LoadActor("effect1")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoom,0.96;glowshift;spin;effectmagnitude,0,0,-65);
	};
	LoadActor("effect2")..{
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;rotationz,0.5;zoom,0.96;glowshift;spin;effectmagnitude,0,0,55);
	};
	LoadActor("logo")..{
		OnCommand=cmd(x,SCREEN_CENTER_X+(311-320);y,SCREEN_CENTER_Y+(226-240));
	};
	LoadFont("Common normal")..{
		OnCommand=cmd(x,SCREEN_LEFT+15;y,SCREEN_TOP+20;shadowlength,2;horizalign,left;settext,GetSerial());
		Condition=GAMESTATE:GetCoinMode()~="CoinMode_Home"
	};
}