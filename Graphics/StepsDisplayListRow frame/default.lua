
local t = Def.ActorFrame{};

local CustomDifficultyToColor = {
	Beginner	= "#66E6FF",
	Easy		= "#E6E619",
	Medium		= "#FF8080",
	Hard		= "#66FF66",
	Challenge	= "#B399FF",
	Edit		= "#AAAAAA",
};

t[#t+1] = Def.ActorFrame{

	LoadFont("StepsDisplay ticks")..{
		Name="meterbase";
		InitCommand=cmd(x,42;horizalign,left;settext,string.rep("1",10));
	};
	LoadFont("StepsDisplay ticks")..{
		Name="tmeter";
		InitCommand=cmd(x,42;horizalign,left);
	};
	LoadFont("StepsDisplay ticks")..{
		Name="hmeter";
		InitCommand=cmd(x,42;horizalign,left;diffuse,color("#FF0000"));
	};
	LoadFont("DifficultyList")..{
		Name="dname";
		InitCommand=cmd(x,-68;horizalign,left;shadowlength,2;zoom,.62;maxwidth,170);
	};

	SetCommand=function(self, param)
		local tmeter = self:GetChild('tmeter');
		local hmeter = self:GetChild('hmeter');
		local dname = self:GetChild('dname');
		local song = "";
		local step;
		local meter;
		local cdiff = param.CustomDifficulty;
		self:stoptweening();
		dname:visible(false);
		tmeter:visible(false);
		if cdiff then
			step = param.Steps;
			meter = param.Meter;
			dname:visible(true);
			dname:settext(CustomDifficultyToLocalizedString(cdiff));
			dname:diffuse(color(CustomDifficultyToColor[cdiff]));

			if getenv("wheelstop") == 1 then
				song = GAMESTATE:GetCurrentSong();
				if GetAdhocPref("UserMeterType") == "CSStyle" then
					if song then
						if cdiff ~= "Edit" then
							meter = GetConvertDifficulty(song,"Difficulty_"..cdiff);
						else
							meter = GetConvertDifficulty(song,"Difficulty_Edit",step);
						end;
					else
						meter = "";
					end;
				end;
			else
				song = "";
			end;
			if meter then
				local fixmeter = 0;
				local xmeter = 0;
				if meter > 10 then
					fixmeter = 10;
					xmeter = meter -10;
					if xmeter > 10 then
						xmeter = 10
					end
					tmeter:textglowmode('TextGlowMode_Inner');
					tmeter:diffuseshift();
					tmeter:effectcolor1(color(CustomDifficultyToColor[cdiff]));
					tmeter:effectcolor2(1,1,1,1);
				else
					fixmeter = meter;
					tmeter:stopeffect();
				end
				tmeter:visible(true);
				hmeter:visible(true);
				tmeter:settext(string.rep("0",fixmeter));
				hmeter:settext(string.rep("0",xmeter));
				tmeter:diffuse(color(CustomDifficultyToColor[cdiff]));
			end;
		end;
	end;
};

return t;
