local stages = Def.ActorFrame {
};

for _, s in ipairs(Stage) do
	if PREFSMAN:GetPreference("SongsPerPlay") == GAMESTATE:GetCurrentStageIndex()+1 then
		stages[#stages+1] = LoadActor(THEME:GetPathG("Stages", "short/Stage_final")) .. {
			SetCommand=function(self, params)
				self:visible( GAMESTATE:GetCurrentStage() == "Stage_Final" );
			end;
		}
	elseif s == 'Stage_Extra1' or s == 'Stage_Extra2' or s == 'Stage_Nonstop' or s == 'Stage_Oni' or s == 'Stage_Endless' or s == 'Stage_Demo' then
		stages[#stages+1] = LoadActor(THEME:GetPathG("Stages", "short/"..s)) .. {
			SetCommand=function(self, params)
				self:visible( params.StageToShow == s );
			end;
		}
	else
		stages[#stages+1] = LoadActor(THEME:GetPathG("Stages", "short/"..s)) .. {
			InitCommand=cmd(shadowlength,0);
			SetCommand=function(self, params)
				self:visible( params.StageToShow == s );
			end;
		}
	end
end

return stages;
