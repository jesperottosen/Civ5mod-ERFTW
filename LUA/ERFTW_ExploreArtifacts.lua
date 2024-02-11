-- Lua Script1
-- Author: jespe
-- DateCreated: 2/11/2024 9:32:47 AM
--------------------------------------------------------------
print("Loaded OK")

-- local iExplorerClass = GameInfoTypes.UNITCLASS_EXPLORERX
local iPrereqTech = GameInfoTypes.TECH_ARCHAEOLOGY
local iArtifactRess = GameInfoTypes.RESOURCE_ARTIFACTS
local iArtifactHidden = GameInfoTypes.RESOURCE_HIDDEN_ARTIFACTS
local sReturntext = ""

--------------------------------------------------------------
function doExploreArtifacts(iPlayer,iUnit,iX,iY)
	local pPlot = Map.GetPlot(iX,iY)
	if not pPlot then return end
	
	local pResource = pPlot:GetResourceType(Game.GetActiveTeam())
	if (pResource ~= iArtifactRess) and (pResource~= iArtifactHidden) then return end

	print("Plot OK, Ressource OK, Unit ??")


end
--------------------------------------------------------------

GameEvents.UnitSetXY.Add(doExploreArtifacts)