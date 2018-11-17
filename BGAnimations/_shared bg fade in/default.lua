return Def.ActorFrame{
	Def.Quad{
		OnCommand=function(self)
			self:zoom(0);
			self:sleep(0.5);
		end;
	};
	LoadActor("../_shared background");
	LoadActor("../_fade in");
}