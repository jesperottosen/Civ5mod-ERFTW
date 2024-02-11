-- Lua Script1
-- Author: jespe
-- DateCreated: 2/11/2024 9:32:47 AM
--------------------------------------------------------------
print("Loaded OK")

local iExplorerClass = GameInfoTypes.UNITCLASS_EXPLORERX
local iPrereqTech = GameInfoTypes.TECH_ARCHAEOLOGY
local iArtifact = GameInfoTypes.RESOURCE_ARTIFACTS
local iArtifactHidden = GameInfoTypes.RESOURCE_HIDDEN_ARTIFACTS
local sReturntext = ""

--------------------------------------------------------------

function SelectArtifactGoody()
	local r = 1 + Game.Rand(10, "ERFTW: Selecting an Artifact goody type")
	local goodie = 1
	if r==1 then goodie = GameInfoTypes.GOODY_ERFTW_GOLD end
	if r==2 then goodie = GameInfoTypes.GOODY_ERFTW_TECHBOOST end
	if r==3 then goodie = GameInfoTypes.GOODY_ERFTW_SETTLER end
	if r==4 then goodie = GameInfoTypes.GOODY_ERFTW_EXPERIENCE end
	if r==5 then goodie = GameInfoTypes.GOODY_ERFTW_GOLD end
	if r==6 then goodie = GameInfoTypes.GOODY_ERFTW_GOLD end
	if r==7 then goodie = GameInfoTypes.GOODY_ERFTW_SETTLER end
	if r==8 then goodie = GameInfoTypes.GOODY_ERFTW_EXPERIENCE end
	if r==9 then goodie = GameInfoTypes.GOODY_ERFTW_UPGRADE end
	if r==10 then goodie = GameInfoTypes.GOODY_ERFTW_UPGRADE end
	return goodie
end
--------------------------------------------------------------
function ValidArtifactGiveAway(iGoody,iHandicap)
	if (iGoody == GameInfoTypes.GOODY_ERFTW_GOLD) and (iHandicap==GameInfoTypes.HANDICAP_SETTLER) then return true end 
	if (iGoody == GameInfoTypes.GOODY_ERFTW_GOLD) and (iHandicap==GameInfoTypes.HANDICAP_CHIEFTAIN) then return true end 
	if (iGoody == GameInfoTypes.GOODY_ERFTW_GOLD) and (iHandicap==GameInfoTypes.HANDICAP_WARLORD) then return true end 
	if (iGoody == GameInfoTypes.GOODY_ERFTW_GOLD) and (iHandicap==GameInfoTypes.HANDICAP_PRINCE) then return true end 
	if (iGoody == GameInfoTypes.GOODY_ERFTW_GOLD) and (iHandicap==GameInfoTypes.HANDICAP_KING) then return true end 
	if (iGoody == GameInfoTypes.GOODY_ERFTW_GOLD) and (iHandicap==GameInfoTypes.HANDICAP_EMPEROR) then return true end 
	--
	if (iGoody == GameInfoTypes.GOODY_ERFTW_SETTLER) and (iHandicap==GameInfoTypes.HANDICAP_SETTLER) then return true end 
	if (iGoody == GameInfoTypes.GOODY_ERFTW_SETTLER) and (iHandicap==GameInfoTypes.HANDICAP_CHIEFTAIN) then return true end 
	--
	if (iGoody == GameInfoTypes.GOODY_ERFTW_TECHBOOST) and (iHandicap==GameInfoTypes.HANDICAP_SETTLER) then return true end 
	if (iGoody == GameInfoTypes.GOODY_ERFTW_TECHBOOST) and (iHandicap==GameInfoTypes.HANDICAP_CHIEFTAIN) then return true end 
	if (iGoody == GameInfoTypes.GOODY_ERFTW_TECHBOOST) and (iHandicap==GameInfoTypes.HANDICAP_WARLORD) then return true end 
	--
	if (iGoody == GameInfoTypes.GOODY_ERFTW_EXPERIENCE) and (iHandicap==GameInfoTypes.HANDICAP_SETTLER) then return true end 
	if (iGoody == GameInfoTypes.GOODY_ERFTW_EXPERIENCE) and (iHandicap==GameInfoTypes.HANDICAP_CHIEFTAIN) then return true end 
	if (iGoody == GameInfoTypes.GOODY_ERFTW_EXPERIENCE) and (iHandicap==GameInfoTypes.HANDICAP_WARLORD) then return true end 
	if (iGoody == GameInfoTypes.GOODY_ERFTW_EXPERIENCE) and (iHandicap==GameInfoTypes.HANDICAP_PRINCE) then return true end 
	--
	if (iGoody == GameInfoTypes.GOODY_ERFTW_UPGRADE) and (iHandicap==GameInfoTypes.HANDICAP_SETTLER) then return true end 
	if (iGoody == GameInfoTypes.GOODY_ERFTW_UPGRADE) and (iHandicap==GameInfoTypes.HANDICAP_CHIEFTAIN) then return true end 
	if (iGoody == GameInfoTypes.GOODY_ERFTW_UPGRADE) and (iHandicap==GameInfoTypes.HANDICAP_WARLORD) then return true end 
	if (iGoody == GameInfoTypes.GOODY_ERFTW_UPGRADE) and (iHandicap==GameInfoTypes.HANDICAP_PRINCE) then return true end 
	if (iGoody == GameInfoTypes.GOODY_ERFTW_UPGRADE) and (iHandicap==GameInfoTypes.HANDICAP_KING) then return true end 
	if (iGoody == GameInfoTypes.GOODY_ERFTW_UPGRADE) and (iHandicap==GameInfoTypes.HANDICAP_EMPEROR) then return true end 
	--
	return false
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
		sReturntext = " Explorer upgraded and promoted" 
	end
