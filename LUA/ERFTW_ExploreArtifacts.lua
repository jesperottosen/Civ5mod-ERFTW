-- Lua Script1
-- Author: jespe
-- DateCreated: 2/11/2024 9:32:47 AM
--------------------------------------------------------------
print("Loaded OK")

local iExplorerClass = GameInfoTypes.UNITCLASS_EXPLORERX
local iPrereqTech = GameInfoTypes.TECH_ARCHAEOLOGY
local iArtifact = GameInfoTypes.RESOURCE_ARTIFACTS
local iArtifactHidden = GameInfoTypes.RESOURCE_HIDDEN_ARTIFACTS
local sReturntext = "hello mum"

--------------------------------------------------------------
function doExploreArtifacts(iPlayer,iUnit,iX,iY)
	-- Assert --
	local pPlot = Map.GetPlot(iX,iY)
	if not pPlot then return end
	
	local pPlayer = Players[iPlayer]
	local pTeamTechs = Teams[ pPlayer:GetTeam() ]:GetTeamTechs()
	if not (pTeamTechs:HasTech(iPrereqTech)) then return end

	local pResource = pPlot:GetResourceType(Game.GetActiveTeam())
	if (pResource ~= iArtifact) and (pResource~= iArtifactHidden) then return end

	local pUnit = pPlayer:GetUnitByID(iUnit)
	local pClass = pUnit:GetUnitClassType()
	if (pClass ~= iExplorerClass) then return end

	print("Plot OK, Tech OK, Ressource OK, Unit OK")
	-- Act --

	

	pPlot:SetResourceType(-1, 0)

	-- Notify --
	local notifyType = GameInfoTypes.NOTIFICATION_GENERIC
	local details = "(ERFTW) A goody bonus: "..sReturntext
	pPlayer:AddNotification(notifyType, sReturntext, details, iX, iY)
end
--------------------------------------------------------------

GameEvents.UnitSetXY.Add(doExploreArtifacts)