local mStages = STATSMAN:GetStagesPlayed();
local t = Def.ActorFrame{};

--Banner List
for i = 1, mStages do
	local ssStats = STATSMAN:GetPlayedStageStats(i);
	t[#t+1] = Def.ActorFrame{
		Def.Banner{
			OnCommand=function(self)
				local sssong = ssStats:GetPlayedSongs()[1];
				if sssong:HasBackground() then
					self:LoadFromSongBackground(sssong);
					self:zoomto(256,80);
				else
					self:Load(THEME:GetPathG("","Common fallback banner"));
					self:zoomto(256,80);
				end;
				self:x(i*20);
				self:y(i*8);
			end
		};
	};
end

return t;