end

function GiveGold(pPlayer)
	local eGold = pPlayer:GetGold()
	pPlayer:SetGold(eGold+250)
	sReturntext = " 250 Gold received"
end

function GiveSettler(pPlayer,iX,iY)
	local canTrain = pPlayer:CanTrain(GameInfo.Units["UNIT_SETTLER"].ID, true, true, true, false)
	if canTrain then
		pPlayer:InitUnit(GameInfo.Units["UNIT_SETTLER"].ID, iX, iY)
		sReturntext = " Settler received" 
	else
		pPlayer:InitUnit(GameInfo.Units["UNIT_VENETIAN_MERCHANT"].ID, iX, iY)
		sReturntext = " Venetian Merchant received" 
	end
end

function GiveTechBoost(pPlayer) 
	local pTech = pPlayer:GetCurrentResearch()
	if pTech == -1 then return end

	local pTeam = Teams[pPlayer:GetTeam()]
	if ( not pTeam:IsHasTech(pTech) ) then
		local iPlayer = pPlayer:GetID()
		pTeam:SetHasTech(pTech,true,iPlayer,true,true)
		sReturntext = " Technology boost"
	end
end

function GiveExperience(pUnit)
	local exp = pUnit:GetExperience()
	pUnit:SetExperience(exp+10, -1)
	sReturntext = " 10+ Experience boost"
end

--------------------------------------------------------------
function doExploreArtifacts(iPlayer,iUnit,iX,iY)
	-- Initialize --
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

	-- Setup --
	local iHandicap = Players[Game.GetActivePlayer()]:GetHandicapType()
	local iGoody = SelectArtifactGoody()
	local valid = ValidArtifactGiveAway(iGoody,iHandicap)
	if not valid then return end
	
	print("Goody OK, Handicap OK")

	-- Act --
	if (iGoody == GameInfoTypes.GOODY_ERFTW_GOLD) then GiveGold(pPlayer) end
	if (iGoody == GameInfoTypes.GOODY_ERFTW_SETTLER) then GiveSettler(pPlayer,iX,iY) end
	if (iGoody == GameInfoTypes.GOODY_ERFTW_EXPERIENCE) then GiveExperience(pUnit) end
	if (iGoody == GameInfoTypes.GOODY_ERFTW_TECHBOOST) then GiveTechBoost(pPlayer) end
	if (iGoody == GameInfoTypes.GOODY_ERFTW_UPGRADE) then UpgradeExplorerX(pPlayer,pUnit,iX,iY) end
	if sReturntext == "" then return end
	pPlot:SetResourceType(-1, 0)

	-- Notify --
	local details = "(ERFTW) A goody bonus: "..sReturntext
	pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, sReturntext, details, iX, iY)
end
--------------------------------------------------------------

GameEvents.UnitSetXY.Add(doExploreArtifacts)