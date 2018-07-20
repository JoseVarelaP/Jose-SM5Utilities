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