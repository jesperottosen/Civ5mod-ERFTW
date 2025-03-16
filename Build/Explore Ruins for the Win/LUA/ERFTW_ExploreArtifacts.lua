-- Lua Script1
-- Author: jespe
-- DateCreated: 2/11/2024 9:32:47 AM
--------------------------------------------------------------
print("Loaded OK")

local iExplorerClass = GameInfoTypes.UNITCLASS_EXPLORERX
local iPrereqTech = GameInfoTypes.TECH_ARCHAEOLOGY
local iArtifact = GameInfoTypes.RESOURCE_ARTIFACTS
local iArtifactHidden = GameInfoTypes.RESOURCE_HIDDEN_ARTIFACTS

--------------------------------------------------------------

function SelectArtifactGoody()
	local r = 1 + Game.Rand(6, "ERFTW: Selecting an Artifact goody type")
	local goodie = 1
	if r==1 then goodie = GameInfoTypes.GOODY_ERFTW_GOLD end
	if r==2 then goodie = GameInfoTypes.GOODY_ERFTW_TECHBOOST end
	if r==3 then goodie = GameInfoTypes.GOODY_ERFTW_SETTLER end
	if r==4 then goodie = GameInfoTypes.GOODY_ERFTW_EXPERIENCE end
	if r==5 then goodie = GameInfoTypes.GOODY_ERFTW_GOLDENERA end
	if r==6 then goodie = GameInfoTypes.GOODY_ERFTW_CULTURE end
	return goodie
end

--------------------------------------------------------------
function UpgradeExplorer(pPlayer,pUnit,iX,iY)
	local canTrain = pPlayer:CanTrain(GameInfo.Units["UNIT_RIFLEMAN"].ID, true, true, true, false)
	if canTrain then	
		local pNewUnit = pPlayer:InitUnit(GameInfo.Units["UNIT_RIFLEMAN"].ID, iX, iY)
		pUnit:Kill(true, -1)
		local iPromo1 = GameInfoTypes.PROMOTION_IGNORE_TERRAIN_COST
		local iPromo2 = GameInfoTypes.PROMOTION_EXTRA_SIGHT_I
		pNewUnit:SetHasPromotion(iPromo1, true)
		pNewUnit:SetHasPromotion(iPromo2, true)
		return " Explorer upgraded" 
	end
	return ""
end

function GiveGold(pPlayer)
	local eGold = pPlayer:GetGold()
	pPlayer:SetGold(eGold+500)
	return " 500 Gold received"
end

function GiveSettler(pPlayer,iX,iY)
	local canTrain = pPlayer:CanTrain(GameInfo.Units["UNIT_SETTLER"].ID, true, true, true, false)
	if canTrain then
		pPlayer:InitUnit(GameInfo.Units["UNIT_SETTLER"].ID, iX, iY)
		return " Settler received" 
	else
		pPlayer:InitUnit(GameInfo.Units["UNIT_VENETIAN_MERCHANT"].ID, iX, iY)
		return " Venetian Merchant received" 
	end
end

function GiveTechBoost(pPlayer) 
	local pTech = pPlayer:GetCurrentResearch()
	if pTech == -1 then return end

	local pTeam = Teams[pPlayer:GetTeam()]
	if ( not pTeam:IsHasTech(pTech) ) then
		local iPlayer = pPlayer:GetID()
		pTeam:SetHasTech(pTech,true,iPlayer,true,true)
		return " Technology boost"
	end
	return ""
end

function GiveExperience(pUnit)
	local exp = pUnit:GetExperience()
	pUnit:SetExperience(exp+10, -1)
	return " 10+ Experience boost"
end

function GiveGoldenEra(pPlayer)
	local iEras = pPlayer:GetGoldenAgeLength()
	pPlayer:ChangeGoldenAgeTurns(iEras+10)
	return " 10 more Golden Era turns"
end

function GiveCulture(pPlayer)
	local iCulture = pPlayer:GetJONSCulture()
	pPlayer:ChangeJONSCulture(250) 
	return " 250 more culture"
end

--------------------------------------------------------------
function doExploreArtifacts(iPlayer,iUnit,iX,iY)
	-- Initialize --
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	local pClass = pUnit:GetUnitClassType()
	if (pClass ~= iExplorerClass) then return end

	local pTeamTechs = Teams[ pPlayer:GetTeam() ]:GetTeamTechs()
	if not (pTeamTechs:HasTech(iPrereqTech)) then return end

	local pPlot = Map.GetPlot(iX,iY)
	if not pPlot then return end
	if (pPlot:IsCity()) then return end
	
	local pResource = pPlot:GetResourceType(Game.GetActiveTeam())
	if (pResource ~= iArtifact) and (pResource~= iArtifactHidden) then return end
	
	print("Unit OK, Tech OK, Plot OK, Ressource OK")

	-- Act --
	local iGoody = SelectArtifactGoody()
	local sReturntext = ""
	if (iGoody == GameInfoTypes.GOODY_ERFTW_GOLD) then sReturntext = GiveGold(pPlayer) end
	if (iGoody == GameInfoTypes.GOODY_ERFTW_SETTLER) then sReturntext = GiveSettler(pPlayer,iX,iY) end
	if (iGoody == GameInfoTypes.GOODY_ERFTW_EXPERIENCE) then sReturntext = GiveExperience(pUnit) end
	if (iGoody == GameInfoTypes.GOODY_ERFTW_TECHBOOST) then sReturntext = GiveTechBoost(pPlayer) end
	if (iGoody == GameInfoTypes.GOODY_ERFTW_GOLDENERA) then sReturntext = GiveGoldenEra(pPlayer) end
	if (iGoody == GameInfoTypes.GOODY_ERFTW_CULTURE) then sReturntext = GiveCulture(pPlayer) end
	if (iGoody == GameInfoTypes.GOODY_ERFTW_UPGRADE) then sReturntext = UpgradeExplorer(pPlayer,pUnit,iX,iY) end
	if sReturntext == "" then return end
	pPlot:SetResourceType(-1, 0)
	pPlot:SetImprovementType(-1)

	-- Notify --
	local details = "(ERFTW) A goody bonus: "..sReturntext
	local iNotifyType = NotificationTypes["NotificationTypes.NOTIFICATION_GENERIC"]
	pPlayer:AddNotification(iNotifyType, sReturntext, details, iX, iY)
end
--------------------------------------------------------------

GameEvents.UnitSetXY.Add(doExploreArtifacts)