local t = Def.ActorFrame {};
local aspect = "N";

if IsUsingWideScreen() then
	aspect = "W"
end

for pn in ivalues(GAMESTATE:GetEnabledPlayers()) do
	t[#t+1] = Def.ActorFrame {
		LoadActor("stream_"..aspect)..{
			InitCommand=function(self)
				if aspect == "W" then
					self:x(pn == PLAYER_1 and SCREEN_CENTER_X-230 or SCREEN_CENTER_X+230);
				else
					self:x(pn == PLAYER_1 and SCREEN_CENTER_X-173 or SCREEN_CENTER_X+173);
				end
				self:zoomx(pn == PLAYER_1 and 1 or -1);
				self:y(35);
			end;
		};
	};
end

return t;