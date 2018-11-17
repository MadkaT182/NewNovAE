function GetEnjoyLevel(SongsPlayed)
	--Custom XP system for DDR created by MadkaT
	local Level = math.floor(SongsPlayed*.75);
	--Level = math.floor(Level - (Level-1)*.75)
	--Quadratic equation
	Level = (25 + math.sqrt(625 + 100 * SongsPlayed)) / 2.25
	--SCREENMAN:SystemMessage(SongsPlayed.." - "..Level);
	return math.floor(Level);
end;

function GetSerial()
	local Product = "NDX";
	local Date = "2018".."11".."17";
	local Region = "U";
	local Cabinet = "C";--A:Pre-DDR X cabinets B:DDR X cabinets C:DDR 2013 cabinets
	return Product..":"..Region..":"..Cabinet..":A:"..Date.."00";
end