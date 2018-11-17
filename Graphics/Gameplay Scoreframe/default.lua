local t = Def.ActorFrame {};

if not GAMESTATE:IsDemonstration() then
	t[#t+1] =  Def.ActorFrame{
		LoadActor("../Score Frame")..{
			InitCommand=cmd(x,SCREEN_LEFT+113);
			Condition=GAMESTATE:IsPlayerEnabled(PLAYER_1)
		};
		LoadActor("../Score Frame")..{
			InitCommand=cmd(x,SCREEN_RIGHT-113;zoomx,-1);
			Condition=GAMESTATE:IsPlayerEnabled(PLAYER_2)
		};
		LoadActor("diffind");
	};
end

return t;