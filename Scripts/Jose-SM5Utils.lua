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