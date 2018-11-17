local t = Def.ActorFrame {};

--Background
t[#t+1] = LoadActor("bg")..{};

--Song Information
t[#t+1] = LoadFont("Common normal") .. {
	InitCommand=cmd(horizalign,left;x,-109;y,-7;zoom,.8;maxwidth,270);
	CurrentSongChangedMessageCommand=cmd(playcommand,"Refresh");
	RefreshCommand=function(self)
		local vSong = GAMESTATE:GetCurrentSong();
		local vCourse = GAMESTATE:GetCurrentCourse();
		local sText = ""
		sText = vSong:GetDisplayFullTitle()
		self:settext( sText );
	end;
}

--Artist Information
t[#t+1] = LoadFont("Common normal") .. {
InitCommand=cmd(horizalign,left;x,-109;y,9;zoom,.66;maxwidth,330);
	CurrentSongChangedMessageCommand=cmd(playcommand,"Refresh");
	RefreshCommand=function(self)
		local vSong = GAMESTATE:GetCurrentSong();
		local vCourse = GAMESTATE:GetCurrentCourse();
		local sText = ""
		sText = vSong:GetDisplayArtist()
		self:settext( sText );
	end;
}

return t;