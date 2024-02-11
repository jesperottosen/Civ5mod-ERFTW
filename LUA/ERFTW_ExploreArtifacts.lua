-- Lua Script1
-- Author: jespe
-- DateCreated: 2/11/2024 9:32:47 AM
--------------------------------------------------------------
print("Loaded OK")

-- local iExplorerClass = GameInfoTypes.UNITCLASS_EXPLORERX
local iPrereqTech = GameInfoTypes.TECH_ARCHAEOLOGY
local iArtifactRess = GameInfoTypes.RESOURCE_ARTIFACTS
local iArtifactHidden = GameInfoTypes.RESOURCE_HIDDEN_ARTIFACTS
local sReturntext = "hello mum"

--------------------------------------------------------------
function doExploreArtifacts(iPlayer,iUnit,iX,iY)
	-- Assert --
	local pPlot = Map.GetPlot(iX,iY)
	if not pPlot then return end
	
	local pResource = pPlot:GetResourceType(Game.GetActiveTeam())
	if (pResource ~= iArtifactRess) and (pResource~= iArtifactHidden) then return end

	
	print("Plot OK, Ressource OK, Unit ??")
	-- Act --

	local pPlayer = Players[iPlayer]


	-- Notify --
	print("sreturn: "..sReturntext)
		local notifyType = GameInfoTypes.NOTIFICATION_GOODY
		local details = "(ERFTW) A goody bonus: "..sReturntext
		print("details: "..details)
	pPlayer:AddNotification(notifyType, sReturntext, details, iX, iY)
end
--------------------------------------------------------------

GameEvents.UnitSetXY.Add(doExploreArtifacts)