--[[
	Jose-SM5Utilities
	This is the list of useful ultilities that can be used later on your SM5 themes,
	stepfiles, programs, or whatever works on those. That's pretty much the whole point.

	You can contribute adding stuff via Pull Requests too, if you want.
]]

-- < ------------------------------------- > --
-- 				Radar Value
-- Gives the radar value of a player's steps.
-- < ------------------------------------- > --
function RadarValue(pn,n)
	-- < ------------------------------------- > --
	-- SCREENNETSELECTMUSIC would spit out errors during,
	-- in [player] inpairs instances, so this check had to be made.
	-- < ------------------------------------- > --
	local RadarValueToSend = 0
	
	if GAMESTATE:IsPlayerEnabled(pn) and GAMESTATE:IsHumanPlayer(pn) then
		
		local Steps = GAMESTATE:GetCurrentSteps(pn)
		if Steps == nil then return 0 end

		local RadVa = Steps:GetRadarValues(pn)
		RadarValueToSend = RadVa:GetValue(n) or 0

	end

	return RadarValueToSend
end

-- < ------------------------------------- > --
-- 			Difficulty Name Giver
--[[
	Usage is simple.

	You have two choices, Regular steps, or Course steps.
	After that, the second value is the player in will the difficulty
	will be analized, and given a result.
]]
-- < ------------------------------------- > --
function DifficultyName( name, pn )
	-- List of choices
	local ToGet = {
	["Steps"] = GAMESTATE:GetCurrentSteps(pn),
	["Trail"] = GAMESTATE:GetCurrentTrail(pn),
	}

	if ToGet[name] then
		--[[
			Because of the way Difficulty is given in StepMania 5, I
			decided to cut it down, so now, the difficulty, instead of
			being this, will become this.
				
				"Difficulty_Hard" -> "Hard"

			In which, it will be easier to translate into the [Difficulty]
			translation container.
		]]
		local Shorten = ToEnumShortString( ToGet[name]:GetDifficulty() )
		return THEME:GetString("Difficulty", Shorten)
	else
		return "Error!"
	end
end

-- < ------------------------------------- > --
-- 			Individual Text Rainbow
--[[
	It's really bad looking, yes.

	name: will be the text (or in this case, letter) to tween
	n1: X offset
	n2: effect offset of rainbow

	Later: wIl try to make it parse a text string to separate it into
	a complete text, so you don't have to make individual actors for
	each letter.
]]
-- < ------------------------------------- > --
local function ITR(name, n1, n2)
	local t = Def.ActorFrame{ OnCommand=cmd(x,-15;zoom,1.5;bob;effectmagnitude,0,5,0;effectoffset,n2);
				Def.BitmapText{ Font="Common Normal", Text=name, InitCommand=cmd(strokecolor,color("0,0,0,1");x,-6+(12*n1);rainbow;effectoffset,n2); },
			};

	return t;
end 

-- < ------------------------------------- > --

-- (c) 2018 Jose_Varela
-- All rights reserved.
--
-- Permission is hereby granted, free of charge, to any person obtaining a
-- copy of this software and associated documentation files (the
-- "Software"), to deal in the Software without restriction, including
-- without limitation the rights to use, copy, modify, merge, publish,
-- distribute, and/or sell copies of the Software, and to permit persons to
-- whom the Software is furnished to do so, provided that the above
-- copyright notice(s) and this permission notice appear in all copies of
-- the Software and that both the above copyright notice(s) and this
-- permission notice appear in supporting documentation.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
-- OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-- MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT OF
-- THIRD PARTY RIGHTS. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR HOLDERS
-- INCLUDED IN THIS NOTICE BE LIABLE FOR ANY CLAIM, OR ANY SPECIAL INDIRECT
-- OR CONSEQUENTIAL DAMAGES, OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS
-- OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
-- OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
-- PERFORMANCE OF THIS SOFTWARE.