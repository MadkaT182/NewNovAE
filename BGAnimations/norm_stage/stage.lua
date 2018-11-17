-- local stages = Def.ActorFrame {
-- };

-- for _, s in ipairs(Stage) do
-- 	if PREFSMAN:GetPreference("SongsPerPlay") == GAMESTATE:GetCurrentStageIndex()+1 then
-- 		stages[#stages+1] = LoadActor(THEME:GetPathG("Stages","long/Stage_Final")) .. {
-- 			SetCommand=function(self, params)
-- 				self:visible( GAMESTATE:GetCurrentStage() == "Stage_Final" );
-- 			end;
-- 		}
-- 	else
-- 		stages[#stages+1] = LoadActor(THEME:GetPathG("Stages","long/"..s)) .. {
-- 			SetCommand=function(self, params)
-- 				self:visible( params.StageToShow == s );
-- 			end;
-- 		}
-- 	end
-- end

-- return stages;

local t = Def.ActorFrame{};
local cur_stage= GAMESTATE:GetCurrentStage();
local Stage = GAMESTATE:GetCurrentStageIndex()+1;

if cur_stage == "Stage_Final" or cur_stage == "Stage_Extra1" or cur_stage == "Stage_Extra2" then
	t[#t+1] = Def.ActorFrame {
		LoadActor(THEME:GetPathG("Stages","long/"..cur_stage));
	};
else
	t[#t+1] = Def.ActorFrame {
		LoadActor(THEME:GetPathG("Stages","long/Stage_"..Stage));
	};
end

return t;