return Def.ActorFrame{
	Def.Quad{
		OnCommand=function(self)
			self:x(SCREEN_CENTER_X-294);
			self:y(SCREEN_CENTER_Y+87);
			self:vertalign('top');
			self:horizalign('left');
			self:zoomto(276,100);
			self:diffuse(0,0,0,.5);
		end;
		OffCommand=cmd(linear,0.5;addx,-SCREEN_WIDTH);
	};
}