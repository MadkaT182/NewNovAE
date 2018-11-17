return Def.ActorFrame {
	LoadFont("DifficultyList") .. {
		BeginCommand=cmd(horizalign,left;diffuse,color("#EEEEEE");zoom,.8;shadowlength,3;playcommand,"Update");
		UpdateCommand=function(self)
			local so = GAMESTATE:GetSortOrder();
			if so ~= nil then
				if so == "SortOrder_Group" then
					self:settext("GROUP");
				elseif so == "SortOrder_Title" then
					self:settext("ALPHABETICAL");
				elseif so == "SortOrder_Popularity" then
					self:settext("Player's Best");
				elseif so == "SortOrder_BPM" then
					self:settext("BPM");
				elseif so == "SortOrder_Artist" then
					self:settext("Artist");
				elseif so == "SortOrder_Title" then
					self:settext("Title");
				elseif so == "SortOrder_Preferred" then
					self:settext("ALL MUSIC");
				else
				self:settext(SortOrderToLocalizedString(so));
				end;
			end;
		end;
		SortOrderChangedMessageCommand=function(self)
		self:queuecommand("Update");
		end;
	};
};